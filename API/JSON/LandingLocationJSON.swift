// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Returned by the 'config/landinglocation' endpoint.

 #### Spec (API model: LandingLocation)
       id   integer readOnly: true
       name   string maxLength: 255
       abbrev   string maxLength: 255
       description   string maxLength: 2048 x-nullable: true
       location*   Location{...}
       successful_landings   string readOnly: true
 */
public class LandingLocationJSON: Decodable, Identifiable, JSONElement
{
   /** ID of the location within the API. */
   public var id: Int64?
   /** Location name. */
   var name: String?
   /** Location abbreviation. */
   var abbreviation: String?
   /** Location data. */
   var location: LocationJSON?
   /** Landing count. */
   var successfulLandings: String?

   /**
    Make a `LandingLocationJSON` from a JSON structure.

    - parameter json: `Any` JSON to parse
    */
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.name = nonEmptyString( json[ "name" ] )
      self.abbreviation = nonEmptyString( json[ "abbreviation" ] )
      self.location = LocationJSON( json[ "location" ] )
      self.successfulLandings = nonEmptyString( json[ "successful_landings" ] )
   }
}
