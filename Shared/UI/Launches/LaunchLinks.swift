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
            HStack
            {
               Text( "Launches (\(launches.count))" )
                  .font( .headline )
                  .foregroundColor( .secondary )
               Spacer()
            }
            ForEach( sortLaunchesByName( launchArray: Array( launches ) ), id: \.self )
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
            Text( name )
               .font( .subheadline )
            Spacer()
         }
         .padding( 4 )
      }
   }
}
