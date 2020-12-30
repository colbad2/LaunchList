import Foundation
import CoreData
import SwiftUI

struct MissionDetail: View
{
   var mission: Mission?

   var body: some View
   {
      ScrollView
      {
         if let missionName = mission?.name
         {
            Text( "\(missionName)" )
               .font( .title )
               .foregroundColor( .primary )
         }

         if let type = mission?.type
         {
            Text( "\(type)" )
         }

         if let orbit = mission?.orbitName
         {
            Text( "\(orbit)" )
         }

         Divider()

         if let description = mission?.missionDescription
         {
            Text( "\(description)" )
         }
      }
      .padding()
   }
}

struct MissionDetailPreview: PreviewProvider
{
   static var previews: some View
   {
      let managedObjectContext = PersistenceController.preview.container.viewContext
      let request = NSFetchRequest<NSFetchRequestResult>( entityName: "Mission" )
      let mission = try! managedObjectContext.fetch( request ).first as! Mission

      MissionDetail( mission: mission )
   }
}
