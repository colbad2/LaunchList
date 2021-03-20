// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Example JSON:
      {
         "id": 348,
         "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/profile_images/nosudrum_profile_20210217201305.jpg",
         "comment": "Starship SN11 Static Fire attempt today (March 12) between 13:00 and 18:00 UTC",
         "info_url": "https://twitter.com/BocaChicaGal/status/1370217153803194372?s=19",
         "created_by": "Nosu",
         "created_on": "2021-03-12T07:50:43Z"
      }

 ### Spec (API model: Update)
      id*           integer
      profile_image string
      comment       string maxLength: 40000
      info_url      string($uri) maxLength: 200
      created_by    string
      created_on    string($date-time)
 */
public class UpdateJSON: Decodable, Identifiable, JSONElement
{
   public let id: Int64?
   let profileImage: String?
   let comment: String?
   let infoURL: String?
   let createdBy: String?
   let createdOn: String?

   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      id = nonNegativeInt( json[ "id" ] )
      profileImage = nonEmptyString( json[ "profile_image" ] )
      comment = nonEmptyString( json[ "comment" ] )
      infoURL = nonEmptyString( json[ "info_url" ] )
      createdBy = nonEmptyString( json[ "created_by" ] )
      createdOn = nonEmptyString( json[ "created_on" ] )
   }
}
