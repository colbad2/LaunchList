// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**

 Same as what the API calls a 'vehicle' in some places.

 ### Example JSON
       {
         "id": 8,
         "url": "https://ll.thespacedevs.com/2.1.0/launcher/8/",
         "flight_proven": false,
         "serial_number": "B0003",
         "status": "expended",
         "details": "Core expended on flight, no recovery effort. First flight of Falcon 9",
         "launcher_config": {
           "id": 169,
           "launch_library_id": 90,
           "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/169/",
           "name": "Falcon 9 v1.0",
           "family": "Falcon",
           "full_name": "Falcon 9 v1.0",
           "variant": "v1.0"
         },
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_core_images/8_image_20191115082425.jpg",
         "flights": 1,
         "last_launch_date": "2010-06-04T18:45:00Z",
         "first_launch_date": "2010-06-04T18:45:00Z"
       }
 ### Spec (API model: LauncherDetailed, Launcher, LauncherDetail)
       id                  integer
       url                 string($uri)
       details             string maxLength: 2048
       flight_proven       boolean
       serial_number       string maxLength: 10 x-nullable: true
       status              string maxLength: 2048
       image_url           string($uri)x-nullable: true
       successful_landings string
       attempted_landings  string
       flights             string
       last_launch_date    string
       first_launch_date   string
       successful_landings string
       attempted_landings  string
       launcher_config     LauncherConfig or LauncherConfigList or LauncherConfigDetail
 */
public class LauncherJSON: Identifiable, JSONElement
{
   /** ID of the astronaut within the API. */
   public var id: Int64?
   /** URI of this data. */
   var url: String?
   var flightProven: Bool?
   var serialNumber: String?
   var status: String?
   var details: String?
   var launcherConfig: LauncherConfigJSON?
   var imageURL: String?
   var flights: Int64?
   var lastLaunchDate: String?
   var firstLaunchDate: String?
   var successfulLandings: String?
   var attemptedLandings: String?

   /**
    Make a `LauncherJSON` from a JSON structure.

    - parameter json: `Any` JSON to parse
    */
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      id = nonNegativeInt( json[ "id" ] )
      url = nonEmptyString( json[ "url" ] )
      flightProven = json[ "flight_proven" ] as? Bool
      serialNumber = nonEmptyString( json[ "serial_number" ] )
      status = nonEmptyString( json[ "status" ] )
      details = nonEmptyString( json[ "details" ] )
      launcherConfig = LauncherConfigJSON( json[ "launcher_config" ] as? JSONStructure )
      imageURL = nonEmptyString( json[ "image_url" ] )
      flights = nonNegativeInt( json[ "flights" ] )
      lastLaunchDate = nonEmptyString( json[ "last_launch_date" ] )
      firstLaunchDate = nonEmptyString( json[ "first_launch_date" ] )
      successfulLandings = nonEmptyString( json[ "successful_landings" ] )
      attemptedLandings = nonEmptyString( json[ "attempted_landings" ] )
   }
}
