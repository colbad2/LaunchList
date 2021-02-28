// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Returned by the 'config/landinglocation' endpoint.

 #### Spec
       id   integer readOnly: true
       name   string maxLength: 255
       abbrev   string maxLength: 255
       description   string maxLength: 2048 x-nullable: true
       location*   Location{...}
       successful_landings   string readOnly: true
 */
public class LandingLocationJSON: Decodable, Identifiable, JSONElement
{
   /** ID of the location within the API. */
   public var id: Int64
   /** Location name. */
   var name: String?
   /** Location abbreviation. */
   var abbreviation: String?
   /** Location data. */
   var location: LocationJSON?
   /** Landing count. */
   var successfulLandings: String?

   /**
    Make a `LandingLocationJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.name = json[ "name" ] as? String
      self.abbreviation = json[ "abbreviation" ] as? String
      self.location = LocationJSON( json: json[ "location" ] as? JSONStructure )
      self.successfulLandings = json[ "successful_landings" ] as? String
   }

   /**
    Add this location to Core Data as a `LandingLocation` entity. The context still needs to be saved after the add.

    - parameter context: `NSManagedObjectContext` Core Data context to add the entity to.
    - returns:           `LandingLocation` the added entity
    */
   public func addToCoreData( context: NSManagedObjectContext ) -> LandingLocation
   {
      let newLandingLocation: LandingLocation = LandingLocation( context: context )
      updateEntity( entity: newLandingLocation, context: context )

      return newLandingLocation
   }

   /**
    Set or update the values of the `LandingLocation` entity,

    - parameter entity:  `LandingLocation?` entity to fill/update
    - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
    */
   public func updateEntity( entity: LandingLocation?, context: NSManagedObjectContext )
   {
      guard let landingLocationEntity = entity else { return }

      landingLocationEntity.id = id
      landingLocationEntity.name = name
      landingLocationEntity.abbreviation = abbreviation
      landingLocationEntity.addLocationFromJSON( location: location, context: context )
      landingLocationEntity.successfulLandings = successfulLandings

      landingLocationEntity.fetched = Date()
   }
}
