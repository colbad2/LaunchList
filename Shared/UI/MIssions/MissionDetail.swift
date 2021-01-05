import CoreData
import SwiftUI

struct MissionDetail: View
{
   var mission: Mission?

   var body: some View
   {
      ScrollView
      {
         VStack
         {
            TitleField( s: mission?.name )
            LeftField( prefix: "Type:", s: mission?.type )
            LeftField( prefix: "Orbit:", s: mission?.orbitName  )
            DescriptionView( desc: mission?.missionDescription )
         }
      }
      .padding()
   }
}

#if DEBUG
struct MissionDetailPreview: PreviewProvider
{
   static var previews: some View
   {
      let context = PersistenceController.preview.container.viewContext
      let mission = getEntityByID( id: 1087,
                                   context: context,
                                   entityName: "Mission") as? Mission
      MissionDetail( mission: mission )
   }
}
#endif
