// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct EventList: View
{
   @FetchRequest( entity: Event.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Event.name,
                                                       ascending: true ) ],
                  animation: .default )
   private var events: FetchedResults< Event >

   var body: some View
   {
      List( events )
      {
         ( event: Event ) in

         NavigationLink( destination: EventDetail( event: event ) )
         {
            EventRow( event: event )
         }
      }
      .navigationTitle( "Events" )
      .navigationBarTitleDisplayMode( .inline )
   }
}

struct EventRow: View
{
   var event: Event
   var nextEventID: Int64?

   var body: some View
   {
      RowImage( imageURL: event.featureImage )
      VStack( alignment: .leading )
      {
         HStack
         {
            TitleField( text: event.name )
            if event.id == nextEventID
            {
               Spacer()
               NextCapsule()
            }
         }
         GraySubheadlineText( text: dateString( event.date ) )
      }
   }
}

struct NextCapsule: View
{
   var body: some View
   {
      ZStack
      {
         Capsule()
            .fill( Color.blue )
            .frame( width: 50, height: 20 )
         Text( "Next" )
            .foregroundColor( Color.white )
            .font( .subheadline )
      }
   }
}

#if DEBUG
struct EventPreviews: PreviewProvider
{
    static var previews: some View
    {
//      NavigationView
//      {
        EventList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
//      }
    }
}
#endif
