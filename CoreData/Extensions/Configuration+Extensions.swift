// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `Configuration`. */
public let CONFIGURATION_ENTITY_NAME: String = "Configuration"
// swiftlint:enable identifier_name

extension Configuration
{
   //
}

/**
 Gets an `Configuration` with the given ID in the given context.

 ### Example
     let configuration: Configuration = getConfiguration( by: 2345, context: context )

 - parameter entityID: `Int64` ID of the `Configuration` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `Configuration` from
 - returns: `Configuration?` configuration with the given ID in the context, nil if not found
 */
public func getConfiguration( by entityID: Int64, context: NSManagedObjectContext ) -> Configuration?
{
   return getEntityByID( entityID: entityID, context: context, entityName: CONFIGURATION_ENTITY_NAME ) as? Configuration
}

/**
 Fetches, updates, or creates a `Configuration` from the context, given the data.

 - parameter configuration: `ConfigurationJSON` JSON data about the rocket
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Configuration?` updated entity
 */
public func fetchConfiguration( configuration: ConfigurationJSON, context: NSManagedObjectContext ) -> Configuration
{
   let configurationEntity: Configuration? = getConfiguration( by: configuration.id, context: context )
   configuration.updateEntity( entity: configurationEntity, context: context )
   return configurationEntity ?? configuration.addToCoreData( context: context )
}

/*
 extension Configuration {

 @nonobjc public class func fetchRequest() -> NSFetchRequest<Configuration> {
 return NSFetchRequest<Configuration>(entityName: "Configuration")
 }

 @NSManaged public var family: String?
 @NSManaged public var fullName: String?
 @NSManaged public var id: Int64
 @NSManaged public var name: String?
 @NSManaged public var url: String?
 @NSManaged public var variant: String?
 @NSManaged public var agencies: NSSet?
 @NSManaged public var rockets: NSSet?

 }

 // MARK: Generated accessors for agencies
 extension Configuration {

 @objc(addAgenciesObject:)
 @NSManaged public func addToAgencies(_ value: Agency)

 @objc(removeAgenciesObject:)
 @NSManaged public func removeFromAgencies(_ value: Agency)

 @objc(addAgencies:)
 @NSManaged public func addToAgencies(_ values: NSSet)

 @objc(removeAgencies:)
 @NSManaged public func removeFromAgencies(_ values: NSSet)

 }

 // MARK: Generated accessors for rockets
 extension Configuration {

 @objc(addRocketsObject:)
 @NSManaged public func addToRockets(_ value: Rocket)

 @objc(removeRocketsObject:)
 @NSManaged public func removeFromRockets(_ value: Rocket)

 @objc(addRockets:)
 @NSManaged public func addToRockets(_ values: NSSet)

 @objc(removeRockets:)
 @NSManaged public func removeFromRockets(_ values: NSSet)

 }
 */
