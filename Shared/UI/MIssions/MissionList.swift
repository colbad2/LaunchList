// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct MissionList: View
{
   @FetchRequest( entity: Mission.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Mission.name,
                                                       ascending: true ) ],
                  animation: .default )
   private var missions: FetchedResults< Mission >

   var body: some View
   {
      List( missions )
      {
         ( mission: Mission ) in

         NavigationLink( destination: MissionDetail( mission: mission ) )
         {
            MissionRow( mission: mission )
         }
      }
      .navigationBarTitle( "Missions", displayMode: .inline )
   }
}

struct MissionRow: View
{
   var mission: Mission

   var body: some View
   {
      if let name: String = mission.name
      {
         Text( name )
            .font( .headline )
      }
   }
}

#if DEBUG
struct MissionListPreviews: PreviewProvider
{
   static var previews: some View
   {
      MissionList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
   }
}
#endif
