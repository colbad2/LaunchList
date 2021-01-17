// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

/**
 View of the details of an [Astronaut].

 ### Usage
 AstronautDetail( astronaut: astronautEntity )
 */
struct AstronautDetail: View
{
   /** Entity with details to show. */
   var astronaut: Astronaut

   /** View contents. */
   var body: some View
   {
      VStack
      {
         ScrollView
         {
            HStack( alignment: .top )
            {
               RowImage( imageURL: astronaut.profileImage, drawSpace: false, imageWidth: 100, imageHeight: 120 )

               VStack
               {
                  TitleField( text: astronaut.name )
                  LeftField( text: astronaut.nationality )
                  LeftField( text: astronaut.type )
                  LeftField( text: astronaut.status )
                  AgencyLink( agencyID: astronaut.agency?.id )

                  HStack( alignment: .top )
                  {
                     Text( "Life:" )
                        .font( .subheadline )
                        .foregroundColor( .secondary )
                     Text( lifeDates( astronaut: astronaut ) )
                        .font( .subheadline )
                        .foregroundColor( .secondary )
                        .lineLimit( 3 )
                        .fixedSize( horizontal: false, vertical: true )
                     Spacer()
                  }

                  HStack( alignment: .top )
                  {
                     Text( "Flew:" )
                        .font( .subheadline )
                        .foregroundColor( .secondary )
                     Text( flightDates( astronaut: astronaut ) )
                        .font( .subheadline )
                        .foregroundColor( .secondary )
                        .lineLimit( 3 )
                        .fixedSize( horizontal: false, vertical: true )
                     Spacer()
                  }

                  SocialMediaLink( linkURL: astronaut.twitter, title: "Twitter" )
                  SocialMediaLink( linkURL: astronaut.instagram, title: "Instagram" )
               }
            }

            DescriptionView( desc: astronaut.bio )
            LinkBarView( links: [ "Wiki": astronaut.wiki ?? "" ] )
         }
         .padding()
      }
      .navigationBarTitle( "Astronaut", displayMode: .inline )
   }
}

/**
 Format the time range string for an [Astronaut]s life. If there is no death date,
 provide "present" for the death value.

 - parameter astronaut: astronaut to calculate the string for
 - returns: string of the birth-death range

 ### Usage
 let birthDeath: String = dates( astronaut: astronautEntity )
 */
func lifeDates( astronaut: Astronaut ) -> String
{
   return dates( first: astronaut.dateOfBirth ?? "",
                 second: astronaut.dateOfDeath ?? "present" )
}

/**
 Format the time range string for an [Astronaut]s flight career. If there is no end date,
 provide "present" for the end value.

 - parameter astronaut: astronaut to calculate the string for
 - returns: string of the birth-death range

 ### Usage
 let birthDeath: String = dates( astronaut: astronautEntity )
 */
func flightDates( astronaut: Astronaut ) -> String
{
   let firstFlightDate: Date? = parseISODate( isoDate: astronaut.firstFlight )
   let firstFlightString: String = dateString( firstFlightDate )
   let lastFlightDate: Date? = parseISODate( isoDate: astronaut.lastFlight )
   let lastFlightString: String = dateString( lastFlightDate )
   var flightDates: String = dates( first: firstFlightString, second: lastFlightString )
   if firstFlightString == lastFlightString
   {
      flightDates = firstFlightString
   }

   return flightDates
}

func dates( first: String, second: String? ) -> String
{
   guard let second = second else { return first }

   return "\(first) to \(second)"
}

/**
 Preview view of the [AstronautDetail]
 */
#if DEBUG
struct AstronautPreview: PreviewProvider
{
   static var previews: some View
   {
      let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
      if let astronaut: Astronaut = getEntityByID( entityID: 276,
                                                   context: context,
                                                   entityName: ASTRONAUT_ENTITY_NAME ) as? Astronaut
      {
         AstronautDetail( astronaut: astronaut )
      }
   }
}
#endif
