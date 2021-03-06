// Copyright © 2021 Bradford Holcombe. All rights reserved.

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

               // AgencyLink( agencyID: docking.flightVehicle?.spacecraft?.spacecraftConfig?.agencies.id )
               List( getDockingAgencies( docking: docking ) )
               {
                  agency in
                  AgencyLink( agencyID: agency.id )
               }
            }
         }

         DescriptionView( desc: docking.flightVehicle?.spacecraft?.spacecraftDescription )
      }
      .padding()
   }
}

func getDockingAgencies( docking: Docking ) -> [Agency]
{
   let agenciesSet: Set< Agency >? = docking.flightVehicle?.spacecraft?.spacecraftConfig?.agencies as? Set<Agency>
   guard let set = agenciesSet else { return [] }
   return Array( set )
}

#if DEBUG
struct DockingDetailPreview: PreviewProvider
{
   static var previews: some View
   {
      if let docking: Docking = getSampleDockingEntity()
      {
         DockingDetail( docking: docking )
      }
   }
}
#endif
