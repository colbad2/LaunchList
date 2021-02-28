// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Returned by the 'config/landinglocation' endpoint.

 #### Spec
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
   public var id: Int64
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

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.name = json[ "name" ] as? String
      self.abbreviation = json[ "abbreviation" ] as? String
      self.location = LocationJSON( json: json[ "location" ] as? JSONStructure )
      self.successfulLandings = json[ "successful_landings" ] as? String
   }
}
