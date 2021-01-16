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
      .navigationBarTitle( "Dockings", displayMode: .inline )
   }
}

struct DockingRow: View
{
   var docking: Docking

   var body: some View
   {
      VStack( alignment: .leading )
      {
         TitleField( text: "\(docking.flightVehicle?.spacecraft?.name ?? "") with the" )
         TitleField( text: docking.flightVehicle?.destination )
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
