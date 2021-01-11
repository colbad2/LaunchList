import CoreData
import SwiftUI

struct HomeView: View
{
   @Binding var tabSelection: AppTab
   
   var body: some View
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
         let nextLaunchID = launch.id!

         VStack
         {
            TitleField( s: missionName( launch ) )
            TwoFields( leftString: launch.getProviderName(),
                       rightString: launch.rocket?.name ?? launch.name )
            TwoFields( leftString: launch.serviceProvider?.type,
                       rightString: launch.mission?.type )
            LeftField( s: launch.mission?.orbitName )
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
//         NavigationLink( destination: ImageViewer( withURL: launch.image ) )
//         {
            IconView( withURL: launch.image )
//         }
         DescriptionView( desc: launch.mission?.missionDescription )
         IconView( withURL: launch.infographic )

         VStack
         {
            Text( "Upcoming Launches" )
               .font( .title2 )
               .padding()
            List( getUpcomingLaunches() )
            {
               launch in
               NavigationLink( destination: LaunchDetail( launch: launch ) )
               {
                  LaunchRow( launch: launch, nextLaunchID: nextLaunchID )
               }
            }
            .frame( height: 450 )
         }
      }
      .padding()
      .navigationBarHidden( true )
   }
}

func getUpcomingLaunches() -> [Launch]
{
   var upcomingLaunches = getNextLaunches( count: 6, context: PersistenceController.shared.container.viewContext )
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
         if launch.inHold == true,
            let holdReason = launch.holdReason
         {
            HStack
            {
               Text( "HOLD" )
                  .foregroundColor( .orange )
               Spacer()
               Text( holdReason )
            }
         }

         if let failReason = launch.failReason
         {
            HStack( alignment: .top )
            {
               Text( "FAIL" )
                  .foregroundColor( .red )
               Spacer()
               Text( failReason )
            }
         }
      }
      else
      {
         Countdown( targetTime: launch.windowStart )
      }
   }
}

// TODO preview
