// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct DockingList: View
{
   @FetchRequest( entity: DockingEvent.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \DockingEvent.docking,
                                                       ascending: false ) ],
                  animation: .default )
   private var dockings: FetchedResults< DockingEvent >

   var body: some View
   {
      List( dockings )
      {
         ( docking: DockingEvent ) in

         NavigationLink( destination: DockingDetail( docking: docking ) )
         {
            DockingRow( docking: docking )
         }
      }
      .navigationTitle( "Dockings" )
      .navigationBarTitleDisplayMode( .inline )
   }
}

struct DockingRow: View
{
   var docking: DockingEvent
   var nextDockingID: Int64?

   var body: some View
   {
      VStack( alignment: .leading )
      {
         HStack
         {
            TitleField( text: "\(docking.flightVehicle?.spacecraft?.name ?? "") with the" )
            TitleField( text: docking.flightVehicle?.destination )
            if docking.id == nextDockingID
            {
               Spacer()
               NextCapsule()
            }
         }
         LeftField( text: docking.docking )
      }
   }
}

#if DEBUG
struct DockingPreviews: PreviewProvider
{
    static var previews: some View
    {
//      NavigationView
//      {
        DockingList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
//      }
    }
}
#endif
