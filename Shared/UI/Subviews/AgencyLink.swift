// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI
import CoreData

struct AgencyLink: View
{
   var agencyID: Int64?

   var body: some View
   {
      let context = PersistenceController.shared.container.viewContext
      if let agencyID = agencyID,
         let agency = getAgency( by: agencyID, context: context ),
         let name = agency.name
      {
         HStack
         {
            NavigationLink( destination: AgencyDetail( agency: agency ) )
            {
               Text( name )
                  .font( .subheadline )
            }
            Spacer()
         }
      }
   }
}

#if DEBUG
struct AgencyLinkPreview: PreviewProvider
{
   static var previews: some View
   {
      let context = PersistenceController.preview.container.viewContext
      let agency = getEntityByID( entityID: 63,
                                  context: context,
                                  entityName: "Agency" ) as? Agency

      if let agencyID = agency?.id
      {
         Group
         {
            NavigationView
            {
               AgencyLink( agencyID: agencyID )
                  .border( Color.accentColor )
            }
            .environment( \.colorScheme, .light )

            NavigationView
            {
               AgencyLink( agencyID: agencyID )
                  .border( Color.blue )
            }
            .environment( \.colorScheme, .dark )
         }
      }
   }
}
#endif
