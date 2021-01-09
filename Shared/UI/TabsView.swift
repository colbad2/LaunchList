import SwiftUI

struct TabsView: View
{
   @State private var selection = 0

   var body: some View
   {
      if showPaths()
      {
         LazyHStack{}.frame( width: 0, height: 0 )
      }
      
      TabView( selection: $selection )
      {
         NavigationView
         {
            HomeView( tabSelection: $selection )
               .navigationBarHidden( true )
         }
         .tabItem
         {
            Image( systemName: "house" )
            Text( "Home" )
         }
         .tag( 0 )

         NavigationView
         {
            TimelineView( tabSelection: $selection )
         }
         .onAppear()
         {
            UINavigationBar.appearance().isTranslucent = true
         }
         .tabItem
         {
            Image( systemName: "calendar" )
            Text( "Timeline" )
         }
         .tag( 1 )

         NavigationView
         {
            DatasetList()
               .navigationBarHidden( true )
         }
         .tabItem
         {
            Image( systemName: "list.dash" )
            Text( "Datasets" )
         }
         .tag( 2 )
      }
   }
}

func showPaths() -> Bool
{
   // print("app folder path is \(NSHomeDirectory())")
   return true
}


// TODO preview
