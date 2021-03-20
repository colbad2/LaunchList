// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Part of the starship API.
 
 ### Example JSON
       {
         "title": "LabPadre 24/7 Livestream",
         "description": "LabPadre is a free 24/7 live stream of the SpaceX …",
         "image": "https://i.ytimg.com/vi/5QbM7Vsz3kg/maxresdefault_live.jpg",
         "url": "https://www.youtube.com/watch?v=Ky5l9ZxsG9M"
       }
 */
public class LiveStreamJSON: Decodable, JSONElement
{
   let title: String?
   let liveStreamDescription: String?
   let image: String?
   let url: String?

   /**
    Make a `LiveStreamJSON` from a JSON structure.

    - parameter json: `Any` JSON to parse
    */
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      title = nonEmptyString( json[ "title" ] )
      liveStreamDescription = nonEmptyString( json[ "description" ] )
      image = nonEmptyString( json[ "image" ] )
      url = nonEmptyString( json[ "url" ] )
   }
}
