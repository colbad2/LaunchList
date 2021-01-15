// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI
import CoreData

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

            if let programName = program.name
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
                  let codes = getAllAgencyFlags( program: program )
                  if let countryCodes = codes
                  {
                     Text( flagsFromCodeArray( countryCodes ) ?? "" )
                  }
               }
            }
            Spacer()
         }

         LeftField( prefix: "Began: ", text: dateString( program.startDate ) )
         LeftField( prefix: "Ended: ", text: dateString( program.endDate ) )

         DescriptionView( desc: program.programDescription )
//            .border(Color.black)

         if let agencies: NSSet = program.agencies
         {
            if agencies.count > 0
            {
               Divider()
               HStack
               {
                  Text( "Agencies" )
                     .font( .headline )
                     .foregroundColor( .secondary )
                  Spacer()
               }
               ForEach( getAgenciesArray( agencies: agencies ), id: \.self )
               {
                  agency in
                  AgencyLink( agencyID: agency.id )
                     .padding( 3 )
               }
            }
         }

         Divider()
         LinkBarView( infoURL: program.infoURL, wikiURL: program.wikiURL )
      }
      .padding()
      .navigationBarTitle( "Program", displayMode: .inline )
   }
}

func getAgenciesArray( agencies: NSSet ) -> [Agency]
{
   var programAgencies = Array( agencies as Set ) as? [Agency] ?? []
   programAgencies.sort( by: { ($0 as Agency).name! < ($1 as Agency).name! } )
   return programAgencies
}

/**
 Preview view of the [ProgramDetail]
 */
#if DEBUG
struct ProgramPreview: PreviewProvider
{
   static var previews: some View
   {
      let context = PersistenceController.preview.container.viewContext
      let issProgram = getEntityByID( entityID: 17,
                                      context: context,
                                      entityName: "Program") as? Program
      let artemisProgram = getEntityByID( entityID: 15,
                                          context: context,
                                          entityName: "Program") as? Program
      Group
      {
         if let iss = issProgram
         {
            NavigationView
            {
               ProgramDetail( program: iss )
            }
            .environment( \.colorScheme, .light )
         }

         if let artemis = artemisProgram
         {
            NavigationView
            {
               ProgramDetail( program: artemis )
            }
            .environment( \.colorScheme, .light )
         }

         if let iss = issProgram
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
