// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct RocketDetail: View
{
   var rocket: Rocket?

   var body: some View
   {
      ScrollView
      {
         TitleField( text: rocket?.family )
         LeftField( text: rocket?.variant )
      }
      .padding()
      .navigationBarTitle( "Rocket", displayMode: .inline )
   }
}

#if DEBUG
struct RocketPreview: PreviewProvider
{
   static var previews: some View
   {
      let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
      if let rocket: Rocket = getEntityByID( entityID: 2663,
                                             context: context,
                                             entityName: ROCKET_ENTITY_NAME ) as? Rocket
      {
         Text( rocket.fullName ?? "" )
         RocketDetail( rocket: rocket )
      }
   }
}
#endif
