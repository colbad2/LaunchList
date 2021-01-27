// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct SpacecraftList: View
{
   @FetchRequest( entity: Spacecraft.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Spacecraft.name,
                                                       ascending: true ) ],
                  animation: .default )
   private var spacecrafts: FetchedResults< Spacecraft >

   var body: some View
   {
      List( spacecrafts )
      {
         ( spacecraft: Spacecraft ) in

         //         NavigationLink( destination: SpacecraftDetail( spacecraft: spacecraft ) )
         //         {
         SpacecraftRow( spacecraft: spacecraft )
         //         }
      }
      .navigationTitle( "Spacecraft" )
      .navigationBarTitleDisplayMode( .inline )
   }
}

// struct SpacecraftRow: View
// {
//   var spacecraft: Spacecraft
//
//   var body: some View
//   {
//      TitleField( text: spacecraft.fullName )
//      //      TitleField( text: spacecraft?.family )
//      //      LeftField( text: spacecraft?.variant )
//   }
// }

#if DEBUG
struct SpacecraftListPreviews: PreviewProvider
{
   static var previews: some View
   {
      SpacecraftList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
   }
}
#endif
