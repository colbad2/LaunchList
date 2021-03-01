// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `Pad`. */
public let PAD_ENTITY_NAME: String = "Pad"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `Pad` entity.
 */
extension Pad
{
   /** Set< Launch > wrapper for the generated NSSet of `Launch`s. */
   var launchSet: Set< Launch > { self.launches as? Set< Launch > ?? Set< Launch >() }

   /** Array of `Launch`s, sorted by name. */
   var sortedLaunches: [Launch] { sortLaunchesByName( launchArray: Array( self.launchSet ) ) }

   /** True if the `Pad` has any `Launch`s. */
   var hasLaunches: Bool { return !launchSet.isEmpty }

   /**
    Adds the JSON struct, creating or updating as necessary.

    - parameter location: `LocationJSON?` JSON struct to add
    - parameter context:  `NSManagedObjectContext` context to add the JSON struct in
    */
   func addEntityFromJSON( location: LocationJSON?, context: NSManagedObjectContext )
   {
      guard let location = location else { return }
      self.location = fetchLocation( location: location, context: context )
      self.location?.addToPads( self )
   }
}

/**
 Add this data to Core Data as a `Pad` entity. The context still needs to be saved after the add.

 - parameter json:    JSON to parse
 - parameter context: Core Data context to add the entity to.
 - returns: `Pad` the added entity
 */
public func addToCoreData( json: PadJSON, context: NSManagedObjectContext ) -> Pad
{
   let newPad: Pad = Pad( context: context )
   updateEntity( json: json, entity: newPad, context: context )

   return newPad
}

/**
 Set or update the values of the `Pad` entity,

 - parameter json:    JSON to parse
 - parameter entity:  `Pad?` entity to fill/update
 - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
 */
public func updateEntity( json: PadJSON, entity: Pad?, context: NSManagedObjectContext )
{
   guard let padEntity = entity else { return }

   padEntity.agencyID = guaranteedInt64( json.agencyID )
   padEntity.id = json.id
   padEntity.infoURL = json.infoURL
   padEntity.latitude = json.latitude ?? ""
   padEntity.longitude = json.longitude ?? ""
   padEntity.addEntityFromJSON( location: json.location, context: context )
   padEntity.mapImage = json.mapImage

   if let mapURL: String = json.mapURL?.trim()
   {
      if !mapURL.isEmpty
      {
         padEntity.mapURL = mapURL.fixBadUTF()
      }
   }

   if let padName: String = json.name
   {
      var name: String = padName
      if !name.isEmpty && ( name.first?.isNumber ?? false )
      {
         name = "Pad " + name
      }
      padEntity.name = name
   }

   padEntity.totalLaunchCount = guaranteedInt64( json.totalLaunchCount )

   if let wikiURL: String = json.wikiURL?.trim()
   {
      if !wikiURL.isEmpty
      {
         padEntity.wikiURL = wikiURL
      }
   }

   padEntity.fetched = Date()
}

/**
 Gets all the `Pad` entities in the context

 - parameter context:  `NSManagedObjectContext` context to get the `Pad`s from
 - returns: `[Pad]?` list of pads, nil if not possible
 */
public func fetchAllPads( context: NSManagedObjectContext ) -> [Pad]?
{
   return fetchAllEntities( entityName: PAD_ENTITY_NAME, context: context ) as? [Pad]
}

/**
 Returns a sorted version of the given `Pad` array.

 - parameter padArray - list of `Pad`s to sort
 - returns: sorted version of the given `Pad` list
 */
public func sortPadsByName( padArray: [Pad]? ) -> [Pad]
{
   guard let padArray = padArray else { return [] }

   var pads: [Pad] = Array( padArray )
   pads.sort
   {
      pad1, pad2 in

      if let name1: String = pad1.name,
         let name2: String = pad2.name
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return pads
}

/**
 Gets a `Pad` with the given ID in the given context.

 ### Example
     let pad: Pad = getPad( by: 2345, context: context )

 - parameter entityID - `Int64` ID of the `Pad` to fetch
 - parameter context - `NSManagedObjectContext` context to get the `Pad` from
 - returns: `Pad?` pad with the given ID in the context, nil if not found
 */
public func getPad( by entityID: Int64, context: NSManagedObjectContext ) -> Pad?
{
   return getEntityByID( entityID: entityID, context: context, entityName: PAD_ENTITY_NAME ) as? Pad
}

/**
 Fetches, updates, or creates a `Pad` from the context, given the data.

 - parameter agency: JSON data about the pad
 - parameter context: Core Data object context
 - returns: updated `Pad`
 */
public func fetchPad( pad: PadJSON, context: NSManagedObjectContext ) -> Pad
{
   let padEntity: Pad? = getPad( by: pad.id, context: context )
   updateEntity( json: pad, entity: padEntity, context: context )
   return padEntity ?? addToCoreData( json: pad, context: context )
}

/**
 Returns the number of `Pad` records in the given context.

 - parameter context: Core Data object context
 - returns: `Int?` Number of `Pad` records in the context
 */
public func getPadCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: PAD_ENTITY_NAME, context: context )
}

/**
 Delete all `Pad` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllPadEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: PAD_ENTITY_NAME, context: context )
}
