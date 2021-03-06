// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Example JSON
      {
         "id": 2,
         "url": "https://ll.thespacedevs.com/2.1.0/expedition/2/",
         "name": "Skylab 2",
         "start": "1973-05-25T13:00:00Z",
         "end": "1973-06-22T13:49:48Z",
         "spacestation": {
           "id": 6,
           "url": "https://ll.thespacedevs.com/2.1.0/spacestation/6/",
           "name": "Skylab",
           "status": {
             "id": 2,
             "name": "De-Orbited"
           },
           "orbit": "Low Earth Orbit",
           "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/spacestation_images/skylab_image_20190215230143.jpeg"
         }
      }

 ### Spec (API models: Expedition, ExpeditionDetail, ExpeditionSerializerforSpacestation,
                         ExpeditionDetailedSerializerforSpacestation )
       id   integer
       url   string($uri)
       name*   string maxLength: 255 minLength: 1
       start*   string($date-time)
       end   string($date-time)
       spacestation   SpaceStationSerializerForExpedition or SpaceStationDetailedSerializerForExpedition
       crew   AstronautFlight[] or AstronautFlightForExpedition[]
*/
public class ExpeditionJSON: Decodable, Identifiable, JSONElement
{
   /** ID of the rocket within the API. */
   public let id: Int64
   /** URI for this data in the API. Unused. */
   let url: String?
   /** Expedition name. */
   let name: String?
   /** Expedition start date, ISO format. */
   let start: String?
   /** Expedition end date, ISO format. */
   let end: String?
   /** Station target for the mission. */
   let spaceStation: SpaceStationJSON?

   /**
    Make a `ExpeditionJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.name = json[ "name" ] as? String
      self.start = json[ "start" ] as? String
      self.end = json[ "end" ] as? String
      self.spaceStation = SpaceStationJSON( json: json[ "spacestation" ] as? JSONStructure )
   }
}
