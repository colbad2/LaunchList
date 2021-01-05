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

struct AstronautRow: View
{
   var astronaut: Astronaut

   var body: some View
   {
      RowImage( imageURL: astronaut.profileImageThumbnail )

      VStack( alignment: .leading )
      {
         TitleField( s: astronaut.name! )
         LeftField( s: astronaut.nationality! )
      }
   }
}

#if DEBUG
struct AstronautPreviews: PreviewProvider
{
   static var previews: some View
   {
      Group
      {
         // light view
         NavigationView
         {
            AstronautList()
            .environment( \.managedObjectContext,
                          PersistenceController.preview.container.viewContext )
         }
         .environment( \.colorScheme, .light )

         // dark view
         NavigationView
         {
            AstronautList()
            .environment( \.managedObjectContext,
                          PersistenceController.preview.container.viewContext )
         }
         .environment( \.colorScheme, .dark )

         // Assitive text large
         NavigationView
         {
            AstronautList()
            .environment( \.managedObjectContext,
                          PersistenceController.preview.container.viewContext )
         }
         .environment( \.sizeCategory, .accessibilityExtraExtraExtraLarge )
      }
   }
}
#endif
