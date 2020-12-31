import Foundation
import SwiftUI

struct LeftField: View
{
   var prefix: String = ""
   var s: String?

   var body: some View
   {
      if s != nil
      {
         HStack
         {
            Text( "\(prefix)\(s!)" )
               .font( .subheadline )
               .foregroundColor( .secondary )
               .lineLimit( 2 )
            Spacer()
         }
      }
   }
}
