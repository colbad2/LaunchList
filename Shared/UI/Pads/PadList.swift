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

struct PadRow: View
{
   var pad: Pad

   var body: some View
   {
      if let name = pad.name
      {
         Text( name )
            .font( .headline )
            .lineLimit( 3 )
         if let countryCode = pad.location?.countryCode
         {
            Spacer()
            Text( flags( for: countryCode )! )
         }
      }
   }
}

/**
 Preview layouts.
 */
#if DEBUG
struct PadListPreviews: PreviewProvider
{
   static var previews: some View
   {
      Group
      {
         // light view
         NavigationView
         {
            PadList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
         }
         .environment( \.colorScheme, .light )

         // dark view
         NavigationView
         {
            PadList()
            .environment( \.managedObjectContext,
                          PersistenceController.preview.container.viewContext )
         }
         .environment( \.colorScheme, .dark )

         // Assitive text large
         NavigationView
         {
            PadList()
            .environment( \.managedObjectContext,
                          PersistenceController.preview.container.viewContext )
         }
         .environment( \.sizeCategory, .accessibilityExtraExtraExtraLarge )
      }
   }
}
#endif
