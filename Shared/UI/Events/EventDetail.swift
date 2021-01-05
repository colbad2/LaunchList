// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI
import CoreData

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
      VStack
      {
         TitleField( s: event.name )
         LeftField( s: event.date )
         LeftField( s: event.location )
         LeftField( s: event.type )
         IconView( withURL: event.featureImage )
         DescriptionView( desc: event.eventDescription )

         if event.newsURL != nil || event.videoURL != nil
         {
            HStack
            {
               if let news = wrapURL( event.newsURL )
               {
                  Link( "News", destination: news )
                     .font( .subheadline )
               }

               if let video = wrapURL( event.videoURL )
               {
                  Link( "Video", destination: video )
                     .font( .subheadline )
               }
            }
            .padding()
         }
      }
      .padding()

      /*
       let launches: [LaunchJSON]?
       let expeditions: [ExpeditionJSON]?
       let spaceStations: [SpaceStationJSON]?
       let programs: [ProgramJSON]?
       */
   }
}


// TODO preview
