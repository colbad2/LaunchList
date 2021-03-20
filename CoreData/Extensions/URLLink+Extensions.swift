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
   //
}

/**
 Add this data to Core Data as a `Link` entity. The context still needs to be saved after the add.

 - parameter json:    `URLLinkJSON` JSON to parse
 - parameter context: Core Data context to add the entity to.
 - returns: `URLLink` the added entity
 */
public func addToCoreData( json: URLLinkJSON, context: NSManagedObjectContext ) -> URLLink
{
   let newLink: URLLink = URLLink( context: context )
   updateEntity( json: json, entity: newLink, context: context )

   return newLink
}

/**
 Set or update the values of the `URLLink` entity,

 - parameter json:    `URLLinkJSON` JSON to parse
 - parameter entity:  `URLLink?` entity to fill/update
 - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
 */
public func updateEntity( json: URLLinkJSON, entity: URLLink?, context: NSManagedObjectContext )
{
   guard let linkEntity = entity else { return }

   linkEntity.url = json.url
   linkEntity.priority = json.priority
   linkEntity.title = json.title
   linkEntity.urlDescription = json.urlDescription
   linkEntity.featureImage = json.featureImage
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
   getEntityByID( entityID: entityID, context: context, entityName: URL_LINK_ENTITY_NAME ) as? URLLink
}

/**
 Fetches, updates, or creates a `Link` from the context, given the data.

 - parameter agency: JSON data about the link
 - parameter context: Core Data object context
 - returns: updated `URLLink`
 */
public func fetchURLLink( link: URLLinkJSON, context: NSManagedObjectContext ) -> URLLink
{
   let linkEntity: URLLink? = getURLLink( by: link.url ?? "", context: context )
   updateEntity( json: link, entity: linkEntity, context: context )
   return linkEntity ?? addToCoreData( json: link, context: context )
}
