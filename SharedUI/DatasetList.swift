// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct DatasetList: View
{
   let listItems: [ListItem] = [ ListItem( title: "Launches", entity: LAUNCH_ENTITY_NAME, iconName: "AppIcon" ),
                                 ListItem( title: "Agencies", entity: AGENCY_ENTITY_NAME, iconName: "Agency" ),
                                 ListItem( title: "Pads", entity: PAD_ENTITY_NAME, iconName: "Pad" ),
                                 ListItem( title: "Missions", entity: MISSION_ENTITY_NAME, iconName: "Mission" ),
                                 ListItem( title: "Programs", entity: PROGRAM_ENTITY_NAME, iconName: "Program" ),
                                 ListItem( title: "Astronauts", entity: ASTRONAUT_ENTITY_NAME, iconName: "AstronautColor" ),
                                 ListItem( title: "Events", entity: EVENT_ENTITY_NAME, iconName: "Event" ),
                                 ListItem( title: "Live Streams", entity: LIVE_STREAM_ENTITY_NAME, iconName: "LiveStream" ),
                                 ListItem( title: "Starship Vehicles", entity: VEHICLE_ENTITY_NAME, iconName: "Starship" ),
                                 ListItem( title: "Docking", entity: DOCKING_ENTITY_NAME, iconName: "Docking" ),
                                 ListItem( title: "Space Stations", entity: SPACESTATION_ENTITY_NAME, iconName: "Station" ) ]

   var body: some View
   {
      List( listItems )
      {
         ( listItem: ListItem ) in

         ListItemRow( listItem: listItem )
      }
      .navigationBarTitleDisplayMode( .inline )
      .toolbar
      {
         ToolbarItem( placement: .navigationBarLeading ) { Text( "Datasets" ).font( .title ).bold() }
      }
   }
}

struct ListItemRow: View
{
   var listItem: ListItem
   let context: NSManagedObjectContext = PersistenceController.shared.container.viewContext

   var body: some View
   {
      HStack
      {
         NavigationLink( destination: getListItemView( title: listItem.title ) )
         {
            HStack
            {
               if let name: String = listItem.iconName
               {
                  RowImage( defaultImage: UIImage( named: name ), imageWidth: 40, imageHeight: 40 )
               }

               VStack( alignment: .leading )
               {
                  TitleField( text: listItem.title )

                  if let launchCount: Int = getRecordsCount( entityName: listItem.entity, context: context )
                  {
                     Text( "\(launchCount) \(listItem.title.lowercased())" )
                        .font( .subheadline )
                        .foregroundColor( .secondary )
                  }
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

func getListItemView( title: String ) -> AnyView
{
   switch title
   {
      case "Launches": return AnyView( LaunchList() )
      case "Agencies": return AnyView( AgencyList() )
      case "Pads": return AnyView( PadList() )
      case "Missions": return AnyView( MissionList() )
      case "Programs": return AnyView( ProgramList() )
      case "Rockets": return AnyView( RocketList() )
      case "Astronauts": return AnyView( AstronautList() )
      case "Events": return AnyView( EventList() )
      case "Live Streams": return AnyView( LiveStreamsList() )
      case "Starship Vehicles": return AnyView( VehicleList() )
      case "Docking": return AnyView( DockingList() )
      case "Space Stations": return AnyView( SpaceStationList() )
      default: return AnyView( Text( "" ) ) // shouldn't happen
   }
}
