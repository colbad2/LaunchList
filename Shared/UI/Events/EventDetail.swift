// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI
import CoreData

/**
 View of the details of an [Event].

 ### Usage
 EventDetail( event: eventEntity )
 */
struct EventDetail: View
{
   /** Entity with details to show. */
   var event: Event

   /** View contents. */
   var body: some View
   {
      TitleField( s: event.name )
   }
}
