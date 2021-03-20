// Copyright © 2021 Bradford Holcombe. All rights reserved.

import Foundation

/**
 Utility functions on `String`s.
 */
extension String
{
   /**
    Returns a `String` with the UTF-8 escapes decoded.

    - returns: `String` decoded string
    */
   func utf8DecodedString() -> String
   {
      if let data: Data = data( using: .utf8 ),
         let message: String = String( data: data, encoding: .nonLossyASCII )
      {
         return message
      }

      return ""
   }

   /**
    Returns a `String` with the UTF-8 escapes encoded.

    - returns: `String` encoded string
    */
   func utf8EncodedString() -> String
   {
      if let messageData: Data = data( using: .nonLossyASCII ),
         let encodedString: String = String( data: messageData, encoding: .utf8 )
      {
         return encodedString
      }

      return ""
   }

   /**
    Replace bad UTF encodings.

    - returns: `String` string with bad UTF encodings converted to real UTF characters
    */
   func fixBadUTF() -> String
   {
      if !self.contains( "Ã" ) { return self }

      return self.replacingOccurrences( of: "Ã©", with: "é" )
         .replacingOccurrences( of: "Ã«", with: "ë" )
         .replacingOccurrences( of: "Ã¬", with: "ì" )
         .replacingOccurrences( of: "Ã¹", with: "ù" )
         .replacingOccurrences( of: "Ã¥", with: "å" )
         .replacingOccurrences( of: "Ã¤", with: "ä" )
         .replacingOccurrences( of: "Ã¶", with: "ö" )
         .replacingOccurrences( of: "Ã¼", with: "ü" )
         .replacingOccurrences( of: "Ã‰", with: "É" )
         .replacingOccurrences( of: "â€œ", with: "\"" )
         .replacingOccurrences( of: "â€", with: "\"" )
         .replacingOccurrences( of: "Ã‡", with: "Ç" )
         .replacingOccurrences( of: "Ãƒ", with: "Ã" )
         .replacingOccurrences( of: "â€¢", with: "-" )
         .replacingOccurrences( of: "Ã˜", with: "Ø" )
         .replacingOccurrences( of: "Ãµ", with: "õ" )
         .replacingOccurrences( of: "Ã¢", with: "â" )
         .replacingOccurrences( of: "Ã£", with: "ã" )
         .replacingOccurrences( of: "Ãª", with: "ê" )
         .replacingOccurrences( of: "Ã¡", with: "á" )
         .replacingOccurrences( of: "Ã³", with: "ó" )
         .replacingOccurrences( of: "â€“", with: "–" )
         .replacingOccurrences( of: "Ã§", with: "ç" )
         .replacingOccurrences( of: "Âª", with: "ª" )
         .replacingOccurrences( of: "Ã„", with: "Ä" )
         .replacingOccurrences( of: "Â¨", with: "¨" )
         .replacingOccurrences( of: "Â´", with: "´" )
         .replacingOccurrences( of: "Ã´", with: "ô" )
         .replacingOccurrences( of: "Â°", with: "°" )
   }

   /**
    Remove the given prefix from a string.

    - parameter prefix: `String` prefix to remove
    - returns: `String` string with prefix removed, if necessary
    */
   func removePrefix( _ prefix: String ) -> String
   {
      guard hasPrefix( prefix ) else { return self }
      return String( dropFirst( prefix.count ) )
   }
}

// Country code to emoji feature
// https://www.timekl.com/blog/2017/08/31/swift-tricks-emoji-flags/

private func isLowercaseASCIIScalar( _ scalar: Unicode.Scalar ) -> Bool
{
   scalar.value >= 0x61 && scalar.value <= 0x7A
}

private func regionalIndicatorSymbol( for scalar: Unicode.Scalar ) -> Unicode.Scalar
{
   precondition( isLowercaseASCIIScalar( scalar ) )

   // 0x1F1E6 marks the start of the Regional Indicator Symbol range and corresponds to 'A'
   // 0x61 marks the start of the lowercase ASCII alphabet: 'a'
   return Unicode.Scalar( scalar.value + ( 0x1F1E6 - 0x61 ) ) ?? "?"
}

/**
 emojiFlag( for: "de" ) // 🇩🇪
 emojiFlag( for: "is" ) // 🇮🇸
 */
func emojiFlag( for countryCode: String? ) -> String?
{
   guard let code = countryCode else { return nil }

   if countryCode == "EU" { return "🇪🇺" }
   let lowercasedCode: String = code.lowercased()
   guard lowercasedCode.count == 2 else { return nil }
   let codeLowercased: Bool = lowercasedCode.unicodeScalars.reduce( true )
                                   { accum, scalar in accum && isLowercaseASCIIScalar( scalar ) }
   guard codeLowercased else { return nil }

   let indicatorSymbols: [Unicode.Scalar] = lowercasedCode.unicodeScalars.map { regionalIndicatorSymbol( for: $0 ) }
   return String( indicatorSymbols.map { Character( $0 ) } )
}

func flag( for countryCode3: String? ) -> String?
{
   guard let code3 = countryCode3 else { return nil }

   if code3 == "EU" { return "🇪🇺" }
   if code3 == "UNK" { return nil }
   let code2: String? = CountryUtility.shared.getCountryCode2( code3 )
   if code2 == nil { return countryCode3 }
   return emojiFlag( for: code2 )
}

func flagsFromCodeArray( _ array: [String] ) -> String?
{
   var result: String = ""
   for code in array
   {
      result += flag( for: code ) ?? code
   }

   return result
}

func flags( for country3CodeList: String? ) -> String?
{
   guard let codes = country3CodeList else { return nil }
   let codeList: [Substring] = codes.split( separator: "," )
   var result: String = ""
   for code in codeList
   {
      let country: String = String( code ).trimmingCharacters( in: .whitespacesAndNewlines )
      if country.count == 6
      {
         let country0: String = String( country.prefix( 3 ) )
         let country1: String = String( country.suffix( 3 ) )
         result += flag( for: country0 ) ?? country0
         result += flag( for: country1 ) ?? country1
      }
      else if country.contains( "/" )
      {
         let country: [Substring] = country.split( separator: "/" )
         let country0: String = String( country[ 0 ] )
         let country1: String = String( country[ 1 ] )
         result += flag( for: country0 ) ?? country0
         result += flag( for: country1 ) ?? country1
      }
      else
      {
         result += flag( for: country ) ?? country
      }
   }

   return result
}

extension String
{
   func trim() -> String
   {
      trimmingCharacters( in: .whitespacesAndNewlines )
   }

   func stableHash() -> Int64
   {
      var result: UInt64 = UInt64( 2040 )
      let buf: [UInt8] = [UInt8]( utf8 )
      for byte in buf
      {
         result = 127 * (result & 0x00ffffffffffffff) + UInt64( byte )
      }
      return Int64( result )
    }
}
