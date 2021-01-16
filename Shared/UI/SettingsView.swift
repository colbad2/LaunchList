// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct SettingsView: View
{
   var body: some View
   {
      NavigationView
      {
         Form
         {
            Section( header: Text( "API" ) )
            {
               Text( "Settings" )
            }
            Section( header: Text( "Core Data" ) )
            {
               Text( "Stats" )
               Text( "Image loading" )
            }
            Section( header: Text( "JSON" ) )
            {
               // TODO this crashes the app after the load completes
               Group // only to get past the ten limit
               {
                  LoadJSONButton( filename: "agencies.json", loader: loadAgencies )
                  LoadJSONButton( filename: "launches.json", loader: loadLaunches )
                  LoadJSONButton( filename: "pads.json", loader: loadPads )
                  LoadJSONButton( filename: "astronauts.json", loader: loadAstronauts )
                  LoadJSONButton( filename: "starshipTests.json", loader: loadStarshipTests )
               }
               Group
               {
                  LoadJSONButton( filename: "docking.json", loader: loadDockings )
                  LoadJSONButton( filename: "events.json", loader: loadEvents )
                  LoadJSONButton( filename: "expeditions.json", loader: loadExpeditions )
                  LoadJSONButton( filename: "launchers.json", loader: loadLaunchers )
                  LoadJSONButton( filename: "locations.json", loader: loadLocations )
                  LoadJSONButton( filename: "programs.json", loader: loadPrograms )
               }
            }
         }
      }
      .navigationBarTitleDisplayMode( .inline )
      .toolbar
      {
         ToolbarItem( placement: .navigationBarLeading )
         {
            Text( "Settings" ).font( .title ).bold()
         }
      }
   }
}

struct LoadJSONButton: View
{
   var filename: String
   var loader: ( NSManagedObjectContext ) -> Void
   @State var isLoading: Bool = false

   var body: some View
   {
      HStack
      {
         Button( "Load \(filename)" )
         {
            self.isLoading = true
               DispatchQueue.main.async
               {
                  loader( PersistenceController.shared.container.viewContext )
                  saveContext( PersistenceController.shared.container.viewContext )
                  self.isLoading = false
               }
         }

         if self.isLoading
         {
            Spacer()
            ProgressView()
         }
      }
   }
}
