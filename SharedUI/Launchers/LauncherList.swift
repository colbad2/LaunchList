// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct LauncherList: View
{
   @FetchRequest( entity: Launcher.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Launcher.launcherConfig?.name,
                                                       ascending: true ) ],
                  animation: .default )
   private var launchers: FetchedResults< Launcher >

   /*
    "flight_proven": false,
    "serial_number": "B0003",
    "status": "expended",
    "details": "Core expended on flight, no recovery effort. First flight of Falcon 9",
    "launcher_config": {
    "id": 169,
    "launch_library_id": 90,
    "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/169/",
    "name": "Falcon 9 v1.0",
    "family": "Falcon",
    "full_name": "Falcon 9 v1.0",
    "variant": "v1.0"
    },
    "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_core_images/8_image_20191115082425.jpg",
    "flights": 1,
    "last_launch_date": "2010-06-04T18:45:00Z",
    "first_launch_date": "2010-06-04T18:45:00Z"

    */

   var body: some View
   {
      List( launchers )
      {
         ( launcher: Launcher ) in

         //         NavigationLink( destination: LauncherDetail( launcher: launcher ) )
         //         {
         LauncherRow( launcher: launcher )
         //         }
      }
      .navigationTitle( "Launcher" )
      .navigationBarTitleDisplayMode( .inline )
   }
}

struct LauncherRow: View
{
   var launcher: Launcher

   var body: some View
   {
      TitleField( text: launcher.launcherConfig?.name )
      //      TitleField( text: launcher?.family )
      //      LeftField( text: launcher?.variant )
   }
}

#if DEBUG
struct LauncherListPreviews: PreviewProvider
{
   static var previews: some View
   {
      LauncherList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
   }
}
#endif
