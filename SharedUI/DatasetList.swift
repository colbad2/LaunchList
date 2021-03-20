// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct DatasetList: View
{
   let listItems: [ListItem] = [ ListItem( title: "Launches", entity: LAUNCH_ENTITY_NAME, iconName: "AppIcon" ),
                                 ListItem( title: "Agencies", entity: AGENCY_ENTITY_NAME, iconName: "Agency",
                                           blurb: "organizations that run programs" ),
                                 ListItem( title: "Pads", entity: PAD_ENTITY_NAME, iconName: "Pad", blurb: "launch locations" ),
                                 ListItem( title: "Missions", entity: MISSION_ENTITY_NAME, iconName: "Mission" ),
                                 ListItem( title: "Programs", entity: PROGRAM_ENTITY_NAME, iconName: "Program" ),
                                 ListItem( title: "Astronauts", entity: ASTRONAUT_ENTITY_NAME, iconName: "AstronautColor",
                                           blurb: "people who have flown to space" ),
                                 ListItem( title: "Events", entity: EVENT_ENTITY_NAME, iconName: "Event",
                                           blurb: "happenings, briefings, meetings, anniversaries" ),
                                 ListItem( title: "Live Streams", entity: LIVE_STREAM_ENTITY_NAME, iconName: "LiveStream",
                                           blurb: "video streams of Starship activities" ),
                                 ListItem( title: "Starship Vehicles", entity: ROCKET_ENTITY_NAME, iconName: "Starship",
                                           blurb: "rocket instances" ),
                                 ListItem( title: "Docking", entity: DOCKING_EVENT_ENTITY_NAME, iconName: "Docking",
                                           blurb: "meetings of vehicles and space stations" ),
                                 ListItem( title: "Space Stations", entity: SPACESTATION_ENTITY_NAME, iconName: "Station",
                                           blurb: "long-term space locations" ),

                                 // the following are experimental
                                 ListItem( title: "Expeditions", entity: SPACESTATION_ENTITY_NAME, blurb: "trips to space stations" ),
                                 ListItem( title: "Flight Vehicles", entity: FLIGHT_VEHICLE_ENTITY_NAME ),
                                 ListItem( title: "Spacecraft", entity: SPACECRAFT_ENTITY_NAME ),
                                 ListItem( title: "Launchers", entity: LAUNCHER_ENTITY_NAME ) ]

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
                  GraySubheadlineText( text: listItem.blurb )
                  if let launchCount: Int = getRecordsCount( entityName: listItem.entity, context: context )
                  {
                     GraySubheadlineText( text: "\(launchCount) \(listItem.title.lowercased())" )
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
   var blurb: String?

   init( title: String, entity: String, iconName: String? = nil, blurb: String? = nil )
   {
      id = title
      self.title = title
      self.entity = entity
      self.iconName = iconName
      self.blurb = blurb
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
      case "Docking": return AnyView( DockingList() )
      case "Space Stations": return AnyView( SpaceStationList() )
      case "Expeditions": return AnyView( ExpeditionList() )
      case "Flight Vehicles": return AnyView( FlightVehicleList() )
      case "Spacecraft": return AnyView( SpacecraftList() )
      case "Launchers": return AnyView( LauncherList() )
      default: return AnyView( Text( "" ) ) // shouldn't happen
   }
}
