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
