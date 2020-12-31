import Foundation
import SwiftUI
import CoreData

struct AstronautList: View
{
   @FetchRequest( entity: Astronaut.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Astronaut.name,
                                                       ascending: true ) ],
                  animation: .default )
   private var astronauts: FetchedResults< Astronaut >

   var body: some View
   {
      List( astronauts )
      {
         ( astronaut: Astronaut ) in

         NavigationLink( destination: AstronautDetail( astronaut: astronaut ) )
         {
            AstronautRow( astronaut: astronaut )
         }
      }
      .navigationBarTitle( "Astronauts", displayMode: .inline )
   }
}

struct AstronautPreviews: PreviewProvider
{
    static var previews: some View
    {
//      NavigationView
//      {
        AstronautList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
//      }
    }
}
