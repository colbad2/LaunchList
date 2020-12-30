import SwiftUI

@main
struct LaunchListApp: App
{
   let persistenceController = PersistenceController.shared

   var body: some Scene
   {
      WindowGroup
      {
         MainUI()
            .environment( \.managedObjectContext,
                          persistenceController.container.viewContext )
      }
   }
}

struct MainUI: View
{
   var body: some View
   {
      TabView
      {
         LaunchList()
            .tabItem
            {
               Image( systemName: "list.dash" )
               Text( "Launches" )
            }
         AgencyList()
            .tabItem
            {
               Image( systemName: "list.dash" )
               Text( "Agencies" )
            }
         ServiceProviderList()
            .tabItem
            {
               Image( systemName: "list.dash" )
               Text( "Services" )
            }
         PadList()
            .tabItem
            {
               Image( systemName: "list.dash" )
               Text( "Pads" )
            }
         MissionList()
            .tabItem
            {
               Image( systemName: "list.dash" )
               Text( "Missions" )
            }
         ProgramList()
            .tabItem
            {
               Image( systemName: "list.dash" )
               Text( "Programs" )
            }
         RocketList()
            .tabItem
            {
               Image( systemName: "list.dash" )
               Text( "Rockets" )
            }
      }
   }
}

// TODO fill in with data
struct AppPreviews: PreviewProvider
{
   static var previews: some View
   {
      MainUI()
   }
}
