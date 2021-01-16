// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct AgencyLink: View
{
   var agencyID: Int64?

   var body: some View
   {
      let context: NSManagedObjectContext = PersistenceController.shared.container.viewContext
      if let agencyID: Int64 = agencyID,
         let agency: Agency = getAgency( by: agencyID, context: context ),
         let name: String = agency.name
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
      let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
      if let agency: Agency = getEntityByID( entityID: 63,
                                             context: context,
                                             entityName: "Agency" ) as? Agency
      {
         let agencyID: Int64 = agency.id
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
