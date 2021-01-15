import Foundation

// use on main thread only
struct ISOParser
{
   static var shared = ISOParser()
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

func parseISODate( isoDate: String? ) -> Date?
{
   guard let isoDate = isoDate else { return nil }
   return ISOParser.shared.timeFormatter.date( from: isoDate )
}

func dateString( _ d: Date? ) -> String
{
   guard let d = d else { return "" }
   return ISOParser.shared.dateFormatter.string( from: d )
}

func tightDateString( _ d: Date? ) -> String
{
   guard let d = d else { return "" }
   return ISOParser.shared.tightDateFormatter.string( from: d )
}

func wrapURL( _ url: String? ) -> URL?
{
   if url == nil || url!.trim() == "" { return nil }
   return URL( string: url! )
}

func parseJSONFile<T: Decodable>( filename: String ) -> T?
{
   let decoder = JSONDecoder()
   decoder.keyDecodingStrategy = .convertFromSnakeCase

   do
   {
      let jsonData = readBundleJSONFile( forName: filename )!
      return try decoder.decode( T.self, from: jsonData )
   }
   catch DecodingError.dataCorrupted( let context ) { print( context ) }
   catch DecodingError.keyNotFound( let key, let context )
   {
       print( "Key '\(key)' not found:", context.debugDescription )
       print( "codingPath:", context.codingPath )
   }
   catch DecodingError.valueNotFound( let value, let context )
   {
       print( "Value '\(value)' not found:", context.debugDescription )
       print( "codingPath:", context.codingPath )
   }
   catch DecodingError.typeMismatch(let type, let context )
   {
       print( "Type '\(type)' mismatch:", context.debugDescription )
       print( "codingPath:", context.codingPath )
   }
   catch { print( "error: ", error ) }

   return nil
}

func parseJSONString<T: Decodable>( json: String ) -> T?
{
   let decoder = JSONDecoder()
   decoder.keyDecodingStrategy = .convertFromSnakeCase

   do
   {
      let jsonData = json.data( using: .utf8 )!
      return try decoder.decode( T.self, from: jsonData )
   }
   catch DecodingError.dataCorrupted( let context ) { print( context ) }
   catch DecodingError.keyNotFound( let key, let context )
   {
       print( "Key '\(key)' not found:", context.debugDescription )
       print( "codingPath:", context.codingPath )
   }
   catch DecodingError.valueNotFound( let value, let context )
   {
       print( "Value '\(value)' not found:", context.debugDescription )
       print( "codingPath:", context.codingPath )
   }
   catch DecodingError.typeMismatch(let type, let context )
   {
       print( "Type '\(type)' mismatch:", context.debugDescription )
       print( "codingPath:", context.codingPath )
   }
   catch { print( "error: ", error ) }

   return nil
}
