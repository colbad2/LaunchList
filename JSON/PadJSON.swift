// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

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

 ### Spec
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
   // translate API attribute names into better var names
//   enum CodingKeys: String, CodingKey
//   {
//      case id, latitude, location, longitude, name, url
//
//      case agencyID = "agency_id"
//      case infoURL = "info_url"
//      case mapImage = "map_image"
//      case mapURL = "map_url"
//      case wikiURL = "wiki_url"
//      case totalLaunchCount = "total_launch_count"
//   }

   /** ID of the astronaut within the API. */
   public var id: Int64
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

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.agencyID = json[ "agency_id" ] as? Int64
      self.infoURL = json[ "info_url" ] as? String
      self.latitude = json[ "latitude" ] as? String
      self.longitude = json[ "longitude" ] as? String
      self.location = LocationJSON( json: json[ "location" ] as? JSONStructure )
      self.mapImage = json[ "map_image" ] as? String
      self.mapURL = json[ "map_url" ] as? String
      self.name = json[ "name" ] as? String
      self.totalLaunchCount = json[ "total_launch_count" ] as? Int64
      self.wikiURL = json[ "wiki_url" ] as? String
   }

   /**
    Add this data to Core Data as a `Pad` entity. The context still needs to be saved after the add.

    - parameter context: Core Data context to add the entity to.
    - returns: `Pad` the added entity
    */
   public func addToCoreData( context: NSManagedObjectContext ) -> Pad
   {
      let newPad: Pad = Pad( context: context )
      updateEntity( entity: newPad, context: context )

      return newPad
   }

   /**
    Set or update the values of the `Pad` entity,

    - parameter entity:  `Pad?` entity to fill/update
    - parameter context: `NSManagedObjectContext` Core Data object context to do the update in
    */
   public func updateEntity( entity: Pad?, context: NSManagedObjectContext )
   {
      guard let padEntity = entity else { return }

      padEntity.agencyID = guaranteedInt64( agencyID )
      padEntity.id = id
      padEntity.infoURL = infoURL
      padEntity.latitude = latitude ?? ""
      padEntity.longitude = longitude ?? ""
      padEntity.addEntityFromJSON( location: location, context: context )
      padEntity.mapImage = mapImage

      if let mapURL: String = mapURL?.trim()
      {
         if !mapURL.isEmpty
         {
            padEntity.mapURL = mapURL.fixBadUTF()
         }
      }

      if let padName: String = name
      {
         var name: String = padName
         if !name.isEmpty && ( name.first?.isNumber ?? false )
         {
            name = "Pad " + name
         }
         padEntity.name = name
      }

      padEntity.totalLaunchCount = guaranteedInt64( totalLaunchCount )

      if let wikiURL: String = wikiURL?.trim()
      {
         if !wikiURL.isEmpty
         {
            padEntity.wikiURL = wikiURL
         }
      }

      padEntity.fetched = Date()
   }
}
