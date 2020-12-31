import Foundation
import SwiftUI

struct PadRow: View
{
   var pad: Pad

   var body: some View
   {
      HStack( alignment: .top, spacing: 2 )
      {
         Text( "\(pad.name ?? "")" )
               .font( .headline )
               .lineLimit( 2 )
      }
   }
}
