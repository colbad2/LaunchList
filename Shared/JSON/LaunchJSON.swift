import Foundation
import CoreData

/**

    Example JSON:
    {
     "failreason": "",
     "hashtag": null,
     "holdreason": "",
     "id": "d5d607b7-05ed-4142-8703-14b553c195e0",
     "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
     "infographic": null,
     "inhold": false,
     "launch_library_id": 1412,
     "launch_service_provider": { … },
     "mission": { … },
     "name": "Falcon 9 Block 5 | T\\u00fcrksat 5A",
     "net": "2021-01-05T01:27:00Z",
     "pad": { … },
     "probability": -1,
     "program": [],
     "rocket": { … },
     "slug": "falcon-9-block-5-turksat-5a",
     "status": { … },
     "tbddate": true,
     "tbdtime": true,
     "url": "https://ll.thespacedevs.com/2.1.0/launch/d5d607b7-05ed-4142-8703-14b553c195e0/",
     "webcast_live": false,
     "window_end": "2021-01-05T05:29:00Z",
     "window_start": "2021-01-05T01:27:00Z"
    }
 */
public struct LaunchJSON: Decodable, Identifiable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case hashtag, id, image, infographic, mission, name,
         net, pad, probability, rocket, slug, status, url, webcastLive, windowEnd, windowStart

      case failReason = "failreason"
      case holdReason = "holdreason"
      case inHold = "inhold"
      case launchLibraryID = "launchLibraryId"
      case programs = "program"
      case tbdDate = "tbddate"
      case tbdTime = "tbdtime"
      case serviceProvider = "launchServiceProvider"
   }

   var failReason: String?
   var hashtag: String?
   var holdReason: String?
   public var id: String
   var image: String?
   var infographic: String?
   var inHold: Bool?
   var launchLibraryID: Int64?
   var serviceProvider: ServiceProviderJSON?
   var mission: MissionJSON?
   var name: String?
   var net: String?
   var pad: PadJSON?
   var probability: Int16?
   var programs: [ProgramJSON]? = []
   var rocket: RocketJSON?
   var slug: String?
   var status: StatusJSON?
   var tbdDate: Bool?
   var tbdTime: Bool?
   var url: String?
   var webcastLive: Bool?
   var windowEnd: String?
   var windowStart: String?

   func addToCoreData( context: NSManagedObjectContext ) -> Launch
   {
      let newLaunch: Launch = Launch( context: context )

      newLaunch.failReason = self.failReason
      newLaunch.hashtag = self.hashtag
      newLaunch.holdReason = self.holdReason
      newLaunch.id = self.id
      newLaunch.image = self.image
      newLaunch.infographic = wrapURL( self.infographic )
      newLaunch.inHold = self.inHold ?? false
      newLaunch.launchLibraryID = self.launchLibraryID ?? -1

      newLaunch.serviceProvider = self.serviceProvider?.addToCoreData( context: context )
      newLaunch.serviceProvider?.addToLaunches( newLaunch )
      
      newLaunch.mission = self.mission?.addToCoreData( context: context )
      newLaunch.mission?.launch = newLaunch
      
      newLaunch.name = self.name
      newLaunch.net = parseISODate( isoDate: self.net )
      newLaunch.pad = self.pad?.addToCoreData( context: context )
      newLaunch.probability = self.probability ?? -1

      for program in self.programs!
      {
         let programEntity: Program = program.addToCoreData( context: context )
         newLaunch.addToPrograms( programEntity )
         programEntity.addToLaunches( newLaunch )
      }

      newLaunch.rocket = self.rocket?.addToCoreData( context: context )
      newLaunch.rocket?.addToLaunches( newLaunch )

      newLaunch.slug = self.slug

      newLaunch.status = self.status?.addToCoreData( context: context )
      newLaunch.status?.launch = newLaunch

      newLaunch.tbdDate = self.tbdDate ?? false
      newLaunch.tbdTime = self.tbdTime ?? false
      newLaunch.url = wrapURL( self.url )
      newLaunch.webcastLive = self.webcastLive ?? false
      newLaunch.windowEnd = parseISODate( isoDate: self.windowEnd )
      newLaunch.windowStart = parseISODate( isoDate: self.windowStart )

      return newLaunch
   }
}

