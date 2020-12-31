import Foundation
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

         ServiceProviderRow( serviceProvider: provider )
      }
      .navigationBarTitle( "Service Providers", displayMode: .inline )
   }
}

struct ServiceProviderListPreviews: PreviewProvider
{
   static var previews: some View
   {
      ServiceProviderList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
   }
}
