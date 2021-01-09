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
            TitleField( s: event.name )
            LeftField( s: dateString( event.date ) )
            LeftField( s: event.location )
            LeftField( s: event.type )
            IconView( withURL: event.featureImage )
            DescriptionView( desc: event.eventDescription )

            Group
            {
               // TODO make a link bar take an array of link/titles and generate
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

               LaunchLinks( launches: event.launches )
               ProgramLinks( programs: event.programs )
               ExpeditionLinks( expeditions: event.expeditions )
               SpaceStationLinks( spaceStations: event.spaceStations )
            }
         }
      }
      .padding()
   }
}


// TODO preview
