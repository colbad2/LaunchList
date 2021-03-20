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
      .navigationTitle( "SpaceStation" )
      .navigationBarTitleDisplayMode( .inline )
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
            GrayHeadlineText( text: "Expeditions" )
            ForEach( sortExpeditionsByDate( expeditionArray: Array( expeditions ) ) )
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
            GrayHeadlineText( text: "Events" )
            ForEach( sortEventsByName( eventArray: Array( events ) ) )
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
   sortEventsByName( eventArray: Array( events ) )
}

func getExpeditionsArray( expeditions: Set< Expedition > ) -> [Expedition]
{
   sortExpeditionsByName( expeditionArray: Array( expeditions ) )
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
               BlackSubheadlineText( text: name )
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
