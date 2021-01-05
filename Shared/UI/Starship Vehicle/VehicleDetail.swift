// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI
import CoreData

struct VehicleDetail: View
{
   var vehicle: Vehicle

   var body: some View
   {
      ScrollView
      {
         TitleField( s: "\(vehicle.launcher?.fullName ?? "Starship") \(vehicle.serialNumber!)" )
         LeftField( prefix: "Flight proven: ", s: "\(vehicle.flightProven ? "yes" : "no")" )
         LeftField( prefix: "Status: ", s: vehicle.status )
         LeftField( prefix: "Flights: ", s: "\(vehicle.flights)" )
         LeftField( prefix: "First flight: ", s: vehicle.firstLaunchDate )
         LeftField( prefix: "Last flight: ", s: vehicle.lastLaunchDate )
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
      let context = PersistenceController.preview.container.viewContext
      let vehicle = getEntityByID( id: 75,
                                   context: context,
                                   entityName: "Vehicle" ) as! Vehicle
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
#endif
