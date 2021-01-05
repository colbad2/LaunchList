import SwiftUI

struct LinkBarView: View
{
   var infoURL: String?
   var wikiURL: String?
   var mapURL: String?

   var body: some View
   {
      if infoURL != nil || wikiURL != nil || mapURL != nil
      {
         HStack
         {
            if let info = wrapURL( infoURL )
            {
               Link( "Info", destination: info )
                  .font( .headline )
            }

            if let wiki = wrapURL( wikiURL )
            {
               Link( "Wiki", destination: wiki )
                  .font( .headline )
            }

            if let map = wrapURL( mapURL )
            {
               Link( "Map", destination: map )
                  .font( .headline )
            }
         }
         .padding()
      }
   }
}

#if DEBUG
struct LinkBarViewPreview: PreviewProvider
{
   static var previews: some View
   {
      Group
      {
         LinkBarView( infoURL: "a", wikiURL: "b", mapURL: "c" )
         .environment( \.colorScheme, .light )

         LinkBarView( infoURL: "a", wikiURL: "b", mapURL: "c" )
         .environment( \.colorScheme, .dark )
      }
   }
}
#endif
