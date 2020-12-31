import Foundation
import SwiftUI

struct ServiceProviderRow: View
{
   var serviceProvider: ServiceProvider

   var body: some View
   {
      HStack( alignment: .top, spacing: 2 )
      {
         Text( "\(serviceProvider.name ?? "")" )
            .font( .headline )
         Spacer()
         Text( "\(serviceProvider.type ?? "")" )
            .font( .subheadline )
            .foregroundColor( .secondary )
      }
   }
}
