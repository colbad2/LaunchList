// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Spec (API model: Landing)
       id   integer
       attempt   boolean x-nullable: true
       success   boolean x-nullable: true
       description   string maxLength: 2048
       location   LandingLocation{...}
       type   LandingType{...}
 */
public class LandingJSON: Decodable, Identifiable, JSONElement
{
   /** ID of the location within the API. */
   public var id: Int64
   var attempt: Bool?
   var success: Bool?
   var landingDescription: String?
   var location: LocationJSON?
   var type: LandingTypeJSON?

   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.attempt = json[ "attempt" ] as? Bool
      self.success = json[ "success" ] as? Bool
      self.landingDescription = json[ "description" ] as? String
      self.location = LocationJSON( json: json[ "location" ] as? JSONStructure )
      self.type = LandingTypeJSON( json: json[ "type" ] as? JSONStructure )
   }
}
