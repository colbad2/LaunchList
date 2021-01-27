// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct SettingsView: View
{
   @State var isPreloading: Bool = false
   @State var isUpdating: Bool = false

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

               HStack
               {
                  Button( "Update Agencies" )
                  {
                     isUpdating = true
                     DispatchQueue.main.async
                     {
                        updateAgencies( PersistenceController.shared.container.viewContext )
                        saveContext( PersistenceController.shared.container.viewContext )
                        isUpdating = false
                     }
                  }

                  if isUpdating
                  {
                     Spacer()
                     ProgressView()
                  }
               }

               HStack
               {
                  Button( "Prefetch all images" )
                  {
                     isPreloading = true
                     DispatchQueue.main.async
                     {
                        imageLoader( PersistenceController.shared.container.viewContext )
                        saveContext( PersistenceController.shared.container.viewContext )
                        isPreloading = false
                     }
                  }

                  if isPreloading
                  {
                     Spacer()
                     ProgressView()
                  }
               }
            }
            Section( header: Text( "JSON" ) )
            {
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
      // .navigationTitleDisplayMode( .inline )
      .toolbar
      {
         ToolbarItem( placement: .navigationBarLeading )
         {
            Text( "Settings" ).font( .title ).bold()
         }
      }
   }
}

func updateAgencies( _ context: NSManagedObjectContext )
{
   let agencies: [Agency] = fetchAllAgencies( context: context ) ?? []
   for agency in agencies
   {
      agency.websiteURL = AgencyData.shared.getWebsite( agency )
      agency.wikiURL = AgencyData.shared.getWiki( agency )
      agency.twitterURL = AgencyData.shared.getTwitter( agency )
      agency.logoName = AgencyData.shared.getLogo( agency )
      agency.youTubeURL = AgencyData.shared.getYouTube( agency )
      // only replace if there is a hole
      agency.agencyDescription = agency.agencyDescription ?? AgencyData.shared.getDescription( agency )
   }
}

/**
 Prefetches every image URL in the database and stores it in Core Data.

 Used to populate the Core Data files so it can be used as a default store in the app.

 - parameter context: `NSManagedObjectContext` where to store the images
 */
func imageLoader( _ context: NSManagedObjectContext )
{
   for agency in fetchAllAgencies( context: context ) ?? []
   {
      RemoteImageCache.shared.downloadImage( with: agency.imageURL ) { _, _, _ in }
   }
   for astronaut in fetchAllAstronauts( context: context ) ?? []
   {
      RemoteImageCache.shared.downloadImage( with: astronaut.profileImage ) { _, _, _ in }
      RemoteImageCache.shared.downloadImage( with: astronaut.profileImageThumbnail ) { _, _, _ in }
   }
   for event in fetchAllEvents( context: context ) ?? []
   {
      RemoteImageCache.shared.downloadImage( with: event.featureImage ) { _, _, _ in }
   }
   for launch in fetchAllLaunches( context: context ) ?? []
   {
      RemoteImageCache.shared.downloadImage( with: launch.image ) { _, _, _ in }
      RemoteImageCache.shared.downloadImage( with: launch.infographic ) { _, _, _ in }
   }
   for launcher in fetchAllLaunchers( context: context ) ?? []
   {
      RemoteImageCache.shared.downloadImage( with: launcher.imageURL ) { _, _, _ in }
   }
   for liveStream in fetchAllLiveStreams( context: context ) ?? []
   {
      RemoteImageCache.shared.downloadImage( with: liveStream.image ) { _, _, _ in }
   }
   for location in fetchAllLocations( context: context ) ?? []
   {
      RemoteImageCache.shared.downloadImage( with: location.mapImage ) { _, _, _ in }
   }
   for pad in fetchAllPads( context: context ) ?? []
   {
      RemoteImageCache.shared.downloadImage( with: pad.mapImage ) { _, _, _ in }
   }
   for program in fetchAllPrograms( context: context ) ?? []
   {
      RemoteImageCache.shared.downloadImage( with: program.imageURL ) { _, _, _ in }
   }
   for spacecraftConfig in fetchAllSpacecraftConfigs( context: context ) ?? []
   {
      RemoteImageCache.shared.downloadImage( with: spacecraftConfig.imageURL ) { _, _, _ in }
   }
   for spaceStation in fetchAllSpaceStations( context: context ) ?? []
   {
      RemoteImageCache.shared.downloadImage( with: spaceStation.imageURL ) { _, _, _ in }
   }
   for vehicle in fetchAllVehicles( context: context ) ?? []
   {
      RemoteImageCache.shared.downloadImage( with: vehicle.imageURL ) { _, _, _ in }
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
