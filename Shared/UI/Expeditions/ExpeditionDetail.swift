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
            TitleField( s: expedition.name )
            LeftField( prefix: "began: ", s: expedition.start )
            LeftField( prefix: "ended: ", s: expedition.end )
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
      let expedition = getEntityByID( id: 81,
                                      context: context,
                                      entityName: "Expedition" ) as! Expedition
      ExpeditionDetail( expedition: expedition )
   }
}
#endif
