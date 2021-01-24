// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct EventLink: View
{
   var eventID: Int64?

   var body: some View
   {
      let context: NSManagedObjectContext = PersistenceController.shared.container.viewContext
      if let eventID: Int64 = eventID,
         let event: Event = getEvent( by: eventID, context: context ),
         let name: String = event.name
      {
         HStack
         {
            NavigationLink( destination: EventDetail( event: event ) )
            {
               Text( name )
                  .font( .subheadline )
            }
            .padding( 4 )
            Spacer()
         }
      }
   }
}
