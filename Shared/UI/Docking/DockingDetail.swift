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
               TitleField( text: "\(docking.flightVehicle?.spacecraft?.name ?? "") with the" )
               TitleField( text: docking.flightVehicle?.destination )
               LeftField( prefix: "Docking:", text: docking.docking )
               LeftField( prefix: "Departure:", text: docking.docking )
               LeftField( prefix: "Location:", text: docking.dockingLocationName )

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
      let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
      if let docking: Docking = getEntityByID( entityID: 100,
                                               context: context,
                                               entityName: "Docking") as? Docking
      {
         DockingDetail( docking: docking )
      }
   }
}
#endif
