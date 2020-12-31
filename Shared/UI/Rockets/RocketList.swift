import Foundation
import SwiftUI
import CoreData

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

         RocketRow( rocket: rocket )
      }
      .navigationBarTitle( "Rocket", displayMode: .inline )
   }
}

struct RocketListPreviews: PreviewProvider
{
   static var previews: some View
   {
      RocketList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
   }
}
