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

 ### Spec (API model: Location, LocationDetail)
       id                  integer
       url                 string($uri)
       name                string maxLength: 255
       country_code        string maxLength: 255
       map_image           string($uri)
       total_launch_count  string
       total_landing_count string

       pads*               [Pad] or PadSerializerNoLocation[]
 */
public class LocationJSON: Decodable, Identifiable, JSONElement
{
   /** ID of the location within the API. */
   public var id: Int64?
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

    - parameter json: `Any` JSON to parse
    */
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.url = nonEmptyString( json[ "url" ] )
      self.countryCode = nonEmptyString( json[ "country_code" ] )
      self.mapImage = nonEmptyString( json[ "map_image" ] )
      self.name = nonEmptyString( json[ "name" ] )
      self.totalLandingCount = nonNegativeInt( json[ "total_landing_count" ] )
      self.totalLaunchCount = nonNegativeInt( json[ "total_launch_count" ] )
      self.pads = parseArray( json[ "pads" ] )
   }
}
