// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

extension LiveStream
{
   // no sets
}

public func getLiveStream( by entityID: String, context: NSManagedObjectContext ) -> LiveStream?
{
   return getEntityByID( entityID: entityID, context: context, entityName: "LiveStream" ) as? LiveStream
}

public func fetchLiveStream( liveStream: LiveStreamJSON, context: NSManagedObjectContext ) -> LiveStream
{
   let liveStreamEntity: LiveStream? = getLiveStream( by: liveStream.url, context: context )
   liveStream.updateEntity( entity: liveStreamEntity, context: context )
   return liveStreamEntity ?? liveStream.addToCoreData( context: context )
}

/**
 Returns the number of [LiveStream] records in the given context.

 - parameter context: Core Data object context
 - returns: [Int?] Number of [LiveStream] records in the context
 */
public func getLiveStreamCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "LiveStream", context: context )
}
