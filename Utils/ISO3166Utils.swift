// Copyright © 2021 Bradford Holcombe. All rights reserved.

import Foundation

/**
 Utility for working with ISO3166 country codes. Codes are mostly loaded from bundle file, but
 some codes are added for API -specific mappings.

 ### Example
    if let alpha3 = CountryUtility.shared.getCountryCode2( countryCode )
    {
      print(alpha3) ///result: PRT
    }
 */
struct CountryUtility
{
   /** Singleton. */
   static var shared: CountryUtility = CountryUtility()

   /** Map of alpha 2 codes to alpha 3 codes. */
   private var countryCodeMap2To3: [ String: String ] = [:]

   /** Map of alpha 3 codes to alpha 2 codes. */
   private var countryCodeMap3To2: [ String: String ] = [:]

   /**
    Makes a new utility.
    */
   init()
   {
      guard let pListFilePath: String = Bundle.main.path( forResource: "iso3166_1_2_to_iso3166_1_3", ofType: "plist" ),
            let data: NSData = NSData( contentsOfFile: pListFilePath ) else { return }
      let propertyList: Any? = try? PropertyListSerialization.propertyList( from: data as Data, format: nil )
      countryCodeMap2To3 = propertyList as? [ String: String ] ?? [:]

      for ( country2, country3 ) in countryCodeMap2To3
      {
         countryCodeMap3To2[ country3 ] = country2
      }

      // alternates, DATABASE CORRECTION
      countryCodeMap3To2[ "GER" ] = "DE" // Germany
      countryCodeMap3To2[ "DEU" ] = "DE" // Germany
      countryCodeMap3To2[ "EUR" ] = "EU" // European Union
      countryCodeMap3To2[ "ENG" ] = "GB" // England/UK
      countryCodeMap3To2[ "UAE" ] = "AE" // United Arab Emirates
      countryCodeMap3To2[ "SIN" ] = "SG" // Singapore
      countryCodeMap3To2[ "TDC" ] = "DK" // Denmark

      countryCodeMap2To3[ "EU" ] = "EUR" // European Union
   }

   /**
    Converts ISO 3166-1 alpha2 to alpha3.

    ### Example
        list alpha3: String = getCountryCode3( "PT" )  // returns "PRT"
    */
   func getCountryCode3( _ countryCode2: String ) -> String?
   {
      let count: Int = countryCode2.count
      if count == 3 { return countryCode2 }
      return countryCodeMap2To3[ countryCode2 ]
   }

   /**
    Converts ISO 3166-1 alpha3 to alpha2.

    ### Example
         list alpha2: String = getCountryCode3( "PRT" )  // returns "PT"
    */
   func getCountryCode2( _ countryCode3: String ) -> String?
   {
      let count: Int = countryCode3.count
      if count == 2 { return countryCode3 }
      return countryCodeMap3To2[ countryCode3 ]
   }
}
