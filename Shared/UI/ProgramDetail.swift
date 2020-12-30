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
               Spacer()
            }

            if let programName = program?.name
            {
               Text( "\(programName)" )
                  .font( .title )
                  .foregroundColor( .primary )
            }
         }
         .padding()

         if let description = program?.programDescription
         {
            Text( "\(description)" )
         }

         HStack
         {
            if let infoURL = program?.infoURL
            {
               Link( "Info", destination: wrapURL( infoURL )! )
                  .font(.subheadline)
            }

            if let wikiURL = program?.wikiURL
            {
               Link( "Wiki", destination: wrapURL( wikiURL )! )
                  .font( .subheadline )
            }
         }
         .padding()

         /*
          var agencies: [AgencyJSON] = []
          var startDate: String?
          var endDate: String?
          */
      }
      .padding()
   }
}

struct ProgramPreview: PreviewProvider
{
   static var previews: some View
   {
      let managedObjectContext = PersistenceController.preview.container.viewContext
      let request = NSFetchRequest<NSFetchRequestResult>( entityName: "Program" )
      let program = try! managedObjectContext.fetch( request ).first as! Program

      ProgramDetail( program: program )
         .frame(width: nil)
   }
}
