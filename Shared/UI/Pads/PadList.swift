import Foundation
import SwiftUI
import CoreData

struct PadList: View
{
   @FetchRequest( entity: Pad.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Pad.name,
                                                       ascending: true ) ],
                  animation: .default )
   private var pads: FetchedResults< Pad >

   var body: some View
   {
      List( pads )
      {
         ( pad: Pad ) in
         
         NavigationLink( destination: PadDetail( pad: pad ) )
         {
            PadRow( pad: pad )
         }
      }
      .navigationBarTitle( "Pads", displayMode: .inline )
   }
}


struct PadListPreviews: PreviewProvider
{
   static var previews: some View
   {
      PadList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
   }
}
