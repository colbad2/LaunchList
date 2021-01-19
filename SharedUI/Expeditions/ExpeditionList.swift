// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct ExpeditionList: View
{
   @FetchRequest( entity: Expedition.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Expedition.start,
                                                       ascending: false ) ],
                  animation: .default )
   private var expeditions: FetchedResults< Expedition >

   var body: some View
   {
      List( expeditions )
      {
         ( expedition: Expedition ) in

         NavigationLink( destination: ExpeditionDetail( expedition: expedition ) )
         {
            ExpeditionRow( expedition: expedition )
         }
      }
      .navigationBarTitle( "Expeditions", displayMode: .inline )
   }
}

struct ExpeditionRow: View
{
   var expedition: Expedition

   var body: some View
   {
      RowImage( imageURL: expedition.spaceStation?.imageURL )
      VStack( alignment: .leading )
      {
         TitleField( text: expedition.name )
         HStack
         {
            if let start: String = expedition.start
            {
               Text( dateString( parseISODate( isoDate: start ) ) )
                  .font( .subheadline )
            }
            if let end: String = expedition.end
            {
               Text( "- " ) +
               Text( dateString( parseISODate( isoDate: end ) ) )
                  .font( .subheadline )
            }
         }
      }
   }
}

#if DEBUG
struct ExpeditionPreviews: PreviewProvider
{
   static var previews: some View
   {
      //      NavigationView
      //      {
      ExpeditionList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
      //      }
   }
}
#endif
