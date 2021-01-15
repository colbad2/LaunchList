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
         RowImage( imageURL: pad.mapImage, defaultImage: UIImage( named: "AstronautB&W" ), w: 100, h: 60 )

         Text( name )
            .font( .headline )
            .layoutPriority( 2 )
         if let countryCode = pad.location?.countryCode
         {
            if countryCode != "UNK"
            {
               Text( flags( for: countryCode )! )
            }
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
