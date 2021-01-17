// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct AgencyDetail: View
{
   var agency: Agency

   var body: some View
   {
      ScrollView
      {
         HStack( alignment: .top )
         {
            TitleField( text: agency.name )
            if let countryCodes: [String] = agency.countryCodes
            {
               Spacer()
               Text( flagsFromCodeArray( countryCodes ) ?? "" )
            }
         }
         IconView( withURL: agency.imageURL )

         VStack
         {
            TwoFields( leftString: agency.type,
                       rightPrefix: "Founded ", rightString: agency.foundingYear )

            LeftField( prefix: "Admin: ", text: agency.administrator )
            LeftField( prefix: "Launchers: ", text: agency.launchers )
            LeftField( prefix: "Spacecraft: ", text: agency.spacecraft )
            LeftField( prefix: "Parent: ", text: agency.parent )
         }

         DescriptionView( desc: agency.agencyDescription )
      }
      .padding()
      .navigationBarTitle( "Agency", displayMode: .inline )
   }
}

#if DEBUG
struct AgencyPreview: PreviewProvider
{
   static var previews: some View
   {
      let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
      if let agency: Agency = getEntityByID( entityID: 63,
                                             context: context,
                                             entityName: AGENCY_ENTITY_NAME ) as? Agency
      {
         AgencyDetail( agency: agency )
      }
   }
}
#endif
