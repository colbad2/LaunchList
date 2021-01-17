// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

/**
 View of the details of an [SpaceStation].

 ### Usage
 SpaceStationDetail( spaceStation: spaceStationEntity )
 */
struct SpaceStationDetail: View
{
   /** Entity with details to show. */
   var spaceStation: SpaceStation

   /** View contents. */
   var body: some View
   {
      VStack
      {
         ScrollView
         {
            VStack
            {
               TitleField( text: spaceStation.name )
               LeftField( text: spaceStation.status )
               LeftField( text: spaceStation.orbit )
            }

            IconView( withURL: spaceStation.imageURL )

            StationEventList( stationEvents: spaceStation.eventsSet )
            StationExpeditionList( stationExpeditions: spaceStation.expeditionsSet )
         }
         .padding()
      }
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
               Text( "Expeditions" )
                  .font( .headline )
                  .foregroundColor( .secondary )
               Spacer()
            }
            ForEach( sortExpeditionsByName( expeditionArray: Array( expeditions ) ), id: \.self )
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
            Text( name )
               .font( .subheadline )
            Spacer()
            VStack
            {
               if let start: String = expedition.start
               {
                  Text( start )
                     .font( .subheadline )
               }
               if let end: String = expedition.end
               {
                  Text( end )
                     .font( .subheadline )
               }
            }
         }
         .padding( 4 )
      }
   }
}

struct EventLink: View
{
   var eventID: Int64?

   var body: some View
   {
      let context: NSManagedObjectContext = PersistenceController.shared.container.viewContext
      if let eventID: Int64 = eventID,
         let event: Event = getEvent( by: eventID, context: context ),
         let name: String = event.name
      {
         HStack
         {
            NavigationLink( destination: EventDetail( event: event ) )
            {
               Text( name )
                  .font( .subheadline )
            }
            .padding( 4 )
            Spacer()
         }
      }
   }
}

/**
 Preview of the [SpaceStationDetail]
 */
#if DEBUG
struct SpaceStationPreview: PreviewProvider
{
   static var previews: some View
   {
      let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
      if let spaceStation: SpaceStation = getEntityByID( entityID: 4,
                                                         context: context,
                                                         entityName: SPACESTATION_ENTITY_NAME ) as? SpaceStation
      {
         SpaceStationDetail( spaceStation: spaceStation )
      }
   }
}
#endif
