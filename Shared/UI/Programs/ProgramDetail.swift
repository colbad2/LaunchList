import Foundation
import SwiftUI
import CoreData

struct ProgramDetail: View
{
   var program: Program?

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

struct ProgramPreview: PreviewProvider
{
   static var previews: some View
   {
      let program = getFirstEntity( context: PersistenceController.preview.container.viewContext,
                                     entityName: "Program") as? Program
      ProgramDetail( program: program )
   }
}
