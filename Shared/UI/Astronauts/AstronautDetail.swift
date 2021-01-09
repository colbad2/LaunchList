import SwiftUI
import CoreData

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
               RowImage( imageURL: astronaut.profileImage, drawSpace: false )

               VStack
               {
                  TitleField( s: astronaut.name! )
                  LeftField( s: astronaut.nationality! )
                  LeftField( s: astronaut.type! )
                  LeftField( s: astronaut.status! )
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

                  if let twitter = wrapURL( astronaut.twitter )
                  {
                     HStack
                     {
                        Link( "Twitter", destination: twitter )
                           .font( .subheadline )
                        Spacer()
                     }
                  }

                  if let instagram = wrapURL( astronaut.instagram )
                  {
                     HStack
                     {
                        Link( "Instagram", destination: instagram )
                           .font( .subheadline )
                        Spacer()
                     }
                  }
               }
            }

            DescriptionView( desc: astronaut.bio )
            LinkBarView( wikiURL: astronaut.wiki )
         }
         .padding()
      }
      .navigationBarTitle( "Astronaut", displayMode: .inline )
   }
}

/**
 Format the time range string for an [Astronaut]s life. If there is no death date,
 provide "present" for the death value.

 - Parameter astronaut: astronaut to calculate the string for
 - Returns: string of the birth-death range

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

 - Parameter astronaut: astronaut to calculate the string for
 - Returns: string of the birth-death range

 ### Usage
 let birthDeath: String = dates( astronaut: astronautEntity )
 */
func flightDates( astronaut: Astronaut ) -> String
{
   let firstFlightDate = parseISODate( isoDate: astronaut.firstFlight )
   let firstFlightString = dateString( firstFlightDate ) ?? ""
   let lastFlightDate = parseISODate( isoDate: astronaut.lastFlight )
   let lastFlightString = dateString( lastFlightDate )
   var flightDates = dates( first: firstFlightString, second: lastFlightString )
   if firstFlightString == lastFlightString
   {
      flightDates = firstFlightString
   }

   return flightDates
}

func dates( first: String, second: String? ) -> String
{
   if second == nil { return first }

   return "\(first) to \(second!)"
}

/**
 Preview view of the [AstronautDetail]
 */
#if DEBUG
struct AstronautPreview: PreviewProvider
{
   static var previews: some View
   {
      let context = PersistenceController.preview.container.viewContext
      let astronaut = getEntityByID( id: 276,
                                     context: context,
                                     entityName: "Astronaut" ) as? Astronaut
      AstronautDetail( astronaut: astronaut! )
   }
}
#endif
