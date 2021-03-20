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
      .navigationTitle( "Expeditions" )
      .navigationBarTitleDisplayMode( .inline )
   }
}

func expeditionTitle( expedition: Expedition? ) -> String?
{
   guard let expedition = expedition else { return nil }
   var result: String = ""

   if let name: String = expedition.name
   {
      result += name
   }
   if let spaceStationName: String = expedition.spaceStation?.name
   {
      result += " to "
      result += spaceStationName
   }

   return result
}

/**
 Formats the dates of an `Expedition`.

 - parameter expedition: `Expedition` where to get the dates
 - returns: `String` with the formatted dates, nil if not possible
 */
public func expeditionDates( expedition: Expedition? ) -> String?
{
   guard let expedition = expedition else { return nil }
   var result: String = ""

   if let start: String = expedition.start
   {
      result += dateString( parseISODate( isoDate: start ) )
   }
   if let end: String = expedition.end
   {
      result += " to "
      result += dateString( parseISODate( isoDate: end ) )
   }
   else
   {
      result += " ongoing"
   }

   return result
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
