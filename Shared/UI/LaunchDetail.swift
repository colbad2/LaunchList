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
               let providerName = launch?.getProviderName()
               let rocketName = launch?.rocket?.name
               let launchName = launch?.name
               HStack( alignment: .top )
               {
                  Text( "\(providerName ?? "")" )
                  Spacer()
                  Text( "\(rocketName ?? launchName ?? "")" )
               }
               .font( .subheadline )
               .foregroundColor( .secondary )

               let providerType = launch?.serviceProvider?.type
               let missionType = launch?.mission?.type
               if providerType != nil || missionType != nil
               {
                  HStack( alignment: .top )
                  {
                     Text( "\(providerType ?? "")" )
                     Spacer()
                     Text( "\(missionType ?? "")" )
                  }
                  .font( .subheadline )
                  .foregroundColor( .secondary )
               }

               if let orbitName = launch?.mission?.orbitName
               {
                  HStack
                  {
                     Text( "\(orbitName)" )
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
                        .foregroundColor( .orange )
                     Spacer()
                     Text( "\(launch?.holdReason ?? "")" )
                  }
               }

               if launch?.failReason != nil
               {
                  HStack( alignment: .top )
                  {
                     Text( "FAIL" )
                        .foregroundColor( .red )
                     Spacer()
                     Text( "\(launch?.failReason ?? "")" )
                  }
               }
            }

            if let desc = launch?.mission?.missionDescription
            {
               Divider()

               Text( "\(desc)" )
                  .lineLimit( 200 )
                  .layoutPriority( 200 )
            }

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
