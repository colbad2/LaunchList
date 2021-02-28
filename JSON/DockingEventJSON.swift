// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 ### Example JSON

 ### Spec
       id               integer readOnly: true
       url              string($uri) readOnly: true
       launch_id*       string minLength: 1
       docking*         string($date-time)
       departure        string($date-time) x-nullable: true
       flight_vehicle   SpacecraftFlightSerializerForDockingEvent{...}
       docking_location DockingLocation{...}
       space_station    SpaceStation{}
 */
public class DockingEventJSON: Decodable, Identifiable, JSONElement
{
   public let id: Int64
   let url: String?
   let launchID: String?
   let docking: String?
   let departure: String?
   let flightVehicle: SpacecraftFlightJSON?
   let dockingLocation: IDNameJSON?
   var spacestation: SpaceStationJSON?

   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.launchID = json[ "launch_id" ] as? String
      self.docking = json[ "docking" ] as? String
      self.departure = json[ "departure" ] as? String
      self.flightVehicle = SpacecraftFlightJSON( json: json[ "flight_vehicle" ] as? JSONStructure )
      self.dockingLocation = IDNameJSON( json: json[ "docking_location" ] as? JSONStructure )
      self.spacestation = SpaceStationJSON( json: json[ "docking_location" ] as? JSONStructure )
   }

   /**
    Add this data to Core Data as a `DockingEvent` entity. The context still needs to be saved after the add.

    - parameter context: Core Data context to add the entity to.
    - returns:           the added entity
    */
   public func addToCoreData( context: NSManagedObjectContext ) -> DockingEvent
   {
      let newDockingEvent: DockingEvent = DockingEvent( context: context )
      updateEntity( entity: newDockingEvent, context: context )

      return newDockingEvent
   }

   /**
    Set or update the values of the `DockingEvent` entity,

    - parameter entity: `DockingEvent?` entity to fill/update
    - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
    */
   public func updateEntity( entity: DockingEvent?, context: NSManagedObjectContext )
   {
      guard let dockingEventEntity = entity else { return }

      dockingEventEntity.id = id
      dockingEventEntity.url = url
      dockingEventEntity.launch = getLaunch( by: launchID, context: context )
      dockingEventEntity.docking = docking
      dockingEventEntity.departure = departure
      if let flight: SpacecraftFlightJSON = self.flightVehicle
      {
         dockingEventEntity.flightVehicle = fetchSpacecraftFlight( flight: flight, context: context )
      }
      dockingEventEntity.dockingLocation = self.dockingLocation?.name
      if let spacestation: SpaceStationJSON = self.spacestation
      {
         dockingEventEntity.spacestation = fetchSpaceStation( spaceStation: spacestation, context: context )
      }

      dockingEventEntity.fetched = Date()
   }
}
