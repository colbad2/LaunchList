// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Spec
       priority      integer maximum: 2147483647 minimum: -2147483648
       title         string maxLength: 200 x-nullable: true
       description   string maxLength: 350 x-nullable: true
       feature_image string($uri) maxLength: 200 x-nullable: true
       url*          string($uri) minLength: 1
 */
public class URLLinkJSON: Decodable, JSONElement
{
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
}
