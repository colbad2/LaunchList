// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable line_length

/**
 {
   "id": 100,
   "url": "https://ll.thespacedevs.com/2.1.0/docking_event/100/",
   "launch_id": "349eb56f-50e8-4858-9977-e4b7121c40f5",
   "docking": "2009-10-02T08:35:00Z",
   "departure": "2010-03-18T08:03:00Z",
   "flight_vehicle": { … },
   "docking_location": { … }
 }
 */
public struct DockingJSON: Decodable, Identifiable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, url, docking, departure, flightVehicle

      case launchID = "launchId"
   }

   public var id: Int64
   var url: String? // unused
   var launchID: String?
   var docking: String?
   var dockingLocationName: String?
   var departure: String?
   var flightVehicle: FlightVehicleJSON?
   var dockingLocation: DockingLocationJSON?

   func addToCoreData( context: NSManagedObjectContext ) -> Docking
   {
      let newDocking: Docking = Docking( context: context )
      updateEntity( entity: newDocking, context: context )

      return newDocking
   }

   func updateEntity( entity: Docking?, context: NSManagedObjectContext )
   {
      guard let entity = entity else { return }

      entity.id = self.id
      entity.launchID = self.launchID
      entity.docking = self.docking
      entity.departure = self.departure

      if let flightVehicle: FlightVehicleJSON = self.flightVehicle
      {
         let flightVehicleEntity: FlightVehicle = fetchFlightVehicle( flightVehicle: flightVehicle, context: context )
         entity.flightVehicle = flightVehicleEntity
         flightVehicleEntity.addToDockings( entity )
      }

      entity.dockingLocationName = self.dockingLocation?.name

      // TimelineEntry
      entity.sortingDate = parseISODate( isoDate: self.docking )
   }
}

/**
 {
   "id": 2,
   "name": "Zvezda aft"
 }
 */
public struct DockingLocationJSON: Decodable, Identifiable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, name
   }

   public var id: Int64
   var name: String?
}

// Core Data search/update

func getDocking( by entityID: Int64, context: NSManagedObjectContext ) -> Docking?
{
   return getEntityByID( entityID: entityID, context: context, entityName: "Docking" ) as? Docking
}

func fetchDocking( docking: DockingJSON, context: NSManagedObjectContext ) -> Docking
{
   let dockingEntity: Docking? = getDocking( by: docking.id, context: context )
   docking.updateEntity( entity: dockingEntity, context: context )
   return dockingEntity ?? docking.addToCoreData( context: context )
}

func getDockingCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "Docking", context: context )
}

func getSampleDocking() -> DockingJSON?
{
   return parseJSONString( json: sampleDockingJSON )
}

private let sampleDockingJSON =
"""
 {
   "id": 100,
   "url": "https://ll.thespacedevs.com/2.1.0/docking_event/100/",
   "launch_id": "349eb56f-50e8-4858-9977-e4b7121c40f5",
   "docking": "2009-10-02T08:35:00Z",
   "departure": "2010-03-18T08:03:00Z",
   "flight_vehicle": {
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
   },
   "docking_location": {
     "id": 2,
     "name": "Zvezda aft"
   }
 }
"""
