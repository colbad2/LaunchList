// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Spec (API Model: Events)
       id   integer
       url   string($uri)
       slug*   string($slug) pattern: ^[-a-zA-Z0-9_]+$ minLength: 1
       name*   string maxLength: 200 minLength: 1
       updates   [Update{...}]
       type   EventType{...}
       description   string maxLength: 2048
       location   string maxLength: 100
       news_url   string($uri) maxLength: 250
       video_url   string($uri) maxLength: 250
       feature_image   string($uri)
       date   string($date-time)
       launches*   [LaunchSerializerCommon{...}]
       expeditions*   [Expedition{...}]
       spacestations*   [SpaceStationSerializerForCommon{...}]
       program   [ Program{...}]
 */
public class EventsJSON: Decodable, Identifiable, JSONElement
{
   public let id: Int64
   let url: String?
   let slug: String?
   let name: String?
   var updates: [UpdateJSON] = []
   let type: IDNameJSON?
   let eventsDescription: String?
   let location: String?
   let newsURL: String?
   let videoURL: String?
   let featureImage: String?
   let date: String?
   var launches: [LaunchJSON] = []
   var expeditions: [ExpeditionJSON] = []
   var spaceStations: [ExpeditionJSON] = []
   var programs: [ProgramJSON] = []

   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.slug = json[ "slug" ] as? String
      self.name = json[ "name" ] as? String
      self.updates = ( json[ "updates" ] as? [JSONStructure] )?.compactMap { UpdateJSON( json: $0 ) } ?? []
      self.type = IDNameJSON( json: json[ "type" ] as? JSONStructure )
      self.eventsDescription = json[ "description" ] as? String
      self.location = json[ "location" ] as? String
      self.newsURL = json[ "news_url" ] as? String
      self.videoURL = json[ "video_url" ] as? String
      self.featureImage = json[ "feature_image" ] as? String
      self.date = json[ "date" ] as? String
      self.launches = ( json[ "launches" ] as? [JSONStructure] )?.compactMap { LaunchJSON( json: $0 ) } ?? []
      self.expeditions = ( json[ "expeditions" ] as? [JSONStructure] )?.compactMap { ExpeditionJSON( json: $0 ) } ?? []
      self.spaceStations = ( json[ "spacestations" ] as? [JSONStructure] )?.compactMap { ExpeditionJSON( json: $0 ) } ?? []
      self.programs = ( json[ "program" ] as? [JSONStructure] )?.compactMap { ProgramJSON( json: $0 ) } ?? []
   }
}
