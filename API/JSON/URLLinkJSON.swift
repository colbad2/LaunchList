// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Spec (API models: InfoURL, VidURL)
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
   let url: String?

   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      url = nonEmptyString( json[ "url" ] )
      priority = nonEmptyString( json[ "priority" ] )
      title = nonEmptyString( json[ "title" ] )
      urlDescription = nonEmptyString( json[ "description" ] )
      featureImage = nonEmptyString( json[ "feature_image" ] )
   }
}
