// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI
import CoreData

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
               TitleField( s: spaceStation.name! )
               LeftField( s: spaceStation.status )
               LeftField( s: spaceStation.orbit )
            }

            IconView( withURL: spaceStation.imageURL )

            if let events: NSSet = spaceStation.events
            {
               if events.count > 0
               {
                  Divider()
                  HStack
                  {
                     Text( "Events" )
                        .font( .headline )
                        .foregroundColor( .secondary )
                     Spacer()
                  }
                  ForEach( getEventArray( events: events ), id: \.self )
                  {
                     event in
                     EventLink( eventID: event.id )
                  }
               }
            }

//            if let expeditions: NSSet = spaceStation.expeditions
//            {
//               if expeditions.count > 0
//               {
//                  Divider()
//                  HStack
//                  {
//                     Text( "Expeditions" )
//                        .font( .headline )
//                        .foregroundColor( .secondary )
//                     Spacer()
//                  }
//                  ForEach( getExpeditionsArray( expeditions: expeditions ), id: \.self )
//                  {
//                     expedition in
//                     ExpeditionLink( expeditionID: expedition.id )
//                  }
//               }
//            }
         }
         .padding()
      }
      .navigationBarTitle( "SpaceStation", displayMode: .inline )
   }
}

func getEventArray( events: NSSet ) -> [Event]
{
   var spaceStationEvents = Array( events as Set ) as! [Event]
   spaceStationEvents.sort( by: { ($0 as Event).name! < ($1 as Event).name! } )
   return spaceStationEvents
}

func getExpeditionsArray( expeditions: NSSet ) -> [Expedition]
{
   var spaceStationExpeditions = Array( expeditions as Set ) as! [Expedition]
   spaceStationExpeditions.sort( by: { ($0 as Expedition).start! < ($1 as Expedition).start! } )
   return spaceStationExpeditions
}

struct ExpeditionLink: View
{
   var expeditionID: Int64?

   var body: some View
   {
      let context = PersistenceController.shared.container.viewContext
      if let expeditionID = expeditionID,
         let expedition = getExpedition( by: expeditionID, context: context )
      {
         HStack
         {
            Text( "\( expedition.name! )" )
               .font( .subheadline )
            Spacer()
            VStack
            {
               Text( "\(expedition.start ?? "")" )
                  .font( .subheadline )
               Text( "\(expedition.end ?? "")" )
                  .font( .subheadline )
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
      let context = PersistenceController.shared.container.viewContext
      if let eventID = eventID,
         let event = getEvent( by: eventID, context: context )
      {
         HStack
         {
            NavigationLink( destination: EventDetail( event: event ) )
            {
               Text( "\( event.name! )" )
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
      let context = PersistenceController.preview.container.viewContext
      let spaceStation = getEntityByID( id: 4,
                                        context: context,
                                        entityName: "SpaceStation" ) as? SpaceStation
      SpaceStationDetail( spaceStation: spaceStation! )

      // TODO add expedition and event to preview CD to get all UI elements
   }
}
#endif
