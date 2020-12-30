import Foundation
import SwiftUI
import CoreData

struct LaunchDetail: View
{
   var launch: Launch?

   var body: some View
   {
      VStack
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
                  Text( "\(launch?.serviceProvider?.name ?? "")" )
                  Spacer()
                  Text( "\(launch?.rocket?.name ?? launch?.name ?? "")" )
               }
               .font( .subheadline )
               .foregroundColor( .secondary )

               HStack
               {
                  Text( "\(launch?.serviceProvider?.type ?? "")" )
                  Spacer()
                  Text( "\(launch?.mission?.type ?? "")" )
               }
               .font( .subheadline )
               .foregroundColor( .secondary )

               if launch?.mission?.orbitName != nil
               {
                  HStack
                  {
                     Text( "\(launch?.mission?.orbitName ?? "")" )
                     Spacer()
                  }
                  .font( .subheadline )
                  .foregroundColor( .secondary )
               }

               NavigationLink( destination: PadDetail( pad: launch?.pad ) )
               {
                  Text( "\(launch?.pad?.name ?? "")" )
                     .font( .subheadline )
                     .foregroundColor( Color.blue )
                  Spacer()
               }
            }

            if let windowStart = launch?.windowStart
            {
               let stopShowingCountdown = windowStart + ( 60 * 60 * 5 )
               if Date() < stopShowingCountdown
               {
                  Divider()
                  Countdown( targetTime: windowStart )
               }
            }

            if launch?.inHold == true || launch?.failReason != nil
            {
               Divider()

               if launch?.inHold == true
               {
                  HStack
                  {
                     Text( "HOLD" )
                     Spacer()
                     Text( "\(launch?.holdReason ?? "")" )
                  }
               }

               if launch?.failReason != nil
               {
                  HStack
                  {
                     Text( "FAIL" )
                     Spacer()
                     Text( "\(launch?.failReason ?? "")" )
                  }
               }
            }

            Divider()

            Text( "\(launch?.mission?.missionDescription ?? "")" )
               .lineLimit( 200 )

            if let imageURL = launch?.image
            {
               IconView( withURL: imageURL )
            }

            if let infographic = launch?.infographic
            {
               IconView( withURL: infographic )
            }
         }
         .padding()

         Spacer()
      }
      .navigationTitle( "Launch" )
   }
}

struct LaunchPreview: PreviewProvider
{
   static var previews: some View
   {
      let launch = getFirstEntity( context: PersistenceController.preview.container.viewContext,
                                     entityName: "Launch") as? Launch
      LaunchDetail( launch: launch )
   }
}
