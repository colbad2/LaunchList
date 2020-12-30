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
         }

         if let variant = rocket?.variant
         {
            Text( "\(variant)" )
               .font( .title )
               .foregroundColor( .primary )
         }
      }
      .padding()
   }
}

struct RocketPreview: PreviewProvider
{
   static var previews: some View
   {
      let managedObjectContext = PersistenceController.preview.container.viewContext
      let request = NSFetchRequest<NSFetchRequestResult>( entityName: "Rocket" )
      let rocket = try! managedObjectContext.fetch( request ).first as! Rocket

      RocketDetail( rocket: rocket )
         .frame(width: nil)
   }
}
