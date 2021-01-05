// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct DockingDetail: View
{
   var docking: Docking

   var body: some View
   {
      ScrollView
      {
         HStack( alignment: .top )
         {
            RowImage( imageURL: docking.flightVehicle?.spacecraft?.spacecraftConfig?.imageURL, drawSpace: false )

            VStack
            {
               TitleField( s: "\(docking.flightVehicle?.spacecraft?.name ?? "") with the" )
               TitleField( s: docking.flightVehicle?.destination )
               LeftField( prefix: "Docking:", s: docking.docking )
               LeftField( prefix: "Departure:", s: docking.docking )
               LeftField( prefix: "Location:", s: docking.dockingLocation?.name )

               AgencyLink( agencyID: docking.flightVehicle?.spacecraft?.spacecraftConfig?.agency?.id )
            }
         }

         DescriptionView( desc: docking.flightVehicle?.spacecraft?.spacecraftDescription )
      }
      .padding()
   }
}

#if DEBUG
struct DockingDetailPreview: PreviewProvider
{
   static var previews: some View
   {
      let context = PersistenceController.preview.container.viewContext
      let docking = getEntityByID( id: 100,
                                   context: context,
                                   entityName: "Docking") as! Docking
      DockingDetail( docking: docking )
   }
}
#endif
