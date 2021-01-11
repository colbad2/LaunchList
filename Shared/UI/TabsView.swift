import SwiftUI

struct TabsView: View
{
   @State private var selection = AppTab.home
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
         .tabItem { TabInfo( iconName: "house", title: "Home" ) }
         .tag( AppTab.home )

         NavigationView
         {
            TimelineView( tabSelection: $selection )
         }
         .tabItem { TabInfo( iconName: "calendar", title: "Timeline" ) }
         .tag( AppTab.timeline )
//         .id( self.resetTimelineNavigationID )

         NavigationView
         {
            DatasetList()
         }
         .tabItem { TabInfo( iconName: "list.dash", title: "Datasets" ) }
         .tag( AppTab.datasets )
         .id( self.resetDatasetsNavigationID ) // << making id modifiable

         NavigationView
         {
            SettingsView()
         }
         .tabItem { TabInfo( iconName: "gear", title: "Settings" ) }
         .tag( AppTab.settings ) //3 )
      }
   }
}

//extension ContentView {
enum AppTab: Hashable
{
   case home
   case timeline
   case datasets
   case settings
}
//}

struct TabInfo: View
{
   var iconName: String
   var title: String
   var body: some View
   {
      Image( systemName: iconName )
      Text( title )
   }
}

// TODO preview
