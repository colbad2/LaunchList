// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Organization providing services for the launch. This is a subset of a full `Agency`.

 Part of a `LaunchJSON` object
 ### Example JSON:
     {
       "id": 121,
       "name": "SpaceX",
       "type": "Commercial",
       "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
     }

 // TODO replaced with Agency
 */
public class ServiceProviderJSON: Decodable
{
   /** ID of the astronaut within the API. */
   var id: Int64
   /** URI of this data. Unused. */
   var url: String?
   /** Agency name. */
   var name: String?
   /** Agency type. */
   var type: String?

   /**
    Make a `ServiceProviderJSON` from a JSON structure.

    - parameter json: `JSONStructure` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.name = json[ "name" ] as? String
      self.type = json[ "type" ] as? String
   }
}
