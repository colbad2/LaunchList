// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 ### Spec
       priority      integer maximum: 2147483647 minimum: -2147483648
       title         string maxLength: 200 x-nullable: true
       description   string maxLength: 350 x-nullable: true
       feature_image string($uri) maxLength: 200 x-nullable: true
       url*          string($uri) minLength: 1
 */
public class LinkJSON: Decodable, JSONElement
{
   // translate API attribute names into better var names
//   enum CodingKeys: String, CodingKey
//   {
//      case priority, title, url
//
//      case urlDescription = "description"
//      case featureImage = "feature_image"
//   }

   let priority: String?
   let title: String?
   let urlDescription: String?
   let featureImage: String?
   let url: String

   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let url = json[ "url" ] as? String else { return nil }

      self.url = url
      self.priority = json[ "priority" ] as? String
      self.title = json[ "title" ] as? String
      self.urlDescription = json[ "description" ] as? String
      self.featureImage = json[ "feature_image" ] as? String
   }

   /**
    Add this data to Core Data as a `Link` entity. The context still needs to be saved after the add.

    - parameter context: Core Data context to add the entity to.
    - returns: `URLLink` the added entity
    */
   public func addToCoreData( context: NSManagedObjectContext ) -> URLLink
   {
      let newLink: URLLink = URLLink( context: context )
      updateEntity( entity: newLink, context: context )

      return newLink
   }

   /**
    Set or update the values of the `URLLink` entity,

    - parameter entity:  `URLLink?` entity to fill/update
    - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
    */
   public func updateEntity( entity: URLLink?, context: NSManagedObjectContext )
   {
      guard let linkEntity = entity else { return }

      linkEntity.url = url
      linkEntity.priority = priority
      linkEntity.title = title
      linkEntity.urlDescription = urlDescription
      linkEntity.featureImage = featureImage
   }
}
