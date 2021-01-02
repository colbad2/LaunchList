// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 {
   "id": 220,
   "url": "https://ll.thespacedevs.com/2.1.0/spacecraft/flight/220/",
   "destination": "International Space Station",
   "mission_end": "2010-03-18T11:24:00Z",
   "spacecraft": { … }
 }
 */
public struct FlightVehicleJSON: Decodable, Identifiable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, destination, missionEnd, spacecraft
   }

   public var id: Int64
   var url: String?
   var destination: String?
   var missionEnd: String?
   var spacecraft: SpacecraftJSON?

   func addToCoreData( context: NSManagedObjectContext ) -> FlightVehicle
   {
      let newFlightVehicle: FlightVehicle = FlightVehicle( context: context )
      updateEntity( entity: newFlightVehicle, context: context )

      return newFlightVehicle
   }

   func updateEntity( entity: FlightVehicle?, context: NSManagedObjectContext )
   {
      guard let entity = entity else { return }

      entity.id = self.id
      entity.url = self.url
      entity.destination = self.destination
      entity.missionEnd = self.missionEnd

      if let spacecraft = self.spacecraft
      {
         let spacecraftEntity: Spacecraft = fetchSpacecraft( spacecraft: spacecraft, context: context )
         entity.spacecraft = spacecraftEntity
         spacecraftEntity.flightVehicle = entity
      }
   }
}



// Core Data search/update

func getFlightVehicle( by id: Int64, context: NSManagedObjectContext ) -> FlightVehicle?
{
   return getEntityByID( id: id, context: context, entityName: "FlightVehicle" ) as? FlightVehicle
}

func fetchFlightVehicle( flightVehicle: FlightVehicleJSON, context: NSManagedObjectContext ) -> FlightVehicle
{
   let flightVehicleEntity = getFlightVehicle( by: flightVehicle.id, context: context )
   flightVehicle.updateEntity( entity: flightVehicleEntity, context: context )
   return flightVehicleEntity ?? flightVehicle.addToCoreData( context: context )
}

func getFlightVehicleCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "FlightVehicle", context: context )
}

func getSampleFlightVehicle() -> FlightVehicleJSON
{
   let decoder = JSONDecoder()
   decoder.keyDecodingStrategy = .convertFromSnakeCase
   let jsonData = sampleFlightVehicleJSON.data( using: .utf8 )!
   return try! decoder.decode( FlightVehicleJSON.self, from: jsonData )
}


let sampleFlightVehicleJSON =
"""
      {
        "id": 220,
        "url": "https://ll.thespacedevs.com/2.1.0/spacecraft/flight/220/",
        "destination": "International Space Station",
        "mission_end": "2010-03-18T11:24:00Z",
        "spacecraft": {
          "id": 77,
          "url": "https://ll.thespacedevs.com/2.1.0/spacecraft/77/",
          "name": "Soyuz TMA-16",
          "serial_number": "Soyuz TMA 11F732A17 #226",
          "status": {
            "id": 4,
            "name": "Single Use"
          },
          "description": "Soyuz TMA-16 was a Soyuz spacecraft which launched on September 30 2009 07:14 UTC. It transported two members of the Expedition 21 crew and one participant to the International Space Station. The Expedition 21 crew consisted of Maksim Surayev and Jeffrey Williams. The spaceflight participant was tourist Guy Laliberté.",
          "spacecraft_config": {
            "id": 1,
            "url": "https://ll.thespacedevs.com/2.1.0/config/spacecraft/1/",
            "name": "Soyuz",
            "type": {
              "id": 1,
              "name": "Unknown"
            },
            "agency": {
              "id": 63,
              "url": "https://ll.thespacedevs.com/2.1.0/agencies/63/",
              "name": "Russian Federal Space Agency (ROSCOSMOS)",
              "type": "Government"
            },
            "in_use": true,
            "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/soyuz_image_20201015191152.jpg"
          }
        }
      }
"""
