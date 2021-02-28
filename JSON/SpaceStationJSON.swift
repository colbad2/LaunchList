// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 ### Example JSON
       {
         "id": 14,
         "url": "https://ll.thespacedevs.com/2.1.0/spacestation/14/",
         "name": "Salyut 6",
         "status": {
           "id": 2,
           "name": "De-Orbited"
         },
         "orbit": "Low Earth Orbit",
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/spacestation_images/salyut25206_image_20190318095930.jpg"
       }

 ### Spec
       id                integer
       url               string($uri)
       name*             string maxLength: 255 minLength: 1
       image_url         string($uri) x-nullable: true
       status            IDNameJSON{...}
       orbit             string
       founded*          string($date)
       description*      string maxLength: 2048 minLength: 1
       owners            [AgencyList]
       type              IDNameJSON
       deorbited         string($date) x-nullable: true
       active_expedition [Expedition]
 */
public class SpaceStationJSON: Decodable, Identifiable, JSONElement
{
   /** ID of the rocket within the API. */
   public let id: Int64
   /** URI for this data in the API. Unused. */
   let url: String?
   /** Station name. */
   let name: String?
   /** Station status. */
   var status: StatusJSON?
   /** Station orbit. */
   let orbit: String?
   /** Image URL for the station. */
   let imageURL: String?
   var founded: String?
   var spaceStationDescription: String?
   var owners: [AgencyJSON] = []
   var type: String?
   var deorbited: String? // Date
   var activeExpeditions: [ExpeditionJSON] = []

   /**
    Make a `SpaceStationJSON` from a JSON structure.

    - parameter json: `JSONStructure?` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.name = json[ "name" ] as? String
      self.status = StatusJSON( json: json[ "status" ] as? JSONStructure )
      self.orbit = json[ "orbit" ] as? String
      self.imageURL = json[ "image_url" ] as? String
      self.founded = json[ "founded" ] as? String
      self.spaceStationDescription = json[ "description" ] as? String
      self.owners = ( json[ "owners" ] as? [JSONStructure] ?? [] ).compactMap { return AgencyJSON( json: $0 ) }
      self.type = IDNameJSON( json: json[ "type" ] as? JSONStructure )?.name
      self.deorbited = json[ "deorbited" ] as? String
      self.activeExpeditions = ( json[ "active_expedition" ] as? [JSONStructure] ?? [] ).compactMap { return ExpeditionJSON( json: $0 ) }
   }

   /**
    Add this data to Core Data as a `SpaceStation` entity. The context still needs to be saved after the add.

    - parameter context: Core Data context to add the entity to.
    - returns: the added entity
    */
   public func addToCoreData( context: NSManagedObjectContext ) -> SpaceStation
   {
      let newSpaceStation: SpaceStation = SpaceStation( context: context )
      updateEntity( entity: newSpaceStation, context: context )

      return newSpaceStation
   }

   /**
    Set or update the values of the `SpaceStation` entity,

    - parameter entity: `SpaceStation?` entity to fill/update
    - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
    */
   public func updateEntity( entity: SpaceStation?, context: NSManagedObjectContext )
   {
      guard let spaceStationEntity = entity else { return }

      spaceStationEntity.id = id
      spaceStationEntity.name = name
      spaceStationEntity.status = status?.name
      spaceStationEntity.statusName = status?.name
      spaceStationEntity.statusAbbreviation = status?.abbreviation
      spaceStationEntity.statusDescription = status?.description
      spaceStationEntity.orbit = orbit
      spaceStationEntity.imageURL = imageURL
      spaceStationEntity.founded = founded
      spaceStationEntity.spaceStationDescription = spaceStationDescription
      spaceStationEntity.addOwnersFromJSON( owners: self.owners, context: context )
      spaceStationEntity.type = type
      spaceStationEntity.deorbited = deorbited
      spaceStationEntity.addExpeditionsFromJSON( expeditions: self.activeExpeditions, context: context )

      spaceStationEntity.fetched = Date()
   }
}
