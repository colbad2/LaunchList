// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

/**
 List of launches linked to an entity.
 */
struct LaunchLinks: View
{
   var launches: NSSet?

   var body: some View
   {
      if let launches = launches
      {
         if launches.count > 0
         {
            Divider()
            HStack
            {
               Text( "Launches (\(launches.count))" )
                  .font( .headline )
                  .foregroundColor( .secondary )
               Spacer()
            }
            ForEach( getLaunchesArray( launches: launches ), id: \.self )
            {
               launch in
               LaunchLink( launchID: launch.id )
            }
         }
      }
   }
}

struct LaunchLink: View
{
   var launchID: String?

   var body: some View
   {
      let context = PersistenceController.shared.container.viewContext
      if let launchID = launchID,
         let launch = getLaunch( by: launchID, context: context ),
         let name = launch.name
      {
         NavigationLink( destination: LaunchDetail( launch: launch ) )
         {
            Text( name )
               .font( .subheadline )
            Spacer()
         }
         .padding( 4 )
      }
   }
}

func getLaunchesArray( launches: NSSet ) -> [Launch]
{
   var eventLaunches = Array( launches as Set ) as! [Launch]
   eventLaunches.sort( by: { ($0 as Launch).windowStart! < ($1 as Launch).windowStart! } )
   return eventLaunches
}
