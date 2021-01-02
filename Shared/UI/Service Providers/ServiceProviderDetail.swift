import Foundation
import CoreData
import SwiftUI

// TODO unused
struct ServiceProviderDetail: View
{
   var serviceProvider: ServiceProvider?

   var body: some View
   {
      ScrollView
      {
         TitleField( s: serviceProvider?.name )
         LeftField( s: serviceProvider?.type )
      }
   }
}

struct ServiceProviderPreview: PreviewProvider
{
   static var previews: some View
   {
      let context = PersistenceController.preview.container.viewContext
      let provider = getFirstEntity( context: context,
                                     entityName: "ServiceProvider" ) as? ServiceProvider
      ServiceProviderDetail( serviceProvider: provider )
   }
}
