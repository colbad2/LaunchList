import SwiftUI
import CoreData

struct DatasetList: View
{
   let listItems: [ListItem] = [ ListItem( title: "Launches", entity: "Launch" ),
                                 ListItem( title: "Agencies", entity: "Agency" ),
//                                 ListItem( title: "Service Providers", entity: "ServiceProvider" ),
                                 ListItem( title: "Pads", entity: "Pad" ),
                                 ListItem( title: "Missions", entity: "Mission" ),
                                 ListItem( title: "Programs", entity: "Program" ),
                                 ListItem( title: "Rockets", entity: "Rocket" ),
                                 ListItem( title: "Astronauts", entity: "Astronaut" ),
                                 ListItem( title: "Events", entity: "Event" ),
                                 ListItem( title: "Live Streams", entity: "LiveStream" ),
                                 ListItem( title: "Starship Vehicles", entity: "Vehicle" ),
                                 ListItem( title: "Docking", entity: "Docking" ),
                                 ListItem( title: "Space Stations", entity: "SpaceStation" ) ]

// TODO launchers
   var body: some View
   {
      List( listItems )
      {
         ( listItem: ListItem ) in

         ListItemRow( listItem: listItem )
      }
      .navigationViewStyle( StackNavigationViewStyle() )
   }
}

struct ListItemRow: View
{
   var listItem: ListItem
   let context = PersistenceController.shared.container.viewContext

   var body: some View
   {
      HStack
      {
         NavigationLink( destination: getListItemView( title: listItem.title )! )
         {
            VStack( alignment: .leading )
            {
               TitleField( s: listItem.title )

               let launchCount = getRecordsCount( entityName: listItem.entity, context: context )!
               Text( "\(launchCount) \(listItem.title.lowercased())" )
                  .font( .subheadline )
                  .foregroundColor( .secondary )
            }
         }
         Spacer()
      }
   }
}

struct ListItem: Identifiable
{
   var id: String
   var title: String
   var entity: String

   init( title: String, entity: String )
   {
      self.id = title
      self.title = title
      self.entity = entity
   }
}

func getListItemView( title: String ) -> AnyView?
{
   switch title
   {
      case "Launches": return AnyView( LaunchList() )
      case "Agencies": return AnyView( AgencyList() )
//      case "Service Providers": return AnyView( ServiceProviderList() )
      case "Pads": return AnyView( PadList() )
      case "Missions": return AnyView( MissionList() )
      case "Programs": return AnyView( ProgramList() )
      case "Rockets": return AnyView( RocketList() )
      case "Astronauts": return AnyView( AstronautList() )
      case "Events": return AnyView( EventList() )
      case "Live Streams": return AnyView( LiveStreamList() )
      case "Starship Vehicles": return AnyView( VehicleList() )
      case "Docking": return AnyView( DockingList() )
      case "Space Stations": return AnyView( SpaceStationList() )
      default: return nil
   }
}

// TODO preview
