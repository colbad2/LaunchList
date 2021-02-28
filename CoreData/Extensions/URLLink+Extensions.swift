// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `URLLink`. */
public let URL_LINK_ENTITY_NAME: String = "URLLink"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `URLLink` entity.
 */
extension URLLink
{
}

/**
 Gets a `URLLink` with the given ID in the given context.

 ### Example
 let link: URLLink = getURLLink( by: 2345, context: context )

 - parameter entityID - `String` ID of the `URLLink` to fetch
 - parameter context - `NSManagedObjectContext` context to get the `Link` from
 - returns: `URLLink?` link with the given ID in the context, nil if not found
 */
public func getURLLink( by entityID: String, context: NSManagedObjectContext ) -> URLLink?
{
   return getEntityByID( entityID: entityID, context: context, entityName: URL_LINK_ENTITY_NAME ) as? URLLink
}

/**
 Fetches, updates, or creates a `Link` from the context, given the data.

 - parameter agency: JSON data about the link
 - parameter context: Core Data object context
 - returns: updated `URLLink`
 */
public func fetchURLLink( link: LinkJSON, context: NSManagedObjectContext ) -> URLLink
{
   let linkEntity: URLLink? = getURLLink( by: link.url, context: context )
   link.updateEntity( entity: linkEntity, context: context )
   return linkEntity ?? link.addToCoreData( context: context )
}
