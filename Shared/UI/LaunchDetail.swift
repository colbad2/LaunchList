import Foundation
import SwiftUI
import CoreData

struct LaunchDetail: View
{
   var launch: Launch

   var body: some View
   {
      ScrollView
      {
         Text( "\(missionName( launch ))" )
            .font( .title )
            .foregroundColor( .primary )
            .padding()
            .multilineTextAlignment( .center )

         VStack
         {
            HStack
            {
               Text( "\(launch.serviceProvider?.name ?? "")" )
               Spacer()
               Text( "\(launch.rocket?.configuration?.name ?? launch.name!)" )
            }
            .font( .subheadline )
            .foregroundColor( .secondary )

            HStack
            {
               Text( "\(launch.serviceProvider?.type ?? "")" )
               Spacer()
               Text( "\(launch.mission?.type ?? "")" )
            }
            .font( .subheadline )
            .foregroundColor( .secondary )

            if launch.mission?.orbit?.name != nil
            {
               HStack
               {
                  Text( "\(launch.mission?.orbit?.name ?? "")" )
                  Spacer()
               }
               .font( .subheadline )
               .foregroundColor( .secondary )
            }

            NavigationLink( destination: PadDetail( pad: launch.pad ) )
            {
               Text( "\(launch.pad?.name ?? "")" )
                  .font( .subheadline )
                  .foregroundColor( Color.blue )
               Spacer()
            }
         }

         Divider()

         Countdown( targetTime: launch.windowStart )

         if launch.inHold || launch.failReason != nil
         {
            Divider()

            if launch.inHold
            {
               HStack
               {
                  Text( "HOLD" )
                  Spacer()
                  Text( "\(launch.holdReason ?? "")" )
               }
            }

            if launch.failReason != nil
            {
               HStack
               {
                  Text( "FAIL" )
                  Spacer()
                  Text( "\(launch.failReason ?? "")" )
               }
            }
         }

         Divider()

         Text( "\(launch.mission?.missionDescription ?? "")" )
            .lineLimit( 200 )

         IconView( withURL: launch.image! )
         if launch.infographic != nil
         {
            IconView( withURL: launch.infographic! )
         }
      }
      .padding()

      Spacer()
   }
}

struct LaunchPreview: PreviewProvider
{
   static var previews: some View
   {
      let managedObjectContext = PersistenceController.preview.container.viewContext
      let request = NSFetchRequest<NSFetchRequestResult>( entityName: "Launch" )
      let launch = try! managedObjectContext.fetch( request ).first as! Launch

      LaunchDetail( launch: launch )
   }
}
