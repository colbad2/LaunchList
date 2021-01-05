import SwiftUI
import CoreData

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
      .navigationBarTitle( "Events", displayMode: .inline )
   }
}

struct EventRow: View
{
   var event: Event

   var body: some View
   {
      RowImage( imageURL: event.featureImage )
      VStack( alignment: .leading )
      {
         TitleField( s: event.name! )
         Text( event.date! )
            .font( .subheadline )
            .foregroundColor( .secondary )
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
