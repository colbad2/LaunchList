// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct ExpeditionDetail: View
{
   var expedition: Expedition

   var body: some View
   {
      VStack
      {
         ScrollView
         {
            TitleField( text: expedition.name )
            LeftField( prefix: "began: ", text: expedition.start )
            LeftField( prefix: "ended: ", text: expedition.end )
         }
         .padding()
      }
      .navigationBarTitle( "Expedition", displayMode: .inline )
   }
}

#if DEBUG
struct ExpeditionPreview: PreviewProvider
{
   static var previews: some View
   {
      let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
      if let expedition: Expedition = getEntityByID( entityID: 81,
                                                     context: context,
                                                     entityName: EXPEDITION_ENTITY_NAME ) as? Expedition
      {
         ExpeditionDetail( expedition: expedition )
      }
   }
}
#endif
