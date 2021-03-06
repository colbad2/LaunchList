// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Example JSON
       {
         "id": 14,
         "url": "https://ll.thespacedevs.com/2.1.0/spacestation/14/",
         "name": "Salyut 6",
         "status": {
           "id": 2,
           "name": "De-Orbited"
         },
         "orbit": "Low Earth Orbit",
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/spacestation_images/salyut25206_image_20190318095930.jpg"
       }

 ### Spec (API model: SpaceStationSerializerForDockingEvent, SpaceStationSerializerForExpedition,
                        SpaceStationSerializerForCommon, SpaceStationDetailedSerializerForExpedition,
                        SpaceStation, SpaceStationDetailed)
       id                integer
       url               string($uri)
       name*             string maxLength: 255 minLength: 1
       image_url         string($uri) x-nullable: true
       status            SpaceStationStatus{...} (IDNameJSON)
       orbit             string
       founded*          string($date)
       description*      string maxLength: 2048 minLength: 1
       owners            [AgencyList]
       type              SpaceStstionType (IDNameJSON)
       deorbited         string($date)
       active_expedition [Expedition] or ExpeditionSerializerForSpacestation[]
       (active_expeditions ExpeditionDetailedSerializerForSpacestation[])
       height   number title: Height (m)
       width   number title: Width (m)
       mass   number title: Mass (T)
       volume   integer title: Volume (m^3) maximum: 2147483647 minimum: -214748364
       onboard_crew   string
       docking_location   [ DockingLocationSerializerForSpacestation{...}]
 */
public class SpaceStationJSON: Decodable, Identifiable, JSONElement
{
   /** ID of the rocket within the API. */
   public let id: Int64
   /** URI for this data in the API. Unused. */
   let url: String?
   /** Station name. */
   let name: String?
   /** Station status. */
   var status: StatusJSON?
   /** Station orbit. */
   let orbit: String?
   /** Image URL for the station. */
   let imageURL: String?
   var founded: String?
   var spaceStationDescription: String?
   var owners: [AgencyJSON] = []
   var type: String?
   var deorbited: String? // Date
   var activeExpeditions: [ExpeditionJSON] = []
   /** Height in meters.*/
   var height: Double?
   /** Width in meters.*/
   var width: Double?
   /** Mass in Tons. */
   var mass: Double?
   /** Volume (m^3). */
   var volume: Int64?
   var onboardCrew: String?
   var dockingLocations: [DockingLocationJSON] = []

   /**
    Make a `SpaceStationJSON` from a JSON structure.

    - parameter json: `JSONStructure?` JSON to parse
    */
   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.url = json[ "url" ] as? String
      self.name = json[ "name" ] as? String
      self.status = StatusJSON( json: json[ "status" ] as? JSONStructure )
      self.orbit = json[ "orbit" ] as? String
      self.imageURL = json[ "image_url" ] as? String
      self.founded = json[ "founded" ] as? String
      self.spaceStationDescription = json[ "description" ] as? String
      self.owners = ( json[ "owners" ] as? [JSONStructure] ?? [] ).compactMap { return AgencyJSON( json: $0 ) }
      self.type = IDNameJSON( json: json[ "type" ] as? JSONStructure )?.name
      self.deorbited = json[ "deorbited" ] as? String

      var expeditionsJSON: [JSONStructure]? = json[ "active_expedition" ] as? [JSONStructure]
      if expeditionsJSON == nil
      {
         expeditionsJSON = json[ "active_expeditions" ] as? [JSONStructure]
      }
      self.activeExpeditions = ( expeditionsJSON ?? [] ).compactMap { return ExpeditionJSON( json: $0 ) }

      self.height = json[ "height" ] as? Double
      self.width = json[ "width" ] as? Double
      self.mass = json[ "mass" ] as? Double
      self.volume = json[ "volume" ] as? Int64
      self.onboardCrew = json[ "onboard_crew" ] as? String

      let dockingLocationsJSON: [JSONStructure] = json[ "docking_location" ] as? [JSONStructure] ?? []
      self.dockingLocations = dockingLocationsJSON.compactMap { return DockingLocationJSON( json: $0 ) }
   }
}
