// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct SpaceStationLinks: View
{
   var spaceStations: Set< SpaceStation >

   var body: some View
   {
      Divider()
      HStack
      {
         Text( "Space Stations" )
            .font( .headline )
            .foregroundColor( .secondary )
         Spacer()
      }
      ForEach( sortSpaceStationsByName( spaceStationArray: Array( spaceStations ) ), id: \.self )
      {
         spaceStation in
         SpaceStationLink( spaceStationID: spaceStation.id )
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
            Text( name )
               .font( .subheadline )
            Spacer()
         }
         .padding( 4 )
      }
   }
}
