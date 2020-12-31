import Foundation
import SwiftUI
import CoreData

struct RocketDetail: View
{
   var rocket: Rocket?

   var body: some View
   {
      ScrollView
      {
         if let rocketName = rocket?.family
         {
            Text( "\(rocketName)" )
               .font( .title )
               .foregroundColor( .primary )
            Spacer()
         }

         if let variant = rocket?.variant
         {
            Text( "\(variant)" )
               .font( .title )
               .foregroundColor( .primary )
         }
      }
      .padding()
      .navigationBarTitle( "", displayMode: .inline )
   }
}

struct RocketPreview: PreviewProvider
{
   static var previews: some View
   {
      // TODO doesn't work
      let context = PersistenceController.preview.container.viewContext
      let rocket = getEntityByID( id: 2663,
                                  context: context,
                                  entityName: "Rocket") as? Rocket
      RocketDetail( rocket: rocket )
   }
}
