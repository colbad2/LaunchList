import Foundation
import SwiftUI

struct LaunchRow: View
{
   var launch: Launch

   var body: some View
   {
      HStack( alignment: .top, spacing: 2 )
      {
         IconView( withURL: launch.image! )
            .frame( width: 40, height: 40 )
         Spacer()
            .frame( width: 15 )
         VStack( alignment: .leading )
         {
            Text( "\(missionName(launch))" )
               .font(.headline)
               .lineLimit( 2 )
            HStack
            {
               Text( "\(launch.serviceProvider?.name ?? "")" )
                  .font(.subheadline)
                  .lineLimit( 2 )
               Spacer()
               Text( "\(launch.rocket?.configuration?.name ?? launch.name!)" )
                  .font(.subheadline)
                  .lineLimit( 2 )
            }
            Text( "\(launch.windowStart!, formatter: Self.taskDateFormat)" )
               .font(.subheadline)
               .foregroundColor(.gray)
         }
      }
   }

   static let taskDateFormat: DateFormatter =
   {
       let formatter = DateFormatter()
       formatter.dateFormat = "ddMMMyy HH:mm z"

       return formatter
   }()
}

//struct LaunchRow_Previews: PreviewProvider
//{
//   static var previews: some View
//   {
//      LaunchRow( landmark: landmarks[ 0 ] )
//   }
//}
