import Foundation
import SwiftUI

struct RocketRow: View
{
   var rocket: Rocket

   var body: some View
   {
      HStack( alignment: .top, spacing: 2 )
      {
         Text( "\(rocket.fullName ?? "")" )
               .font( .headline )
               .lineLimit( 2 )
      }
   }
}
