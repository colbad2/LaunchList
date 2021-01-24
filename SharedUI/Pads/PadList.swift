// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

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
      if let name: String = pad.name
      {
         RowImage( imageURL: pad.mapImage, defaultImage: UIImage( named: "AstronautB&W" ),
                   imageWidth: 100, imageHeight: 60 )

         BlackHeadlineText( text: name )
         if let countryCode: String = pad.location?.countryCode
         {
            if countryCode != "UNK"
            {
               Text( flags( for: countryCode ) ?? "" )
            }
         }
      }
   }
}

#if DEBUG
/**
 Preview layouts.
 */
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
