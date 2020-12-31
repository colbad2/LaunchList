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
         if let serviceProviderName = serviceProvider?.name
         {
            Text( "\(serviceProviderName)" )
               .font( .title )
               .foregroundColor( .primary )
         }

         if let type = serviceProvider?.type
         {
            Text( "\(type)" )
               .font( .subheadline )
               .foregroundColor( .secondary )
         }
      }
   }
}

struct ServiceProviderPreview: PreviewProvider
{
   static var previews: some View
   {
      let provider = getFirstEntity( context: PersistenceController.preview.container.viewContext,
                                     entityName: "ServiceProvider") as? ServiceProvider
      ServiceProviderDetail( serviceProvider: provider )
   }
}
