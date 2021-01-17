// Copyright © 2021 Bradford Holcombe. All rights reserved.

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
            TitleField( text: mission?.name )
            LeftField( text: mission?.type )
            LeftField( text: mission?.orbitName  )
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
      let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
      if let mission: Mission = getEntityByID( entityID: 1087,
                                               context: context,
                                               entityName: "Mission") as? Mission
      {
         NavigationView
         {
            MissionDetail( mission: mission )
         }
      }
   }
}
#endif
