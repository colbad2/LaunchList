import Foundation
import SwiftUI
import CoreData

struct AgencyLink: View
{
   var agencyID: Int64?

   var body: some View
   {
      if let agencyID = agencyID,
         let agency = getAgency( by: agencyID, context: PersistenceController.shared.container.viewContext )
      {
         HStack
         {
            NavigationLink( destination: AgencyDetail(agency: agency) )
            {
               Text( "\( agency.name! )" )
                  .font( .subheadline )
            }
            Spacer()
         }
      }
   }
}
