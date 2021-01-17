// Copyright © 2021 Bradford Holcombe. All rights reserved.

import Foundation

/**
 Parser for ISO dates. Use on main thread only.
 */
public struct ISOParser
{
   static var shared: ISOParser = ISOParser()
   var dateFormatter: DateFormatter
   var tightDateFormatter: DateFormatter
   var timeFormatter: DateFormatter

   init()
   {
      dateFormatter = DateFormatter()
      dateFormatter.locale = Locale( identifier: "en_US_POSIX" ) // set locale to reliable US_POSIX
      dateFormatter.dateFormat = "yyyy-MM-dd"

      tightDateFormatter = DateFormatter()
      tightDateFormatter.locale = Locale( identifier: "en_US_POSIX" ) // set locale to reliable US_POSIX
      tightDateFormatter.dateFormat = "ddMMMyy HH:mm z"

      timeFormatter = DateFormatter()
      timeFormatter.locale = Locale( identifier: "en_US_POSIX" ) // set locale to reliable US_POSIX
      timeFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
   }
}

/**
 Parse an ISO date string into a `Date`.

 - parameter isoDate: `String? ` date to parse
 - returns: `Date?` parsed date, if possible, nil otherwise
 */
public func parseISODate( isoDate: String? ) -> Date?
{
   guard let isoDate = isoDate else { return nil }
   return ISOParser.shared.timeFormatter.date( from: isoDate )
}

/**
 Format a `Date` into a full string.

 - parameter date: `Date?` date to format
 - returns: `String` formatted date if possible, empty string if not
 */
public func dateString( _ date: Date? ) -> String
{
   guard let date = date else { return "" }
   return ISOParser.shared.dateFormatter.string( from: date )
}

/**
 Format a `Date` into a small string.

 - parameter date: `Date?` date to format
 - returns: `String` formatted date if possible, empty string if not
 */
public func tightDateString( _ date: Date? ) -> String
{
   guard let date = date else { return "" }
   return ISOParser.shared.tightDateFormatter.string( from: date )
}

/**
 Get a `URL` for a URL string, if possible.

 - parameter urlString: `String?` URL string to make a `URL` from
 - returns: `URL?` `URL` if possible, nil otherwise
 */
public func wrapURL( _ urlString: String? ) -> URL?
{
   guard let url = urlString else { return nil }
   if url.trim() == "" { return nil }
   return URL( string: url )
}

// swiftlint:disable pattern_matching_keywords

/**
 Produce a JSON structure of the given type `T` from a file. `T` is determined from context.

 - parameter filename: `String` filename of bundle JSON file to parse
 - returns: `T?` parsed JSON struct, if possible
 */
public func parseJSONFile<T: Decodable>( filename: String ) -> T?
{
   let decoder: JSONDecoder = JSONDecoder()
   decoder.keyDecodingStrategy = .convertFromSnakeCase

   do
   {
      if let jsonData: Data = readBundleJSONFile( forName: filename )
      {
         return try decoder.decode( T.self, from: jsonData )
      }
   }
   catch let error as DecodingError
   {
      switch error
      {
         case .typeMismatch( let key, let value ):
            print( "ERROR \(key), value \(value): \(error.localizedDescription)" )
         case .valueNotFound( let key, let value ):
            print( "ERROR \(key), value \(value): \(error.localizedDescription)" )
         case .keyNotFound( let key, let value ):
            print( "ERROR \(key), value \(value): \(error.localizedDescription)" )
         case .dataCorrupted( let key ):
            print( "ERROR \(key): \(error.localizedDescription)" )
         default:
            print( "ERROR: \(error.localizedDescription)" )
      }
   }
   catch { print( "error: ", error ) }

   return nil
}

/**
 Produce a JSON structure of the given type `T` from a string. `T` is determined from context.

 - parameter json: `String`  JSON to parse
 - returns: `T?` parsed JSON struct, if possible
 */
public func parseJSONString<T: Decodable>( json: String ) -> T?
{
   let decoder: JSONDecoder = JSONDecoder()
   decoder.keyDecodingStrategy = .convertFromSnakeCase

   do
   {
      if let jsonData: Data = json.data( using: .utf8 )
      {
         return try decoder.decode( T.self, from: jsonData )
      }
   }
   catch let error as DecodingError
   {
      switch error
      {
         case .typeMismatch( let key, let value ):
            print( "ERROR \(key), value \(value): \(error.localizedDescription)" )
         case .valueNotFound( let key, let value ):
            print( "ERROR \(key), value \(value): \(error.localizedDescription)" )
         case .keyNotFound( let key, let value ):
            print( "ERROR \(key), value \(value): \(error.localizedDescription)" )
         case .dataCorrupted( let key ):
            print( "ERROR \(key): \(error.localizedDescription)" )
         default:
            print( "ERROR: \(error.localizedDescription)" )
      }
   }
   catch { print( "error: ", error ) }

   return nil
}

/** Map of agencies to their country codes. */
public let countryCodeCorrections: [ String: String ] = // DATABASE CORRECTION
   [
      "Canadian Space Agency": "CAN",
      "National Aeronautics and Space Administration": "USA",
      "China National Space Administration": "CHN",
      "Arianespace": "FRA",
      "Boeing": "USA",
      "European Space Agency": "EU",
      "Japan Aerospace Exploration Agency": "JPN",
      "North American Aviation": "USA",
      "Northrop Grumman Innovation Systems": "USA",
      "Russian Federal Space Agency (ROSCOSMOS)": "RUS",
      "Sierra Nevada Corporation": "USA",
      "Soviet Space Program": "SUN",
      "SpaceX": "USA"
   ]

/**
 Gets an array of ISO 3166 country codes from a comma-delimited string of them. There is a bunch
 of error correction, because the API database has errors. Errors include: missing commas, using a
 slash instead of a comma.

 - parameter countryCode: `String?` comma-separated list of ISO 3166 country codes
 - returns:               `[String]` array of country codes parsed from the input, never nil
 */
public func getCountryCodes( countryCode: String? ) -> [String]
{
   if countryCode == nil { return [] }

   var codes: [String] = []
   if let agencyCodes: String = countryCode
   {
      let codeList: [Substring] = agencyCodes.split( separator: "," )
      for code in codeList
      {
         let country: String = String( code ).trim()
         if country.count == 6 // DATABASE CORRECTION
         {
            codes.append( String( country.prefix( 3 ) ) )
            codes.append( String( country.suffix( 3 ) ) )
         }
         else if country.contains( "/" )
         {
            let countryParts: [Substring] = country.split( separator: "/" )
            codes.append( String( countryParts[ 0 ] ) )
            codes.append( String( countryParts[ 1 ] ) )
         }
         else
         {
            codes.append( country )
         }
      }
   }

   if codes.isEmpty { return [] }

   return codes
}
