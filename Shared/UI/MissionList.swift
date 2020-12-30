import Foundation
import SwiftUI
import CoreData

struct MissionList: View
{
   @FetchRequest( entity: Mission.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Mission.name,
                                                       ascending: true ) ],
                  animation: .default )
   private var missions: FetchedResults< Mission >

   var body: some View
   {
      NavigationView
      {
         List( missions )
         {
            ( mission: Mission ) in

            NavigationLink( destination: MissionDetail( mission: mission ) )
            {
               MissionRow( mission: mission )
            }
         }
         .navigationTitle( "Missions" )
      }
   }
}

struct MissionRow: View
{
   var mission: Mission

   var body: some View
   {
      HStack( alignment: .top, spacing: 2 )
      {
         Text( "\(mission.name ?? "")" )
               .font( .headline )
      }
   }
}


struct MissionListPreviews: PreviewProvider
{
   static var previews: some View
   {
      MissionList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
   }
}
