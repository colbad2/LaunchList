// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct DockingList: View
{
   @FetchRequest( entity: Docking.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Docking.docking,
                                                       ascending: false ) ],
                  animation: .default )
   private var dockings: FetchedResults< Docking >

   var body: some View
   {
      List( dockings )
      {
         ( docking: Docking ) in

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
   var docking: Docking
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
