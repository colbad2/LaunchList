import Foundation
import SwiftUI
import CoreData

struct AstronautDetail: View
{
   var astronaut: Astronaut

   var body: some View
   {
      VStack
      {
         ScrollView
         {
            HStack( alignment: .top )
            {
               if let profileImage = astronaut.profileImage
               {
                  IconView( withURL: profileImage )
                     .frame( width: 100, height: 150 )
                  Spacer()
                     .frame( width: 15 )
               }

               VStack
               {
                  TitleField( s: astronaut.name! )
                  LeftField( s: astronaut.nationality! )
                  LeftField( s: astronaut.type! )
                  LeftField( s: astronaut.status! )

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

                  // TODO use these defs in other detail views

                  /*
                   var agency: AgencyJSON?
                   var profileImage: String?
                   var profileImageThumbnail: String?
                   */
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

func lifeDates( astronaut: Astronaut ) -> String
{
   let lifeDates = dates( first: astronaut.dateOfBirth ?? "",
             second: astronaut.dateOfDeath ?? "present" )

   return lifeDates
}

func flightDates( astronaut: Astronaut ) -> String
{
   let firstFlightDate = parseISODate( isoDate: astronaut.firstFlight )
   let firstFlightString = dateString( d: firstFlightDate ) ?? ""
   let lastFlightDate = parseISODate( isoDate: astronaut.lastFlight )
   let lastFlightString = dateString( d: lastFlightDate )
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
