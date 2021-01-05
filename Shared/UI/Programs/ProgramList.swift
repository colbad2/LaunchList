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
      List( programs )
      {
         ( program: Program ) in
         
         NavigationLink( destination: ProgramDetail( program: program ) )
         {
            ProgramRow( program: program )
         }
      }
      .navigationBarTitle( "Programs", displayMode: .inline )
   }
}

struct ProgramRow: View
{
   var program: Program

   var body: some View
   {
      Text( "\(program.name ?? "")" )
         .font( .headline )
         .lineLimit( 2 )
   }
}

#if DEBUG
struct ProgramListPreviews: PreviewProvider
{
   static var previews: some View
   {
      ProgramList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
   }
}
#endif
