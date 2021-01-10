extension String
{
   func utf8DecodedString() -> String
   {
      let data = self.data( using: .utf8 )
      if let message = String( data: data!, encoding: .nonLossyASCII )
      {
         return message
      }

      return ""
   }

   func utf8EncodedString() -> String
   {
      let messageData = self.data( using: .nonLossyASCII )
      let text = String( data: messageData!, encoding: .utf8 )!

      return text
   }

   func fixBadUTF() -> String
   {
//      return self
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


      // TODO https://www.i18nqa.com/debug/utf8-debug.html
   }

   func removePrefix( _ prefix: String ) -> String
   {
      guard self.hasPrefix( prefix ) else { return self }
      return String( self.dropFirst( prefix.count ) )
   }
}

// TODO move to a Dictionary extension
extension Dictionary where Value: Equatable
{
    func key( forValue value: Value ) -> Key?
    {
        return first { $0.1 == value }?.0
    }
}

// Country code to emoji feature
// https://www.timekl.com/blog/2017/08/31/swift-tricks-emoji-flags/

private func isLowercaseASCIIScalar(_ scalar: Unicode.Scalar) -> Bool
{
   return scalar.value >= 0x61 && scalar.value <= 0x7A
}

private func regionalIndicatorSymbol( for scalar: Unicode.Scalar ) -> Unicode.Scalar
{
   precondition( isLowercaseASCIIScalar( scalar ) )

   // 0x1F1E6 marks the start of the Regional Indicator Symbol range and corresponds to 'A'
   // 0x61 marks the start of the lowercase ASCII alphabet: 'a'
   return Unicode.Scalar( scalar.value + ( 0x1F1E6 - 0x61 ) )!
}

/**
 emojiFlag( for: "de" ) // 🇩🇪
 emojiFlag( for: "is" ) // 🇮🇸
 */
func emojiFlag( for countryCode: String? ) -> String?
{
   guard let code = countryCode else { return nil }
   let lowercasedCode = code.lowercased()
   guard lowercasedCode.count == 2 else { return nil }
   guard lowercasedCode.unicodeScalars.reduce( true, { accum, scalar in accum && isLowercaseASCIIScalar( scalar ) } ) else { return nil }

   let indicatorSymbols = lowercasedCode.unicodeScalars.map( { regionalIndicatorSymbol( for: $0 ) } )
   return String(indicatorSymbols.map( { Character( $0 ) } ) )
}

func flag( for countryCode3: String? ) -> String?
{
   guard let code3 = countryCode3 else { return nil }
   let code2 = CountryUtility.shared.getCountryCode2( code3 )
   if code2 == nil { return countryCode3 }
   return emojiFlag( for: code2 )
}

func flagsFromCodeArray( _ array: [String] ) -> String?
{
   var result = ""
   for code in array
   {
      result += flag( for: code ) ?? code
   }

   return result
}

func flags( for country3CodeList: String? ) -> String?
{
   guard let codes = country3CodeList else { return nil }
   let codeList = codes.split( separator: "," )
   var result = ""
   for code in codeList
   {
      let country = String( code ).trimmingCharacters( in: .whitespacesAndNewlines )
      if country.count == 6
      {
         let c0 = String( country.prefix( 3 ) )
         let c1 = String( country.suffix( 3 ) )
         result += flag( for: c0 ) ?? c0
         result += flag( for: c1 ) ?? c1
      }
      else if country.contains( "/" )
      {
         let c = country.split( separator: "/" )
         let c0 = String( c[ 0 ] )
         let c1 = String( c[ 1 ] )
         result += flag( for: c0 ) ?? c0
         result += flag( for: c1 ) ?? c1
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
      return self.trimmingCharacters( in: .whitespacesAndNewlines )
   }
}
