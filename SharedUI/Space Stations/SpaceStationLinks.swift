// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct SpaceStationLinks: View
{
   var spaceStations: Set< SpaceStation >

   var body: some View
   {
      if !spaceStations.isEmpty
      {
         Divider()
         GrayHeadlineText( text: "Space Stations" )
         ForEach( sortSpaceStationsByName( spaceStationArray: Array( spaceStations ) ) )
         {
            spaceStation in
            SpaceStationLink( spaceStationID: spaceStation.id )
         }
      }
   }
}

struct SpaceStationLink: View
{
   var spaceStationID: Int64?

   var body: some View
   {
      let context: NSManagedObjectContext = PersistenceController.shared.container.viewContext
      if let spaceStationID: Int64 = spaceStationID,
         let spaceStation: SpaceStation = getSpaceStation( by: spaceStationID, context: context ),
         let name: String = spaceStation.name
      {
         NavigationLink( destination: SpaceStationDetail( spaceStation: spaceStation ) )
         {
            BlackSubheadlineText( text: name )
            Spacer()
         }
         .padding( 4 )
      }
   }
}
