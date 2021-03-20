// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**

 ### Example JSON:
       {
           "agency_id": 121,
           "id": 80,
           "info_url": null,
           "latitude": "28.56194122",
           "location": { .. },
           "longitude": "-80.57735736",
           "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_80_20200803143323.jpg",
           "map_url": "http://maps.google.com/maps?q=28.56194122,-80.57735736",
           "name": "Space Launch Complex 40",
           "total_launch_count": 63,
           "url": "https://ll.thespacedevs.com/2.1.0/pad/80/",
           "wiki_url": "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_40"
       }

 ### Example JSON 2:
          {
              "agency_id": null,
              "id": 54,
              "info_url": null,
              "latitude": "0.0",
              "location": {
                  "country_code": "UNK",
                  "id": 22,
                  "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_22_20200803142419.jpg",
                  "name": "Unknown Location",
                  "total_landing_count": 0,
                  "total_launch_count": 0,
                  "url": "https://ll.thespacedevs.com/2.1.0/location/22/"
              },
              "longitude": "0.0",
              "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_54_20200803143536.jpg",
              "map_url": "",
              "name": "Unknown Pad",
              "total_launch_count": 0,
              "url": "https://ll.thespacedevs.com/2.1.0/pad/54/",
              "wiki_url": ""
          }

 ### Spec (API model: Pad, PadSerializerNoLocation)
       id   integer readOnly: true
       url   string($uri) readOnly: true
       agency_id   integer maximum: 2147483647 minimum: -2147483648 x-nullable: true
       name   string maxLength: 255
       info_url   string($uri) maxLength: 200 x-nullable: true
       wiki_url   string($uri) maxLength: 200 x-nullable: true
       map_url   string($uri) maxLength: 200 x-nullable: true
       latitude   string maxLength: 30 x-nullable: true
       longitude   string maxLength: 30 x-nullable: true
       location*   Location{...}
       map_image   string($uri) x-nullable: true
       total_launch_count   string
 */
public class PadJSON: Decodable, Identifiable, JSONElement
{
   /** ID of the astronaut within the API. */
   public var id: Int64?
   /** URI of this data. Unused. */
   var url: String?
   var agencyID: Int64?
   var infoURL: String?
   var latitude: String?
   var longitude: String?
   var location: LocationJSON?
   var mapImage: String?
   var mapURL: String?
   var name: String?
   var totalLaunchCount: Int64?
   var wikiURL: String?

   /**
    Make a `LaunchJSON` from a JSON structure.

    - parameter json: `Any` JSON to parse
    */
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      id = nonNegativeInt( json[ "id" ] )
      url = nonEmptyString( json[ "url" ] )
      agencyID = nonNegativeInt( json[ "agency_id" ] )
      infoURL = nonEmptyString( json[ "info_url" ] )
      latitude = nonEmptyString( json[ "latitude" ] )
      longitude = nonEmptyString( json[ "longitude" ] )
      location = LocationJSON( json[ "location" ] )
      mapImage = nonEmptyString( json[ "map_image" ] )
      mapURL = nonEmptyString( json[ "map_url" ] )
      name = nonEmptyString( json[ "name" ] )
      totalLaunchCount = nonNegativeInt( json[ "total_launch_count" ] )
      wikiURL = nonEmptyString( json[ "wiki_url" ] )
   }
}
