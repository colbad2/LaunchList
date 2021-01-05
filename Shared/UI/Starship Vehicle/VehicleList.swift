// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI
import CoreData

struct VehicleList: View
{
   @FetchRequest( entity: Vehicle.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Vehicle.id,
                                                       ascending: true ) ],
                  animation: .default )
   private var vehicles: FetchedResults< Vehicle >

   var body: some View
   {
      List( vehicles )
      {
         ( vehicle: Vehicle ) in

         NavigationLink( destination: VehicleDetail( vehicle: vehicle ) )
         {
            VehicleRow( vehicle: vehicle )
         }
      }
      .navigationBarTitle( "Starship Vehicle", displayMode: .inline )
   }
}

struct VehicleRow: View
{
   var vehicle: Vehicle

   var body: some View
   {
      TitleField( s: "\(vehicle.launcher?.fullName ?? "") \(vehicle.serialNumber!)" )
   }
}

#if DEBUG
struct VehicleListPreviews: PreviewProvider
{
   static var previews: some View
   {
      VehicleList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
   }
}
#endif
