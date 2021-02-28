// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 The larger location of the launch, that contains the launch pad itself. For example, 'Kennedy
 Space Center' would be the location for 'Launch Complex 39A'.

 Part of a `PadJSON`.

 ### Example JSON:
       {
           "country_code": "USA",
           "id": 12,
           "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
           "name": "Cape Canaveral, FL, USA",
           "total_landing_count": 20,
           "total_launch_count": 208,
           "url": "https://ll.thespacedevs.com/2.1.0/location/12/"
       }

 ### Spec
       id                  integer
       url                 string($uri)
       name                string maxLength: 255
       country_code        string maxLength: 255
       map_image           string($uri) x-nullable: true
       total_launch_count  string
       total_landing_count string
       pads*               [Pad]
 */
public class LocationJSON: Decodable, Identifiable, JSONElement
{
   /** ID of the location within the API. */
   public var id: Int64
   /** API URI for this location. */
   var url: String?
   /** Three-letter country code containing the location. */
   var countryCode: String?
   /** URL to a map of the location. */
   var mapImage: String?
   /** Human-readable name for the location. */
   var name: String?
   /** Number of landings that have occurred at the location. */
   var totalLandingCount: Int64?
   /** Number of launches that have occurred at the location. */
   var totalLaunchCount: Int64?
   /** List of pads at the location. */
   var pads: [PadJSON] = []

   /**
    Make a `LocationJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.countryCode = json[ "country_code" ] as? String
      self.mapImage = json[ "map_image" ] as? String
      self.name = json[ "name" ] as? String
      self.totalLandingCount = json[ "total_landing_count" ] as? Int64
      self.totalLaunchCount = json[ "total_launch_count" ] as? Int64
      self.pads = ( json[ "pads" ] as? [JSONStructure] ?? [] ).compactMap { return PadJSON( json: $0 ) }
   }
}
