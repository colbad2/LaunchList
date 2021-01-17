// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable identifier_name
/** Core Data entity name for `ServiceProvider`. */
public let SERVICE_PROVIDER_ENTITY_NAME: String = "ServiceProvider"
// swiftlint:enable identifier_name

/**
 Extensions to the Core Data generated `ServiceProvider` entity.
 */
extension ServiceProvider
{
   /** Set< Launch > wrapper for the generated NSSet of `Launch`s. */
   var launchesSet: Set< Launch > { self.launches as? Set< Launch > ?? Set< Launch >() }

   /** Array of `Launch`s, sorted by name. */
   var sortedLaunches: [Launch] { sortLaunchesByName( launchArray: Array( self.launchesSet ) ) }

   /** True if the `ServiceProvider` has any `Launch`s. */
   var hasLaunches: Bool { !launchesSet.isEmpty }
}

/**
 Returns a sorted version of the given `ServiceProvider` array.

 - parameter serviceProviderArray: `[ServiceProvider]?` list of `ServiceProvider`s to sort
 - returns: `[ServiceProvider]` sorted version of the given `ServiceProvider` list, never nil
 */
func sortServiceProvidersByName( serviceProviderArray: [ServiceProvider]? ) -> [ServiceProvider]
{
   guard let serviceProviderArray = serviceProviderArray else { return [] }

   var serviceProviders: [ServiceProvider] = Array( serviceProviderArray )
   serviceProviders.sort
   {
      serviceProvider1, serviceProvider2 in

      if let name1: String = serviceProvider1.name,
         let name2: String = serviceProvider2.name
      {
         return name1 < name2
      }
      else
      {
         return false
      }
   }

   return serviceProviders
}

/**
 Gets a `ServiceProvider` with the given ID in the given context.

 ### Example
     let provider: ServiceProvider = getServiceProvider( by: 2345, context: context )

 - parameter entityID: `Int64` ID of the `ServiceProvider` to fetch
 - parameter context: `NSManagedObjectContext` context to get the `ServiceProvider` from
 - returns: `ServiceProvider` with the given ID in the context, nil if not found
 */
public func getProvider( by entityID: Int64, context: NSManagedObjectContext ) -> ServiceProvider?
{
   return getEntityByID( entityID: entityID, context: context, entityName: SERVICE_PROVIDER_ENTITY_NAME ) as? ServiceProvider
}

/**
 Fetches, updates, or creates a `ServiceProvider` from the context, given the data.

 - parameter provider: `ServiceProviderJSON` JSON data about the service provider
 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `ServiceProvider` updated
 */
public func fetchProvider( provider: ServiceProviderJSON, context: NSManagedObjectContext ) -> ServiceProvider
{
   let providerEntity: ServiceProvider? = getProvider( by: provider.id, context: context )
   provider.updateEntity( entity: providerEntity )
   return providerEntity ?? provider.addToCoreData( context: context )
}

/**
 Returns the number of `ServiceProvider` records in the given context.

 - parameter context: `NSManagedObjectContext` Core Data object context
 - returns: `Int?` Number of `ServiceProvider` records in the context
 */
public func getServiceProviderCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: SERVICE_PROVIDER_ENTITY_NAME, context: context )
}

/**
 Delete all `ServiceProvider` entities in the given context.

 - parameter context: `NSManagedObjectContext` context to remove entities from
 */
func deleteAllServiceProviderEntities( context: NSManagedObjectContext )
{
   deleteAllEntities( entityType: SERVICE_PROVIDER_ENTITY_NAME, context: context )
}
