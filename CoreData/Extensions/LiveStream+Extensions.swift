// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `LiveStream`. */
public let LIVE_STREAM_ENTITY_NAME: String = "LiveStream"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `LiveStream` entity.
 */
extension LiveStream
{
   // no sets
}

/**
 Gets a `LiveStream` with the given ID in the given context.

 ### Example
     let liveStream: LiveStream = getLiveStream( by: 2345, context: context )

 - parameter entityID - `Int64` ID of the `LiveStream` to fetch
 - parameter context - `NSManagedObjectContext` context to get the `LiveStream` from
 - returns: `LiveStream?` live stream with the given ID in the context, nil if not found
 */
public func getLiveStream( by entityID: String, context: NSManagedObjectContext ) -> LiveStream?
{
   return getEntityByID( entityID: entityID, context: context, entityName: LIVE_STREAM_ENTITY_NAME ) as? LiveStream
}

/**
 Fetches, updates, or creates a `LiveStream` from the context, given the data

 - parameter liveStream: `LiveStreamJSON` JSON data about the live stream
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: updated `LiveStream`
 */
public func fetchLiveStream( liveStream: LiveStreamJSON, context: NSManagedObjectContext ) -> LiveStream
{
   let liveStreamEntity: LiveStream? = getLiveStream( by: liveStream.url, context: context )
   liveStream.updateEntity( entity: liveStreamEntity, context: context )
   return liveStreamEntity ?? liveStream.addToCoreData( context: context )
}

/**
 Returns the number of `LiveStream` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `LiveStream` records in the context
 */
public func getLiveStreamCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: LIVE_STREAM_ENTITY_NAME, context: context )
}

/**
 Delete all `LiveStream` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllLiveStreamEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: LIVE_STREAM_ENTITY_NAME, context: context )
}

/**
 Gets the `LiveStream` with the given URL.

 - parameter liveStreamURL: `String` URL of the `LiveStream` to fetch
 - parameter context: `NSManagedObjectContext` Core Data context to fetch the entity from
 - returns: first `LiveStream` with the given URL, nil otherwise
 */
func getLiveStreamByURL( liveStreamURL: String, context: NSManagedObjectContext ) -> LiveStream?
{
   do
   {
      let request: NSFetchRequest<NSFetchRequestResult> = LiveStream.fetchRequest()
      request.predicate = NSPredicate( format: "url == %@", liveStreamURL )
      let entities: [Any] = try context.fetch( request )
      if !entities.isEmpty
      {
         if let liveStream: LiveStream = entities.first as? LiveStream
         {
            return liveStream
         }
      }
   }
   catch
   {
      let nsError: NSError = error as NSError
      fatalError( "Failed to fetch LiveStream with URL \(liveStreamURL): \(error), \(nsError.userInfo)" )
   }

   return nil
}
