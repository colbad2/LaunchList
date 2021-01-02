import Foundation
import CoreData
import SwiftUI

struct HomeView: View
{
   @Binding var tabSelection: Int
   
   var body: some View
   {
      NavigationView
      {
         VStack
         {
            ScrollView
            {
               HStack
               {
                  Text( "Next Launch" )
                     .font( .title )
                  Spacer()
               }

               let launch = getNextLaunch( context: PersistenceController.shared.container.viewContext )!

               VStack
               {
                  TitleField( s: missionName( launch ) )
                  TwoFields( leftString: launch.getProviderName(),
                             rightString: launch.rocket?.name ?? launch.name )
                  TwoFields( leftString: launch.serviceProvider?.type,
                             rightString: launch.mission?.type )
                  LeftField( prefix: "Orbit: ", s: launch.mission?.orbitName )
                  NavigationLink( destination: PadDetail( pad: launch.pad! ) )
                  {
                     LeftField( s: launch.pad?.name )
                  }
                  // TODO open correct details page in nav view (may not be possible yet)
//                  Button( action: { self.tabSelection = 1 } )
//                  {
//                     LeftField( s: launch.pad?.name )
//                  }
               }
               Divider()
               HoldFailCountdownView( launch: launch )

               if let imageURL = launch.image
               {
                  IconView( withURL: imageURL )
               }

               DescriptionView( desc: launch.mission?.missionDescription )

               if let infographic = launch.infographic
               {
                  IconView( withURL: infographic )
               }

               VStack
               {
                  Text( "Other Upcoming Launches" )
                     .font( .title2 )
                     .padding()
                  List( getUpcomingLaunches() )
                  {
                     launch in
                     NavigationLink( destination: LaunchDetail( launch: launch ) )
                     {
                        LaunchRow( launch: launch )
                     }
                  }
                  .frame( height: 400 )
               }
            }
            .padding()
         }
         // .navigationBarTitle( "Next Launch", displayMode: .large )
         .navigationBarHidden( true )
      }
   }
}

func getUpcomingLaunches() -> [Launch]
{
   var upcomingLaunches = getNextLaunches( count: 5, context: PersistenceController.shared.container.viewContext )
   upcomingLaunches.remove( at: 0 )
   return upcomingLaunches
}

struct HoldFailCountdownView: View
{
   var launch: Launch

   var body: some View
   {
      if launch.inHold == true || launch.failReason != nil
      {
         if launch.inHold == true
         {
            HStack
            {
               Text( "HOLD" )
                  .foregroundColor( .orange )
               Spacer()
               Text( "\(launch.holdReason ?? "")" )
            }
         }

         if launch.failReason != nil
         {
            HStack( alignment: .top )
            {
               Text( "FAIL" )
                  .foregroundColor( .red )
               Spacer()
               Text( "\(launch.failReason ?? "")" )
            }
         }
      }
      else
      {
         Countdown( targetTime: launch.windowStart )
      }
   }
}
