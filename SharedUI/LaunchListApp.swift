// Copyright © 2021 Bradford Holcombe. All rights reserved.

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
            .environment( \.managedObjectContext, PersistenceController.shared.container.viewContext )
      }
   }
}

/**
 Print out useful disk locations for simulator runs.
 */
public func showPaths() -> Bool
{
   print( "app folder path is \(NSHomeDirectory())" )
   let dir: String = NSSearchPathForDirectoriesInDomains( .applicationSupportDirectory, .userDomainMask, true ).last ?? "unknown"
   print( "support dir is: \(dir)" )

   return true
}

#if DEBUG
public struct AppPreviews: PreviewProvider
{
   public static var previews: some View
   {
      TabsView()
         .environment( \.managedObjectContext, PersistenceController.preview.container.viewContext )
   }
}
#endif
