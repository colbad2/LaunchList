import Foundation
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
                  .font( .subheadline )
            }

            if let wiki = wrapURL( wikiURL )
            {
               Link( "Wiki", destination: wiki )
                  .font( .subheadline )
            }

            if let map = wrapURL( mapURL )
            {
               Link( "Map", destination: map )
                  .font( .subheadline )
            }
         }
         .padding()
      }
   }
}
