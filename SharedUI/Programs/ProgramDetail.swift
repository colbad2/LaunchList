// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

/**
 View of the details of a [Program].

 ### Usage
     ProgramDetail( program: programEntity )
 */
struct ProgramDetail: View
{
   /** Entity with details to show. */
   var program: Program

   /** View contents. */
   var body: some View
   {
      ScrollView
      {
         HStack( alignment: .top )
         {
            RowImage( imageURL: program.imageURL, drawSpace: false, imageWidth: 100, imageHeight: 100 )

            if let programName: String = program.name
            {
               VStack( alignment: .leading )
               {
                  Text( programName )
                     .font( .title )
                     .foregroundColor( .primary )
                     .lineLimit( 3 )
                     .layoutPriority( 200 )
                     .fixedSize( horizontal: false, vertical: true )
                  // here to force last line to draw, may be fixed in later SwiftUI releases
                  let countryCodes: [String] = getAllAgencyFlags( program: program )
                  Text( flagsFromCodeArray( countryCodes ) ?? "" )
               }
            }
            Spacer()
         }

         LeftField( prefix: "Began: ", text: dateString( program.startDate ) )
         LeftField( prefix: "Ended: ", text: dateString( program.endDate ) )

         DescriptionView( desc: program.programDescription )
//            .border(Color.black)

         ProgramAgencyList( program: program )

         Divider()
         LinkBarView( links: [ "Info": program.infoURL ?? "", "Wiki": program.wikiURL ?? "" ] )
      }
      .padding()
      .navigationBarTitle( "Program", displayMode: .inline )
   }
}

struct ProgramAgencyList: View
{
   var program: Program

   /** View contents. */
   var body: some View
   {
      if program.hasAgencies
      {
         Divider()
         HStack
         {
            Text( "Agencies" )
               .font( .headline )
               .foregroundColor( .secondary )
            Spacer()
         }
         ForEach( program.sortedAgencies, id: \.self )
         {
            agency in
            AgencyLink( agencyID: agency.id )
               .padding( 3 )
         }
      }
   }
}

/**
 Preview view of the [ProgramDetail]
 */
#if DEBUG
struct ProgramPreview: PreviewProvider
{
   static var previews: some View
   {
      let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
      let issProgram: Program? = getEntityByID( entityID: 17,
                                                context: context,
                                                entityName: "Program") as? Program
      let artemisProgram: Program? = getEntityByID( entityID: 15,
                                                    context: context,
                                                    entityName: "Program") as? Program
      Group
      {
         if let iss: Program = issProgram
         {
            NavigationView
            {
               ProgramDetail( program: iss )
            }
            .environment( \.colorScheme, .light )
         }

         if let artemis: Program = artemisProgram
         {
            NavigationView
            {
               ProgramDetail( program: artemis )
            }
            .environment( \.colorScheme, .light )
         }

         if let iss: Program = issProgram
         {
            NavigationView
            {
               ProgramDetail( program: iss )
            }
            .environment( \.colorScheme, .dark )
         }
      }
   }
}
#endif