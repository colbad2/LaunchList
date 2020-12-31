import Foundation
import SwiftUI
import CoreData

struct DatasetList: View
{
   var body: some View
   {
      let context = PersistenceController.shared.container.viewContext

      NavigationView
      {
         List
         {
            NavigationLink( destination: LaunchList() )
            {
               DatasetListItem( title: "Launches", entity: "Launch", context: context )
            }

            NavigationLink( destination: AgencyList() )
            {
               DatasetListItem( title: "Agencies", entity: "Agency", context: context )
            }

            NavigationLink( destination: ServiceProviderList() )
            {
               DatasetListItem( title: "Service Providers", entity: "ServiceProvider", context: context )
            }

            NavigationLink( destination: PadList() )
            {
               DatasetListItem( title: "Pads", entity: "Pad", context: context )
            }

            NavigationLink( destination: MissionList() )
            {
               DatasetListItem( title: "Missions", entity: "Mission", context: context )
            }

            NavigationLink( destination: ProgramList() )
            {
               DatasetListItem( title: "Programs", entity: "Program", context: context )
            }

            NavigationLink( destination: RocketList() )
            {
               DatasetListItem( title: "Rockets", entity: "Rocket", context: context )
            }

            NavigationLink( destination: AstronautList() )
            {
               DatasetListItem( title: "Astronauts", entity: "Astronaut", context: context )
            }
         }
      }
   }
}

struct DatasetListItem: View
{
   var title: String
   var entity: String
   var context: NSManagedObjectContext

   var body: some View
   {
      VStack( alignment: .leading )
      {
         Text( title )
            .font( .title2 )
            .foregroundColor( .primary )

         let launchCount = getRecordsCount( entityName: entity, context: context )!
         Text( "\(launchCount) \(title.lowercased())" )
            .font( .subheadline )
            .foregroundColor( .secondary )
      }
   }
}
