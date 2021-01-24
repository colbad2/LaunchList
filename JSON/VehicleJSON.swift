// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable line_length

/**
 ### Example JSON
       {
         "id": 75,
         "url": "https://ll.thespacedevs.com/2.1.0/launcher/75/",
         "flight_proven": false,
         "serial_number": "Mk1",
         "status": "destroyed",
         "details": "Starship Mk1 was partially destroyed during max pressure tank testing, when the forward LOX tank ruptured along a weld line of the craft's steel structure, propelling the bulkhead several meters upwards.",
         "launcher_config": {
           "id": 207,
           "launch_library_id": null,
           "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/207/",
           "name": "Starship Prototype",
           "family": "Starship",
           "full_name": "Starship Prototype",
           "variant": "Prototype"
         },
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_core_images/75_image_20200821075135.jpeg",
         "flights": 0,
         "last_launch_date": null,
         "first_launch_date": null
       }
 */
public struct VehicleJSON: Decodable, Identifiable, JSONElement
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, flightProven, serialNumber, status, details, launcherConfig, imageURL, flights, lastLaunchDate, firstLaunchDate
   }

   public let id: Int64
   let url: String? // unused
   let flightProven: Bool?
   let serialNumber: String?
   let status: String?
   let details: String?
   let launcherConfig: RocketJSON?
   let imageURL: String?
   let flights: Int64
   let lastLaunchDate: String?
   let firstLaunchDate: String?

   public func addToCoreData( context: NSManagedObjectContext ) -> Vehicle
   {
      let newVehicle: Vehicle = Vehicle( context: context )
      updateEntity( entity: newVehicle, context: context )

      return newVehicle
   }

   public func updateEntity( entity: Vehicle?, context: NSManagedObjectContext )
   {
      guard let vehicleEntity = entity else { return }

      vehicleEntity.id = id
      vehicleEntity.flightProven = flightProven ?? false
      vehicleEntity.serialNumber = serialNumber
      vehicleEntity.status = status
      vehicleEntity.details = details
      vehicleEntity.addRocketFromJSON( launcher: launcherConfig, context: context )
      vehicleEntity.imageURL = imageURL
      vehicleEntity.flights = flights
      vehicleEntity.lastLaunchDate = lastLaunchDate
      vehicleEntity.firstLaunchDate = firstLaunchDate

      vehicleEntity.fetched = Date()
   }
}
