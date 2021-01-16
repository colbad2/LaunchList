// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct RocketList: View
{
   @FetchRequest( entity: Rocket.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Rocket.name,
                                                       ascending: true ) ],
                  animation: .default )
   private var rockets: FetchedResults< Rocket >

   var body: some View
   {
      List( rockets )
      {
         ( rocket: Rocket ) in

//         NavigationLink( destination: RocketDetail( rocket: rocket ) )
//         {
            RocketRow( rocket: rocket )
//         }
      }
      .navigationBarTitle( "Rocket", displayMode: .inline )
   }
}

struct RocketRow: View
{
   var rocket: Rocket

   var body: some View
   {
      TitleField( text: rocket.fullName )
//      TitleField( text: rocket?.family )
//      LeftField( text: rocket?.variant )
   }
}

#if DEBUG
struct RocketListPreviews: PreviewProvider
{
   static var previews: some View
   {
      RocketList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
   }
}
#endif
