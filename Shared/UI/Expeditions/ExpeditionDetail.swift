// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI
import CoreData

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
      let context = PersistenceController.preview.container.viewContext
      if let expedition = getEntityByID( entityID: 81,
                                      context: context,
                                      entityName: "Expedition" ) as? Expedition
      {
         ExpeditionDetail( expedition: expedition )
      }
   }
}
#endif
