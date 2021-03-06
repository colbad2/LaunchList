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
   public let id: Int64
   let profileImage: String?
   let comment: String?
   let infoURL: String?
   let createdBy: String?
   let createdOn: String?

   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.profileImage = json[ "profile_image" ] as? String
      self.comment = json[ "comment" ] as? String
      self.infoURL = json[ "info_url" ] as? String
      self.createdBy = json[ "created_by" ] as? String
      self.createdOn = json[ "created_on" ] as? String
   }
}
