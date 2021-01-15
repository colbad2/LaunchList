// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI
import CoreData

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
      // TODO doesn't work
      let context = PersistenceController.preview.container.viewContext
      let rocket = getEntityByID( entityID: 2663,
                                  context: context,
                                  entityName: "Rocket") as? Rocket
      Text( rocket?.fullName ?? "" )
      RocketDetail( rocket: rocket )
   }
}
#endif
