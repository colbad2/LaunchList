import Foundation
import CoreData
import SwiftUI

struct DescriptionView: View
{
   var desc: String?

   var body: some View
   {
      if desc != nil
      {
         Divider()

         Text( "\(desc!)" )
            .lineLimit( 50 )
            .layoutPriority( 200 )
            .fixedSize( horizontal: false, vertical: true )
               // here to force last line to draw, may be fixed in later SwiftUI releases
      }
   }
}
