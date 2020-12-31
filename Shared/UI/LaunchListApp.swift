import SwiftUI

@main
struct LaunchListApp: App
{
   @Environment( \.managedObjectContext ) private var viewContext
   let persistenceController = PersistenceController.shared

   var body: some Scene
   {
      WindowGroup
      {
         TabsView()
            .environment( \.managedObjectContext,
                          persistenceController.container.viewContext )
      }
   }
}

// TODO fill in with data
struct AppPreviews: PreviewProvider
{
   static var previews: some View
   {
      TabsView()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
   }
}
