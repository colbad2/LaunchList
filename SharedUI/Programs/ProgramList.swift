// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

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
      RowImage( imageURL: program.imageURL, drawSpace: false, imageWidth: 50, imageHeight: 50 )

      if let name: String = program.name
      {
         VStack( alignment: .leading )
         {
            Text( name )
               .font( .headline )
               .lineLimit( 2 )
         }
      }
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
