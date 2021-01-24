// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

/**
 List of launches linked to an entity.
 */
struct LaunchLinks: View
{
   var launches: Set< Launch >

   var body: some View
   {
         if !launches.isEmpty
         {
            Divider()
            GrayHeadlineText( text: "Launches (\(launches.count))" )
            ForEach( sortLaunchesByName( launchArray: Array( launches ) ) )
            {
               launch in
               LaunchLink( launchID: launch.id )
            }
         }
   }
}

struct LaunchLink: View
{
   var launchID: String?

   var body: some View
   {
      let context: NSManagedObjectContext = PersistenceController.shared.container.viewContext
      if let launchID: String = launchID,
         let launch: Launch = getLaunch( by: launchID, context: context ),
         let name: String = launch.name
      {
         NavigationLink( destination: LaunchDetail( launch: launch ) )
         {
            BlackSubheadlineText( text: name )
            Spacer()
         }
         .padding( 4 )
      }
   }
}
