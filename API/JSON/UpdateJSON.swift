// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Spec (Api model: Update)
 id*   integer
 profile_image   string
 comment   string maxLength: 40000
 info_url   string($uri) maxLength: 200
 created_by   string
 created_on   string($date-time)
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
      self.id = nonNegativeInt( json[ "id" ] )
      self.profileImage = nonEmptyString( json[ "profile_image" ] )
      self.comment = nonEmptyString( json[ "comment" ] )
      self.infoURL = nonEmptyString( json[ "info_url" ] )
      self.createdBy = nonEmptyString( json[ "created_by" ] )
      self.createdOn = nonEmptyString( json[ "created_on" ] )
   }
}
