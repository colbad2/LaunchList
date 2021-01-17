// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

/**
 View of the details of an [Event].

 ### Usage
 EventDetail( event: eventEntity )
 */
struct EventDetail: View
{
   /** Entity with details to show. */
   var event: Event

   /** View contents. */
   var body: some View
   {
      ScrollView
      {
         VStack
         {
            TitleField( text: event.name )
            LeftField( text: dateString( event.date ) )
            LeftField( text: event.location )
            LeftField( text: event.type )
            IconView( withURL: event.featureImage )
            DescriptionView( desc: event.eventDescription )

            Group
            {
               let links: [String: String] = [ "News": event.newsURL ?? "", "Video": event.videoURL ?? "" ]
               LinkBarView( links: links )
               LaunchLinks( launches: event.launchesSet )
               ProgramLinks( programs: event.programsSet )
               ExpeditionLinks( expeditions: event.expeditionsSet )
               SpaceStationLinks( spaceStations: event.spaceStationsSet )
            }
         }
      }
      .padding()
   }
}
