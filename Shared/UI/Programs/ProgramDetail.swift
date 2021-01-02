import Foundation
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
   var program: Program?

   /** View contents. */
   var body: some View
   {
      ScrollView
      {
         HStack
         {
            if let programImage = program?.imageURL
            {
               IconView( withURL: programImage )
                  .frame( width: 50, height: 50 )
               Spacer().frame( width: 15 )
            }

            if let programName = program?.name
            {
               Text( "\(programName)" )
                  .font( .title )
                  .foregroundColor( .primary )
            }
            Spacer()
         }

         DescriptionView( desc: program?.programDescription )

         if let agencies: NSSet = program?.agencies
         {
            if agencies.count > 0
            {
               Spacer()
               HStack
               {
                  Text( "Agencies:" )
                     .font( .title3 )
                     .foregroundColor( .primary )
                  Spacer()
               }
               // TODO sort array by name
               ForEach( Array( agencies as Set ), id: \.self )
               {
                  agency in
                  let a = agency as! Agency
                  AgencyLink( agencyID: a.id )
               }
            }
         }

         LinkBarView( infoURL: program?.infoURL, wikiURL: program?.wikiURL )

         /*
          var agencies: [AgencyJSON] = []
          var startDate: String?
          var endDate: String?
          */
      }
      .padding()
      .navigationBarTitle( "Program", displayMode: .inline )
   }
}

/**
 Preview view of the [ProgramDetail]
 */
struct ProgramPreview: PreviewProvider
{
   static var previews: some View
   {
      let program = getFirstEntity( context: PersistenceController.preview.container.viewContext,
                                     entityName: "Program") as? Program
      ProgramDetail( program: program )
   }
}
