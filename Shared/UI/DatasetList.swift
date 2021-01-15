import SwiftUI
import CoreData

struct DatasetList: View
{
   let listItems: [ListItem] = [ ListItem( title: "Launches", entity: "Launch", iconName: "AppIcon" ),
                                 ListItem( title: "Agencies", entity: "Agency", iconName: "Agency" ),
//                                 ListItem( title: "Service Providers", entity: "ServiceProvider" ),
                                 ListItem( title: "Pads", entity: "Pad", iconName: "Pad" ),
                                 ListItem( title: "Missions", entity: "Mission", iconName: "Mission" ),
                                 ListItem( title: "Programs", entity: "Program", iconName: "Program" ),
//                                 ListItem( title: "Rockets", entity: "Rocket" ),
                                 ListItem( title: "Astronauts", entity: "Astronaut", iconName: "AstronautColor" ),
                                 ListItem( title: "Events", entity: "Event", iconName: "Event" ),
                                 ListItem( title: "Live Streams", entity: "LiveStream", iconName: "LiveStream" ),
                                 ListItem( title: "Starship Vehicles", entity: "Vehicle", iconName: "Starship" ),
                                 ListItem( title: "Docking", entity: "Docking", iconName: "Docking" ),
                                 ListItem( title: "Space Stations", entity: "SpaceStation", iconName: "Station" ) ]

// TODO launchers
   var body: some View
   {
      List( listItems )
      {
         ( listItem: ListItem ) in

         ListItemRow( listItem: listItem )
      }
      .navigationBarTitleDisplayMode( .inline )
      .toolbar( content:
      {
         ToolbarItem( placement: .navigationBarLeading, content: { Text( "Datasets" ).font( .title ).bold() } )
      })
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
            HStack
            {
               if let name = listItem.iconName
               {
                  RowImage( defaultImage: UIImage( named: name ), w: 40, h: 40 )
               }

               VStack( alignment: .leading )
               {
                  TitleField( s: listItem.title )

                  let launchCount = getRecordsCount( entityName: listItem.entity, context: context )!
                  Text( "\(launchCount) \(listItem.title.lowercased())" )
                     .font( .subheadline )
                     .foregroundColor( .secondary )
               }
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
   var iconName: String?

   init( title: String, entity: String, iconName: String? = nil )
   {
      self.id = title
      self.title = title
      self.entity = entity
      self.iconName = iconName
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
