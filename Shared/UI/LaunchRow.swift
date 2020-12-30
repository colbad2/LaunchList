import Foundation
import SwiftUI

struct LaunchRow: View
{
   var launch: Launch

   var body: some View
   {
      HStack( alignment: .top, spacing: 2 )
      {
         if let imageURL = launch.image
         {
            IconView( withURL: imageURL )
               .frame( width: 40, height: 60 )
            Spacer()
               .frame( width: 15 )
         }
         else
         {
            Spacer()
               .frame( width: 55 )
         }
         
         VStack( alignment: .leading )
         {
            Text( "\(missionName( launch ))" )
               .font( .headline )
               .lineLimit( 2 )
            HStack
            {
               let providerName = launch.getProviderName()
               Text( "\(providerName)" )
                  .font( .subheadline )
                  .lineLimit( 2 )
               Spacer()
               Text( "\(launch.rocket?.name ?? launch.name!)" )
                  .font( .subheadline )
                  .lineLimit( 2 )
            }
            Text( "\(launch.windowStart!, formatter: Self.taskDateFormat)" )
               .font( .subheadline )
               .foregroundColor( .gray )
               .textCase( /*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/ )
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
