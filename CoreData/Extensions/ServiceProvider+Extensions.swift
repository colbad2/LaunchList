// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

extension ServiceProvider
{
   /** Set< Launch > wrapper for the generated NSSet of [Launch]s. */
   var launchesSet: Set< Launch > { self.launches as? Set< Launch > ?? Set< Launch >() }
}

/**
 Returns a sorted version of the given [ServiceProvider] array.

 - parameter serviceProviderArray - list of [ServiceProvider]s to sort
 - returns: sorted version of the given [ServiceProvider] list
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

public func getProvider( by entityID: Int64, context: NSManagedObjectContext ) -> ServiceProvider?
{
   return getEntityByID( entityID: entityID, context: context, entityName: "ServiceProvider" ) as? ServiceProvider
}

public func fetchProvider( provider: ServiceProviderJSON, context: NSManagedObjectContext ) -> ServiceProvider
{
   let providerEntity: ServiceProvider? = getProvider( by: provider.id, context: context )
   provider.updateEntity( entity: providerEntity )
   return providerEntity ?? provider.addToCoreData( context: context )
}

/**
 Returns the number of [ServiceProvider] records in the given context.

 - parameter context: Core Data object context
 - returns: [Int?] Number of [ServiceProvider] records in the context
 */
public func getServiceProviderCount( context: NSManagedObjectContext ) -> Int?
{
   return getRecordsCount( entityName: "ServiceProvider", context: context )
}