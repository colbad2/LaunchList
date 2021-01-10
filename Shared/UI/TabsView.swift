import SwiftUI

struct TabsView: View
{
   @State private var selection = 0
   @State private var resetTimelineNavigationID = UUID()
   @State private var resetDatasetsNavigationID = UUID()

   var body: some View
   {
      let selectable = Binding(        // << proxy binding to catch tab tap
                  get: { self.selection },
                  set: { self.selection = $0

                      // set new ID to recreate NavigationView, so put it
                      // in root state, same as is on change tab and back
                     self.resetTimelineNavigationID = UUID()
                     self.resetDatasetsNavigationID = UUID()
              })

      TabView( selection: selectable )
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
//         .id( self.resetTimelineNavigationID )

         NavigationView
         {
            DatasetList()
//               .navigationBarHidden( true )
         }
         .tabItem
         {
            Image( systemName: "list.dash" )
            Text( "Datasets" )
         }
         .tag( 2 )
         .id( self.resetDatasetsNavigationID ) // << making id modifiable

         NavigationView
         {
            SettingsView()
//               .navigationBarHidden( true )
         }
         .tabItem
         {
            Image( systemName: "gear" )
            Text( "Settings" )
         }
         .tag( 3 )
      }
   }
}

// TODO preview
