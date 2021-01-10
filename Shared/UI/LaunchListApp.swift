import SwiftUI

@main
struct LaunchListApp: App
{
   var body: some Scene
   {
      WindowGroup
      {
         TabsView()
            .environment( \.managedObjectContext,
                          PersistenceController.shared.container.viewContext )
      }
   }
}

// TODO fill in with data
#if DEBUG
struct AppPreviews: PreviewProvider
{
   static var previews: some View
   {
      TabsView()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
   }
}
#endif
