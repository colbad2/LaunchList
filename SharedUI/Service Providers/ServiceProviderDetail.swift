// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct ServiceProviderDetail: View
{
   var serviceProvider: ServiceProvider?

   var body: some View
   {
      ScrollView
      {
         TitleField( text: serviceProvider?.name )
         LeftField( text: serviceProvider?.type )
      }
      .padding()
   }
}

#if DEBUG
struct ServiceProviderPreview: PreviewProvider
{
   static var previews: some View
   {
      let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
      if let provider: ServiceProvider = getFirstEntity( context: context,
                                                         entityName: "ServiceProvider" ) as? ServiceProvider
      {
         Group
         {
            NavigationView
            {
               ServiceProviderDetail( serviceProvider: provider )
                  .border( Color.blue )
            }
            .environment( \.colorScheme, .dark )

            NavigationView
            {
               ServiceProviderDetail( serviceProvider: provider )
                  .border( Color.blue )
            }
            .environment( \.colorScheme, .light )

            // Assitive text large
            NavigationView
            {
               ServiceProviderDetail( serviceProvider: provider )
            }
            .environment( \.sizeCategory, .accessibilityExtraExtraExtraLarge )
         }
      }
   }
}
#endif
