// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct SpaceStationLinks: View
{
   var spaceStations: NSSet?

   var body: some View
   {
      if let spaceStations = spaceStations
      {
         if spaceStations.count > 0
         {
            Divider()
            HStack
            {
               Text( "Space Stations" )
                  .font( .headline )
                  .foregroundColor( .secondary )
               Spacer()
            }
            ForEach( getSpaceStationsArray( spaceStations: spaceStations ), id: \.self )
            {
               spaceStation in
               SpaceStationLink( spaceStationID: spaceStation.id )
            }
         }
      }
   }
}

struct SpaceStationLink: View
{
   var spaceStationID: Int64?

   var body: some View
   {
      let context = PersistenceController.shared.container.viewContext
      if let spaceStationID = spaceStationID,
         let spaceStation = getSpaceStation( by: spaceStationID, context: context )
      {
         NavigationLink( destination: SpaceStationDetail( spaceStation: spaceStation ) )
         {
            Text( "\( spaceStation.name! )" )
               .font( .subheadline )
            Spacer()
         }
         .padding( 4 )
      }
   }
}

func getSpaceStationsArray( spaceStations: NSSet ) -> [SpaceStation]
{
   var eventSpaceStations = Array( spaceStations as Set ) as! [SpaceStation]
   eventSpaceStations.sort( by: { ($0 as SpaceStation).name! < ($1 as SpaceStation).name! } )
   return eventSpaceStations
}
