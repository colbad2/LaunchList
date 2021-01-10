import SwiftUI

@main
struct LaunchListApp: App
{
   var body: some Scene
   {
      WindowGroup
      {
         if showPaths()
         {
            LazyHStack{}.frame( width: 0, height: 0 )
         }

         TabsView()
            .environment( \.managedObjectContext,
                          PersistenceController.shared.container.viewContext )
      }
   }
}

func showPaths() -> Bool
{
   print( "app folder path is \(NSHomeDirectory())" )
   print( "support dir is: \(NSSearchPathForDirectoriesInDomains( .applicationSupportDirectory, .userDomainMask, true ).last!)" )

   return true
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
