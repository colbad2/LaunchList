import Foundation
import SwiftUI
import CoreData

struct ProgramList: View
{
   @FetchRequest( entity: Program.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Program.name,
                                                       ascending: true ) ],
                  animation: .default )
   private var programs: FetchedResults< Program >

   var body: some View
   {
      NavigationView
      {
         List( programs )
         {
            ( program: Program ) in

            NavigationLink( destination: ProgramDetail( program: program ) )
            {
               ProgramRow( program: program )
            }
         }
         .navigationTitle( "Programs" )
      }
   }
}


struct ProgramListPreviews: PreviewProvider
{
   static var previews: some View
   {
      ProgramList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
   }
}
