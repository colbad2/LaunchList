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
   // translate API attribute names into better var names
//   enum CodingKeys: String, CodingKey
//   {
//      case title, image, url
//
//      case liveStreamDescription = "description"
//   }

   let title: String?
   let liveStreamDescription: String?
   let image: String?
   let url: String

   /**
    Make a `LiveStreamJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }

      self.title = json[ "title" ] as? String
      self.liveStreamDescription = json[ "description" ] as? String
      self.image = json[ "image" ] as? String
      self.url = json[ "url" ] as! String
   }
}
