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
public class SpaceStationJSON: Identifiable, JSONElement
{
   /** ID of the rocket within the API. */
   public let id: Int64?
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
   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.url = nonEmptyString( json[ "url" ] )
      self.name = nonEmptyString( json[ "name" ] )
      self.status = StatusJSON( json[ "status" ] )
      self.orbit = nonEmptyString( json[ "orbit" ] )
      self.imageURL = nonEmptyString( json[ "image_url" ] )
      self.founded = nonEmptyString( json[ "founded" ] )
      self.spaceStationDescription = nonEmptyString( json[ "description" ] )
      self.owners = parseArray( json[ "owners" ] )
      self.type = IDNameJSON( json[ "type" ] )?.name
      self.deorbited = nonEmptyString( json[ "deorbited" ] )

      var expeditionsJSON: Any? = json[ "active_expedition" ]
      if expeditionsJSON == nil
      {
         expeditionsJSON = json[ "active_expeditions" ]
      }
      self.activeExpeditions = parseArray( expeditionsJSON )

      self.height = nonNegativeDouble( json[ "height" ] )
      self.width = nonNegativeDouble( json[ "width" ] )
      self.mass = nonNegativeDouble( json[ "mass" ] )
      self.volume = nonNegativeInt( json[ "volume" ] )
      self.onboardCrew = nonEmptyString( json[ "onboard_crew" ] )
      self.dockingLocations = parseArray( json[ "docking_location" ] )
   }
}
