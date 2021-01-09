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
      let agency = getEntityByID( id: 63,
                                  context: context,
                                  entityName: "Agency" ) as! Agency
      Group
      {
         NavigationView
         {
            AgencyLink( agencyID: agency.id )
               .border( Color.accentColor )
         }
         .environment( \.colorScheme, .light )

         NavigationView
         {
            AgencyLink( agencyID: agency.id )
               .border( Color.blue )
         }
         .environment( \.colorScheme, .dark )
      }
   }
}
#endif
