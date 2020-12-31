import Foundation
import SwiftUI

struct ProgramRow: View
{
   var program: Program

   var body: some View
   {
      HStack( alignment: .top, spacing: 2 )
      {
         Text( "\(program.name ?? "")" )
               .font( .headline )
               .lineLimit( 2 )
      }
   }
}
