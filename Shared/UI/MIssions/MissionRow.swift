import Foundation
import SwiftUI

struct MissionRow: View
{
   var mission: Mission

   var body: some View
   {
      HStack( alignment: .top, spacing: 2 )
      {
         Text( "\(mission.name ?? "")" )
               .font( .headline )
      }
   }
}
