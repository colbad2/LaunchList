// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct VehicleDetail: View
{
   var vehicle: Vehicle

   var body: some View
   {
      ScrollView
      {
         TitleField( text: "\(vehicle.launcher?.fullName ?? "Starship") \(vehicle.serialNumber ?? "")" )
         LeftField( prefix: "Flight proven: ", text: "\(vehicle.flightProven ? "yes" : "no")" )
         LeftField( prefix: "Status: ", text: vehicle.status )
         LeftField( prefix: "Flights: ", text: "\(vehicle.flights)" )
         LeftField( prefix: "First flight: ", text: vehicle.firstLaunchDate )
         LeftField( prefix: "Last flight: ", text: vehicle.lastLaunchDate )
         IconView( withURL: vehicle.imageURL )
         DescriptionView( desc: vehicle.details )
      }
      .padding()
      .navigationBarTitle( "Starship", displayMode: .inline )
   }
}

#if DEBUG
struct VehiclePreview: PreviewProvider
{
   static var previews: some View
   {
      let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
      if let vehicle: Vehicle = getEntityByID( entityID: 75,
                                               context: context,
                                               entityName: "Vehicle" ) as? Vehicle
      {
         Group
         {
            NavigationView
            {
               VehicleDetail( vehicle: vehicle )
            }
            .environment( \.colorScheme, .light )

            NavigationView
            {
               VehicleDetail( vehicle: vehicle )
            }
            .environment( \.colorScheme, .dark )
         }
      }
   }
}
#endif