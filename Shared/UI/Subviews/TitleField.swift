import Foundation
import SwiftUI

struct TitleField: View
{
   var s: String?

   var body: some View
   {
      if s != nil
      {
         HStack( spacing: 2 )
         {
            Text( "\(s!)" )
               .font( .title2 )
               .foregroundColor( .primary )
               .lineLimit( 3 )
            Spacer()
         }
      }
   }
}
