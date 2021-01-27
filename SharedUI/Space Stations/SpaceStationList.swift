// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct SpaceStationList: View
{
   @FetchRequest( entity: SpaceStation.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \SpaceStation.name,
                                                       ascending: true ) ],
                  animation: .default )
   private var spaceStations: FetchedResults< SpaceStation >

   var body: some View
   {
      List( spaceStations )
      {
         ( spaceStation: SpaceStation ) in

         NavigationLink( destination: SpaceStationDetail( spaceStation: spaceStation ) )
         {
            SpaceStationRow( spaceStation: spaceStation )
         }
      }
      .navigationTitle( "SpaceStations" )
      .navigationBarTitleDisplayMode( .inline )
   }
}

struct SpaceStationRow: View
{
   var spaceStation: SpaceStation

   var body: some View
   {
      RowImage( imageURL: spaceStation.imageURL )

      VStack( alignment: .leading )
      {
         TitleField( text: spaceStation.name )
      }
   }
}

#if DEBUG
struct SpaceStationPreviews: PreviewProvider
{
   static var previews: some View
   {
      Group
      {
         // SpaceStationRow(spaceStation: <#T##SpaceStation#>)

         // light view
         NavigationView
         {
            SpaceStationList()
            .environment( \.managedObjectContext,
                          PersistenceController.preview.container.viewContext )
         }
         .environment( \.colorScheme, .light )

         // dark view
         NavigationView
         {
            SpaceStationList()
            .environment( \.managedObjectContext,
                          PersistenceController.preview.container.viewContext )
         }
         .environment( \.colorScheme, .dark )

         // Assitive text large
         NavigationView
         {
            SpaceStationList()
            .environment( \.managedObjectContext,
                          PersistenceController.preview.container.viewContext )
         }
         .environment( \.sizeCategory, .accessibilityExtraExtraExtraLarge )
      }
   }
}
#endif
