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
public class EventsJSON: Identifiable, JSONElement
{
   public let id: Int64?
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

   public required init?(  _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      id = nonNegativeInt( json[ "id" ] )
      url = nonEmptyString( json[ "url" ] )
      slug = nonEmptyString( json[ "slug" ] )
      name = nonEmptyString( json[ "name" ] )
      updates = parseArray( json[ "updates" ] )
      type = IDNameJSON( json[ "type" ] )
      eventsDescription = nonEmptyString( json[ "description" ] )
      location = nonEmptyString( json[ "location" ] )
      newsURL = nonEmptyString( json[ "news_url" ] )
      videoURL = nonEmptyString( json[ "video_url" ] )
      featureImage = nonEmptyString( json[ "feature_image" ] )
      date = nonEmptyString( json[ "date" ] )
      launches = parseArray( json[ "launches" ] )
      expeditions = parseArray( json[ "expeditions" ] )
      spaceStations = parseArray( json[ "spacestations" ] )
      programs = parseArray( json[ "program" ] )
   }
}
