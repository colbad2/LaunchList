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
   public var id: Int64?
   var attempt: Bool?
   var success: Bool?
   var landingDescription: String?
   var location: LocationJSON?
   var type: LandingTypeJSON?

   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.attempt = json[ "attempt" ] as? Bool
      self.success = json[ "success" ] as? Bool
      self.landingDescription = nonEmptyString( json[ "description" ] )
      self.location = LocationJSON( json[ "location" ] )
      self.type = LandingTypeJSON( json[ "type" ] )
   }
}
