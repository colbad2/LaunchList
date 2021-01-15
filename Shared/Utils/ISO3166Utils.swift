// Copyright © 2021 Bradford Holcombe. All rights reserved.

import Foundation

/**
 # Example
 if let alpha3 = CountryUtility.shared.getCountryCode2( countryCode )
 {
   print(alpha3) ///result: PRT
 }
 */
struct CountryUtility
{
   public static var shared: CountryUtility = CountryUtility()
   private var countryCodeMap2To3: [ String: String ] = [:]
   private var countryCodeMap3To2: [ String: String ] = [:]

   init()
   {
      let pListFilePath = Bundle.main.path( forResource: "iso3166_1_2_to_iso3166_1_3", ofType: "plist" )
      let data = NSData( contentsOfFile: pListFilePath! )!
      let propertyList: Any? = try? PropertyListSerialization.propertyList( from: data as Data, format: nil )
      countryCodeMap2To3 = propertyList as? [ String: String ] ?? [:]

      for ( country2, country3 ) in countryCodeMap2To3
      {
         countryCodeMap3To2[ country3 ] = country2
      }

      // alternates
      countryCodeMap3To2[ "GER" ] = "DE" // Germany
      countryCodeMap3To2[ "DEU" ] = "DE" // Germany
      countryCodeMap3To2[ "EUR" ] = "EU" // European Union
      countryCodeMap3To2[ "ENG" ] = "GB" // England/UK
      countryCodeMap3To2[ "UAE" ] = "AE" // United Arab Emirates
      countryCodeMap3To2[ "SIN" ] = "SG" // Singapore
      countryCodeMap3To2[ "TDC" ] = "DK" // Denmark

      countryCodeMap2To3[ "EU" ] = "EUR" // European Union
   }

   /// Convertion ISO 3166-1-Alpha2 to Alpha3
   /// Country code of 2 letters to 3 letters code
   /// E.g: PT to PRT
   func getCountryCode3( _ countryCode2: String ) -> String?
   {
      let count = countryCode2.count
      if count == 3 { return countryCode2 }
      return countryCodeMap2To3[ countryCode2 ]
   }

   func getCountryCode2( _ countryCode3: String ) -> String?
   {
      let count = countryCode3.count
      if count == 2 { return countryCode3 }
      return countryCodeMap3To2[ countryCode3 ]
   }

//   static func getLocalCountryCode() -> String?
//   {
//      return NSLocale.current.regionCode
//   }
//
//   /// This function will get full country name based on the phone Locale
//   /// E.g. Portugal
//   static func getLocalCountry() -> String?
//   {
//      let countryLocale = NSLocale.current
//      guard let countryCode = countryLocale.regionCode else { return nil }
//      return (countryLocale as NSLocale).displayName( forKey: NSLocale.Key.countryCode, value: countryCode )
//   }
}
