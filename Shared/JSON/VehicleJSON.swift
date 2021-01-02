import Foundation
import CoreData

/**
 ### Example
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
struct VehicleJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, flightProven, serialNumber, status, details, launcherConfig, imageURL, flights, lastLaunchDate, firstLaunchDate
   }

   let id: Int64
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

   func addToCoreData( context: NSManagedObjectContext ) -> Vehicle
   {
      let newVehicle: Vehicle = Vehicle( context: context )
      updateEntity( entity: newVehicle, context: context )

      return newVehicle
   }

   func updateEntity( entity: Vehicle?, context: NSManagedObjectContext ) -> Void
   {
      guard let entity = entity else { return }

      entity.id = self.id
      entity.flightProven = self.flightProven ?? false
      entity.serialNumber = self.serialNumber
      entity.status = self.status
      entity.details = self.details

      if let launcher = self.launcherConfig
      {
         entity.launcher = fetchRocket( rocket: launcher, context: context )
         entity.launcher?.addToVehicles( entity )
      }

      entity.imageURL = self.imageURL
      entity.flights = self.flights
      entity.lastLaunchDate = self.lastLaunchDate
      entity.firstLaunchDate = self.firstLaunchDate
   }
}


// Core Data search/update

func getVehicle( by id: Int64, context: NSManagedObjectContext ) -> Vehicle?
{
   return getEntityByID( id: id, context: context, entityName: "Vehicle" ) as? Vehicle
}

func fetchVehicle( vehicle: VehicleJSON, context: NSManagedObjectContext ) -> Vehicle
{
   let vehicleEntity = getVehicle( by: vehicle.id, context: context )
   vehicle.updateEntity( entity: vehicleEntity, context: context )
   return vehicleEntity ?? vehicle.addToCoreData( context: context )
}

func getVehicleCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Vehicle", context: context )
}

func getVehicleLaunch() -> VehicleJSON
{
   let decoder = JSONDecoder()
   decoder.keyDecodingStrategy = .convertFromSnakeCase
   let jsonData = sampleVehicleJSON.data( using: .utf8 )!
   return try! decoder.decode( VehicleJSON.self, from: jsonData )
}

let sampleVehicleJSON =
"""
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
"""
