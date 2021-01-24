// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

/**
 View of the details of a `SpaceStation`.

 ### Usage
     SpaceStationDetail( spaceStation: spaceStationEntity )
 */
struct SpaceStationDetail: View
{
   /** Entity with details to show. */
   var spaceStation: SpaceStation?

   /** View contents. */
   var body: some View
   {
//      VStack
//      {
         ScrollView
         {
            VStack
            {
               TitleField( text: spaceStation?.name )
               LeftField( text: spaceStation?.status )
               LeftField( text: spaceStation?.orbit )
            }

            LoadedImageView( withURL: spaceStation?.imageURL )

            StationEventList( stationEvents: spaceStation?.eventsSet )
            StationExpeditionList( stationExpeditions: spaceStation?.expeditionsSet )
         }
         .padding()
//      }
      .navigationBarTitle( "SpaceStation", displayMode: .inline )
   }
}

struct StationExpeditionList: View
{
   var stationExpeditions: Set< Expedition >?

   var body: some View
   {
      if let expeditions: Set< Expedition > = stationExpeditions
      {
         if !expeditions.isEmpty
         {
            Divider()
            HStack
            {
               // TODO collect these
               Text( "Expeditions" )
                  .font( .headline )
                  .foregroundColor( .secondary )
               Spacer()
            }
            // TODO make Expeditions identifiable so the id: param isn't needed
            ForEach( sortExpeditionsByDate( expeditionArray: Array( expeditions ) ), id: \.self )
            {
               expedition in
               ExpeditionLink( expeditionID: expedition.id )
            }
         }
      }
   }
}

struct StationEventList: View
{
   var stationEvents: Set< Event >?

   var body: some View
   {
      if let events: Set< Event > = stationEvents
      {
         if !events.isEmpty
         {
            Divider()
            HStack
            {
               Text( "Events" )
                  .font( .headline )
                  .foregroundColor( .secondary )
               Spacer()
            }
            ForEach( sortEventsByName( eventArray: Array( events ) ), id: \.self )
            {
               event in
               EventLink( eventID: event.id )
            }
         }
      }
   }
}

func getEventArray( events: Set< Event > ) -> [Event]
{
   return sortEventsByName( eventArray: Array( events ) )
}

func getExpeditionsArray( expeditions: Set< Expedition > ) -> [Expedition]
{
   return sortExpeditionsByName( expeditionArray: Array( expeditions ) )
}

struct ExpeditionLink: View
{
   var expeditionID: Int64?

   var body: some View
   {
      let context: NSManagedObjectContext = PersistenceController.shared.container.viewContext
      if let expeditionID: Int64 = expeditionID,
         let expedition: Expedition = getExpedition( by: expeditionID, context: context ),
         let name: String = expedition.name
      {
         HStack
         {
            NavigationLink( destination: ExpeditionDetail( expedition: expedition ) )
            {
               Text( name )
               .font( .subheadline )
            }
            if let dates: String = expeditionDates( expedition: expedition )
            {
               Spacer()
               Text( dates )
            }
         }
         .padding( 4 )
      }
   }
}

/**
 Preview of the `SpaceStationDetail`
 */
#if DEBUG
struct SpaceStationPreview: PreviewProvider
{
   static var previews: some View
   {
      if let spaceStation: SpaceStation = getSampleSpaceStationEntity()
      {
         SpaceStationDetail( spaceStation: spaceStation )
      }
   }
}
#endif
