// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
   Mission being serviced by a launch.

   Part of a `LaunchJSON`.

   ### Example JSON:
         {
           "description": "T\u00fcrksat 5A is the first of two Turkish next generation communications satellites, which will be \
                            operated by T\u00fcrksat for commercial and military purposes.",
           "id": 1222,
           "launch_designator": null,
           "launch_library_id": null,
           "name": "T\u00fcrksat 5A",
           "orbit": { … },
           "type": "Communications"
         }

   ### Spec
       id                integer
       launch_library_id integer maximum: 2147483647 minimum: -2147483648 x-nullable: true
       name              string maxLength: 255
       description       string
       launch_designator string maxLength: 255 x-nullable: true
       type              string
       orbit*            Orbit{}
 }
 */
public class MissionJSON: Decodable, Identifiable, JSONElement
{
   /** ID of the mission within the API. */
   public var id: Int64
   /** Description of the mission. Can contain encoded Unicode elements like /u00fc, which are translated correctly on parse of JSON. */
   var description: String?
   /** unknown */
   var launchDesignator: String?
   /** ID from the previous API database. */
   var launchLibraryID: Int64?
   /** Human-readable name of the mission. */
   var name: String?
   /** Orbit for the mission. */
   var orbit: OrbitJSON?
   /** Type of the mission, such as communications, etc. Often blank. */
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
      self.description = json[ "description" ] as? String
      self.launchDesignator = json[ "launchDesignator" ] as? String
      self.launchLibraryID = json[ "launch_library_id" ] as? Int64
      self.name = json[ "name" ] as? String
      self.orbit = OrbitJSON( json: json[ "orbit" ] as? JSONStructure )
      self.type = json[ "type" ] as? String
   }
}

/**
 Filter the name of an orbit so that the names area standard across the API.

 - parameter name: `String` original orbit name
 - parameter abbreviation: `String` short orbit name
 - returns: standarad orbit name
 */
private func normalizedOrbitName( _ name: String?, abbreviation: String? = nil ) -> String?
{
   guard var orbitName = name else { return nil }

   if !orbitName.contains( " Orbit" )
   {
      orbitName += " Orbit"
   }

   if let abbreviation: String = abbreviation
   {
      orbitName += " (\(abbreviation))"
   }

   return orbitName
}
