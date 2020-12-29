import SwiftUI
import CoreData

struct ContentView: View
{
   @Environment( \.managedObjectContext ) private var viewContext

   @FetchRequest( entity: Launch.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Launch.windowStart,
                                                       ascending: true ) ],
                  animation: .default )
   private var launches: FetchedResults< Launch >

   var body: some View
   {
      NavigationView
      {
         List( launches )
         {
            ( launch: Launch ) in

            NavigationLink( destination: LaunchDetail( launch: launch ) )
            {
               LaunchRow( launch: launch )
            }
         }
         .navigationTitle( "Launches" )
      }
   }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
    }
}
