// Copyright © 2021 Bradford Holcombe. All rights reserved.

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
            Text( "Next" )
               .font( .title ).bold()
            Spacer()
         }

         if let launch: Launch = getNextLaunch( context: PersistenceController.shared.container.viewContext )
         {
            VStack
            {
               TitleField( text: missionName( launch ) )
               TwoFields( leftString: launch.getProviderName(),
                          rightString: launch.rocket?.name ?? launch.name )
               TwoFields( leftString: launch.serviceProvider?.type,
                          rightString: launch.mission?.type )
               LeftField( text: launch.mission?.orbitName )
               LeftField( text: dateString( launch.windowStart ) )
               if let pad: Pad = launch.pad
               {
                  NavigationLink( destination: PadDetail( pad: pad ) )
                  {
                     LeftField( text: pad.name )
                  }
               }
            }
            if launch.inHold == true || launch.failReason != nil
            {
               Divider()
               HoldFailView( launch: launch )
            }
            else
            {
               CountdownView( targetTime: launch.windowStart )
            }
            //         NavigationLink( destination: ImageViewer( withURL: launch.image ) )
            //         {
            IconView( withURL: launch.image )
            //         }
            DescriptionView( desc: launch.mission?.missionDescription )
            IconView( withURL: launch.infographic )

            VStack
            {
               Text( "Upcoming" )
                  .font( .title2 )
                  .bold()
                  .padding()
               List( getUpcomingLaunches() )
               {
                  launch in
                  NavigationLink( destination: LaunchDetail( launch: launch ) )
                  {
                     LaunchRow( launch: launch, nextLaunchID: launch.id )
                  }
               }
               .frame( height: 450 )
            }
         }
      }
      .padding()
      .navigationBarHidden( true )
   }
}

func getUpcomingLaunches() -> [Launch]
{
   var upcomingLaunches: [Launch] = getNextLaunches( count: 6, context: PersistenceController.shared.container.viewContext )
   upcomingLaunches.remove( at: 0 )
   return upcomingLaunches
}
