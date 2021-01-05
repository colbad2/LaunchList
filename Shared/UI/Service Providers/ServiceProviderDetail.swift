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
      .padding()
   }
}

#if DEBUG
struct ServiceProviderPreview: PreviewProvider
{
   static var previews: some View
   {
      let context = PersistenceController.preview.container.viewContext
      let provider = getFirstEntity( context: context,
                                     entityName: "ServiceProvider" ) as? ServiceProvider
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
#endif
