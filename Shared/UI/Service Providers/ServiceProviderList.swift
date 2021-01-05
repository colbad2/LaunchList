import SwiftUI
import CoreData

struct ServiceProviderList: View
{
   @FetchRequest( entity: ServiceProvider.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \ServiceProvider.name,
                                                       ascending: true ) ],
                  animation: .default )
   private var providers: FetchedResults< ServiceProvider >

   var body: some View
   {
      List( providers )
      {
         ( provider: ServiceProvider ) in

         NavigationLink( destination: ServiceProviderDetail( serviceProvider: provider ) )
         {
            ServiceProviderRow( serviceProvider: provider )
         }
      }
      .navigationBarTitle( "Service Providers", displayMode: .inline )
   }
}

struct ServiceProviderRow: View
{
   var serviceProvider: ServiceProvider

   var body: some View
   {
      HStack
      {
         Text( "\(serviceProvider.name ?? "")" )
            .font( .headline )
            .allowsTightening( /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/ )
         Spacer()
         Text( "\(serviceProvider.type ?? "")" )
            .font( .subheadline )
            .foregroundColor( .secondary )
      }
   }
}

#if DEBUG
struct ServiceProviderListPreviews: PreviewProvider
{
   static var previews: some View
   {
      Group
      {
         // light view
         NavigationView
         {
            ServiceProviderList()
            .environment( \.managedObjectContext,
                          PersistenceController.preview.container.viewContext )
         }
         .environment( \.colorScheme, .light )

         // dark view
         NavigationView
         {
            ServiceProviderList()
            .environment( \.managedObjectContext,
                          PersistenceController.preview.container.viewContext )
         }
         .environment( \.colorScheme, .dark )

         // Assitive text large
         NavigationView
         {
            ServiceProviderList()
            .environment( \.managedObjectContext,
                          PersistenceController.preview.container.viewContext )
         }
         .environment( \.sizeCategory, .accessibilityExtraExtraExtraLarge )
      }
   }
}
#endif
