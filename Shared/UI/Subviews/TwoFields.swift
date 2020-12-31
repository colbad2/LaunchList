import Foundation
import SwiftUI

struct TwoFields: View
{
   var leftPrefix: String?
   var leftString: String?
   var rightPrefix: String?
   var rightString: String?

   var body: some View
   {
      if leftString != nil || rightString != nil
      {
         HStack
         {
            if leftString != nil
            {
               Text( "\(leftPrefix ?? "")\(leftString!)" )
                  .font( .subheadline )
                  .foregroundColor( .secondary )
            }
            Spacer()
            if rightString != nil
            {
               Text( "\(rightPrefix ?? "")\(rightString!)" )
                  .font( .subheadline )
                  .foregroundColor( .secondary )
            }
         }
      }
   }
}
