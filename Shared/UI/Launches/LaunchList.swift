import SwiftUI
import CoreData

struct LaunchList: View
{
   @FetchRequest( entity: Launch.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Launch.windowStart,
                                                       ascending: false ) ],
                  animation: .default )
   private var launches: FetchedResults< Launch >

   var body: some View
   {
      List( launches )
      {
         ( launch: Launch ) in

         NavigationLink( destination: LaunchDetail( launch: launch ) )
         {
            LaunchRow( launch: launch )
         }
      }
      .navigationBarTitle( "Launches", displayMode: .inline )
   }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
//      NavigationView
//      {
        LaunchList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
//      }
    }
}
