// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable line_length
// swiftlint:disable file_length

/**
 Gets an example Core Data entity `Agency` for use in previews.

 - returns: `Agency` entity suitable for previewing
 */
public func getSampleAgencyEntity() -> Agency?
{
   let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
   return getEntityByID( entityID: 63,
                         context: context,
                         entityName: AGENCY_ENTITY_NAME ) as? Agency
}

/**
 Gets an example `AgencyJSON` struct for previews.

 - returns: `AgencyJSON` struct suitable for previewing
 */
public func getSampleAgency() -> AgencyJSON?
{
   return parseJSONString( json: sampleAgencyJSON )
}

private let sampleAgencyJSON =
   """
{
   "id": 63,
   "url": "https://ll.thespacedevs.com/2.1.0/agencies/63/",
   "name": "Russian Federal Space Agency (ROSCOSMOS)",
   "featured": true,
   "type": "Government",
   "country_code": "RUS",
   "abbrev": "RFSA",
   "description": "The Roscosmos State Corporation for Space Activities, commonly known as Roscosmos, is the governmental body responsible for the space science program of the Russian Federation and general aerospace research. Soyuz has many launch locations the Russian sites are Baikonur, Plesetsk and Vostochny however Ariane also purchases the vehicle and launches it from French Guiana.",
   "administrator": "Administrator: Dmitry Rogozin",
   "founding_year": "1992",
   "launchers": "Soyuz",
   "spacecraft": "Soyuz",
   "parent": null,
   "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_images/russian2520federal2520space2520agency25202528roscosmos2529_image_20190207032459.jpeg"
}
"""

/**
 Gets an example Core Data entity `Astronaut` for use in previews.

 - returns: `Astronaut` entity suitable for previewing
 */
public func getSampleAstronautEntity() -> Astronaut?
{
   let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
   return getEntityByID( entityID: 276,
                         context: context,
                         entityName: ASTRONAUT_ENTITY_NAME ) as? Astronaut
}

/**
 Gets an example `AstronautJSON` struct for previews.

 - returns: `AstronautJSON` struct suitable for previewing
 */
public func getSampleAstronaut() -> AstronautJSON?
{
   return parseJSONString( json: sampleAstronautJSON )
}

private let sampleAstronautJSON =
   """
 {
   "id": 276,
   "url": "https://ll.thespacedevs.com/2.1.0/astronaut/276/",
   "name": "Franz Viehböck",
   "status": {
     "id": 2,
     "name": "Retired"
   },
   "type": {
     "id": 2,
     "name": "Government"
   },
   "date_of_birth": "1960-08-24",
   "date_of_death": null,
   "nationality": "Austrian",
   "bio": "Franz Artur Viehböck (born August 24, 1960 in Vienna) is an Austrian electrical engineer, and was Austria's first cosmonaut. He was titulated „Austronaut“ by his country's media. He visited the Mir space station in 1991 aboard Soyuz TM-13, returning aboard Soyuz TM-12 after spending just over a week in space.",
   "twitter": null,
   "instagram": null,
   "wiki": "https://en.wikipedia.org/wiki/Franz_Viehb%C3%B6ck",
   "agency": {
     "id": 8,
     "url": "https://ll.thespacedevs.com/2.1.0/agencies/8/",
     "name": "Austrian Space Agency",
     "featured": false,
     "type": "Government",
     "country_code": "AUT",
     "abbrev": "ALR",
     "description": "The Austrian Space Agency was founded in 1972 and joined the ESA as a member in 1987. In 2005, control of the ALR was transferred to the Austrian Agency for Aerospace. They coordinated the first flight of an Austrian in space with a Soyuz launch in 1990.",
     "administrator": "Andreas Geisler",
     "founding_year": "1972",
     "launchers": "",
     "spacecraft": "Spacelab | GALILEO",
     "parent": null,
     "image_url": null
   },
   "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/astronaut_images/franz2520viehb25c325b6ck_image_20181201223901.jpg",
   "profile_image_thumbnail": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/default/cache/54/57/5457ce75acb7b188196eb442e3f17b64.jpg",
   "last_flight": "1991-10-02T05:59:38Z",
   "first_flight": "1991-10-02T05:59:38Z"
 }
"""

/**
 Gets an example Core Data entity `Docking` for use in previews.

 - returns: `Docking` entity suitable for previewing
 */
public func getSampleDockingEntity() -> Docking?
{
   let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
   return getEntityByID( entityID: 100,
                         context: context,
                         entityName: DOCKING_ENTITY_NAME ) as? Docking
}

/**
 Gets an example `DockingJSON` struct for previews.

 - returns: `DockingJSON` struct suitable for previewing
 */
public func getSampleDocking() -> DockingJSON?
{
   return parseJSONString( json: sampleDockingJSON )
}

private let sampleDockingJSON =
   """
 {
   "id": 100,
   "url": "https://ll.thespacedevs.com/2.1.0/docking_event/100/",
   "launch_id": "349eb56f-50e8-4858-9977-e4b7121c40f5",
   "docking": "2009-10-02T08:35:00Z",
   "departure": "2010-03-18T08:03:00Z",
   "flight_vehicle": {
     "id": 220,
     "url": "https://ll.thespacedevs.com/2.1.0/spacecraft/flight/220/",
     "destination": "International Space Station",
     "mission_end": "2010-03-18T11:24:00Z",
     "spacecraft": {
       "id": 77,
       "url": "https://ll.thespacedevs.com/2.1.0/spacecraft/77/",
       "name": "Soyuz TMA-16",
       "serial_number": "Soyuz TMA 11F732A17 #226",
       "status": {
         "id": 4,
         "name": "Single Use"
       },
       "description": "Soyuz TMA-16 was a Soyuz spacecraft which launched on September 30 2009 07:14 UTC. It transported two members of the Expedition 21 crew and one participant to the International Space Station. The Expedition 21 crew consisted of Maksim Surayev and Jeffrey Williams. The spaceflight participant was tourist Guy Laliberté.",
       "spacecraft_config": {
         "id": 1,
         "url": "https://ll.thespacedevs.com/2.1.0/config/spacecraft/1/",
         "name": "Soyuz",
         "type": {
           "id": 1,
           "name": "Unknown"
         },
         "agency": {
           "id": 63,
           "url": "https://ll.thespacedevs.com/2.1.0/agencies/63/",
           "name": "Russian Federal Space Agency (ROSCOSMOS)",
           "type": "Government"
         },
         "in_use": true,
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/soyuz_image_20201015191152.jpg"
       }
     }
   },
   "docking_location": {
     "id": 2,
     "name": "Zvezda aft"
   }
 }
"""

/**
 Gets an example Core Data entity `Event` for use in previews.

 - returns: `Event` entity suitable for previewing
 */
public func getSampleEventEntity() -> Event?
{
   let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
   return getEntityByID( entityID: 206,
                         context: context,
                         entityName: EVENT_ENTITY_NAME ) as? Event
}

/**
 Gets an example `EventJSON` struct for previews.

 - returns: `EventJSON` struct suitable for previewing
 */
public func getSampleEvent() -> EventJSON?
{
   return parseJSONString( json: sampleEventJSON )
}

private let sampleEventJSON =
   """
  {
    "id": 206,
    "url": "https://ll.thespacedevs.com/2.1.0/event/206/",
    "slug": "starship-sn9-cryoproof-test",
    "name": "Starship SN9 Cryoproof Test",
    "type": {
      "id": 21,
      "name": "Cryoproof Test"
    },
    "description": "SpaceX will likely conduct a cryoproof test on Starship SN9. This is the first cryo test performed on the vehicle.",
    "location": "Boca Chica, Texas",
    "news_url": null,
    "video_url": "https://www.youtube.com/watch?v=Ky5l9ZxsG9M",
    "feature_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/event_images/starship_sn9_te_image_20201229002608.png",
    "date": "2020-12-29T23:00:00Z",
    "launches": [],
    "expeditions": [],
    "spacestations": [],
    "program": [
      {
        "id": 1,
        "url": "https://ll.thespacedevs.com/2.1.0/program/1/",
        "name": "SpaceX Starship",
        "description": "The SpaceX Starship is a fully reusable super heavy-lift launch vehicle under development by SpaceX since 2012, as a self-funded private spaceflight project.  The second stage of the Starship — is designed as a long-duration cargo and passenger-carrying spacecraft. It is expected to be initially used without any booster stage at all, as part of an extensive development program to prove out launch-and-landing and iterate on a variety of design details, particularly with respect to the vehicle's atmospheric reentry.",
        "agencies": [
          {
            "id": 121,
            "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/",
            "name": "SpaceX",
            "type": "Commercial"
          }
        ],
        "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/spacex2520star_program_20201129204513.png",
        "start_date": "2019-03-01T05:00:00Z",
        "end_date": null,
        "info_url": "https://www.spacex.com/vehicles/starship/",
        "wiki_url": "https://en.wikipedia.org/wiki/SpaceX_Starship"
      }
    ]
  }
"""

/**
 Gets an example Core Data entity `Expedition` for use in previews.

 - returns: `Expedition` entity suitable for previewing
 */
public func getSampleExpeditionEntity() -> Expedition?
{
   let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
   return getEntityByID( entityID: 81,
                         context: context,
                         entityName: EXPEDITION_ENTITY_NAME ) as? Expedition
}

/**
 Gets an example `ExpeditionJSON` struct for previews.

 - returns: `ExpeditionJSON` struct suitable for previewing
 */
public func getSampleExpedition() -> ExpeditionJSON?
{
   return parseJSONString( json: sampleExpeditionJSON )
}

private let sampleExpeditionJSON =
   """
 {
   "id": 81,
   "url": "https://ll.thespacedevs.com/2.1.0/expedition/81/",
   "name": "Expedition 47",
   "start": "2016-03-02T01:02:00Z",
   "end": "2016-06-18T05:52:00Z",
   "spacestation": {
     "id": 4,
     "url": "https://ll.thespacedevs.com/2.1.0/spacestation/4/",
     "name": "International Space Station",
     "status": {
       "id": 1,
       "name": "Active"
     },
     "orbit": "Low Earth Orbit",
     "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/spacestation_images/international2520space2520station_image_20190220215716.jpeg"
   }
 }
"""

/**
 Gets an example Core Data entity `FlightVehicle` for use in previews.

 - returns: `FlightVehicle` entity suitable for previewing
 */
public func getSampleFlightVehicleEntity() -> FlightVehicle?
{
   let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
   return getEntityByID( entityID: 220,
                         context: context,
                         entityName: FLIGHT_VEHICLE_ENTITY_NAME ) as? FlightVehicle
}

/**
 Gets an example `FlightVehicleJSON` struct for previews.

 - returns: `FlightVehicleJSON` struct suitable for previewing
 */
public func getSampleFlightVehicle() -> FlightVehicleJSON?
{
   return parseJSONString( json: sampleFlightVehicleJSON )
}

private let sampleFlightVehicleJSON =
   """
{
  "id": 220,
  "url": "https://ll.thespacedevs.com/2.1.0/spacecraft/flight/220/",
  "destination": "International Space Station",
  "mission_end": "2010-03-18T11:24:00Z",
  "spacecraft": {
    "id": 77,
    "url": "https://ll.thespacedevs.com/2.1.0/spacecraft/77/",
    "name": "Soyuz TMA-16",
    "serial_number": "Soyuz TMA 11F732A17 #226",
    "status": {
      "id": 4,
      "name": "Single Use"
    },
    "description": "Soyuz TMA-16 was a Soyuz spacecraft which launched on September 30 2009 07:14 UTC. It transported two members of the Expedition 21 crew and one participant to the International Space Station. The Expedition 21 crew consisted of Maksim Surayev and Jeffrey Williams. The spaceflight participant was tourist Guy Laliberté.",
    "spacecraft_config": {
      "id": 1,
      "url": "https://ll.thespacedevs.com/2.1.0/config/spacecraft/1/",
      "name": "Soyuz",
      "type": {
        "id": 1,
        "name": "Unknown"
      },
      "agency": {
        "id": 63,
        "url": "https://ll.thespacedevs.com/2.1.0/agencies/63/",
        "name": "Russian Federal Space Agency (ROSCOSMOS)",
        "type": "Government"
      },
      "in_use": true,
      "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/soyuz_image_20201015191152.jpg"
    }
  }
}
"""

/**
 Gets an example Core Data entity `LauncherConfig` for use in previews.

 - returns: `LauncherConfig` entity suitable for previewing
 */
public func getSampleLauncherConfigEntity() -> LauncherConfig?
{
   let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
   return getEntityByID( entityID: 169,
                         context: context,
                         entityName: LAUNCHER_CONFIG_ENTITY_NAME ) as? LauncherConfig
}

/**
 Gets an example `LauncherConfigJSON` struct for previews.

 - returns: `LauncherConfigJSON` struct suitable for previewing
 */
public func getSampleLauncherConfig() -> LauncherConfigJSON?
{
   return parseJSONString( json: sampleLauncherConfigJSON )
}

private let sampleLauncherConfigJSON =
   """
 {
     "id": 169,
     "launch_library_id": 90,
     "url": "https://ll.thespacedevs.com/2.1.0/config/launcherConfig/169/",
     "name": "Falcon 9 v1.0",
     "family": "Falcon",
     "full_name": "Falcon 9 v1.0",
     "variant": "v1.0"
   }
"""

/**
 Gets an example Core Data entity `Launcher` for use in previews.

 - returns: `Launcher` entity suitable for previewing
 */
public func getSampleLauncherEntity() -> Launcher?
{
   let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
   return getEntityByID( entityID: 8,
                         context: context,
                         entityName: LAUNCHER_ENTITY_NAME ) as? Launcher
}

/**
 Gets an example `LauncherJSON` struct for previews.

 - returns: `LauncherJSON` struct suitable for previewing
 */
public func getSampleLauncher() -> LauncherJSON?
{
   return parseJSONString( json: sampleLauncherJSON )
}

private let sampleLauncherJSON =
   """
 {
   "id": 8,
   "url": "https://ll.thespacedevs.com/2.1.0/launcher/8/",
   "flight_proven": false,
   "serial_number": "B0003",
   "status": "expended",
   "details": "Core expended on flight, no recovery effort. First flight of Falcon 9",
   "launcher_config": {
     "id": 169,
     "launch_library_id": 90,
     "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/169/",
     "name": "Falcon 9 v1.0",
     "family": "Falcon",
     "full_name": "Falcon 9 v1.0",
     "variant": "v1.0"
   },
   "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_core_images/8_image_20191115082425.jpg",
   "flights": 1,
   "last_launch_date": "2010-06-04T18:45:00Z",
   "first_launch_date": "2010-06-04T18:45:00Z"
 }
"""

/**
 Gets an example Core Data entity `Launch` for use in previews.

 - returns: `Launch` entity suitable for previewing
 */
public func getSampleLaunchEntity() -> Launch?
{
   let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
   return getEntityByID( entityID: "724dd8ce-78ec-4dad-b17c-ff66c257fab7",
                         context: context,
                         entityName: LAUNCH_ENTITY_NAME ) as? Launch
}

/**
 Gets an example `LaunchJSON` struct for previews.

 - returns: `LaunchJSON` struct suitable for previewing
 */
public func getSampleLaunch() -> LaunchJSON?
{
   return parseJSONString( json: sampleLaunchJSON )
}

private let sampleLaunchJSON =
   """
{
  "id": "724dd8ce-78ec-4dad-b17c-ff66c257fab7",
  "url": "https://ll.thespacedevs.com/2.1.0/launch/724dd8ce-78ec-4dad-b17c-ff66c257fab7/",
  "launch_library_id": 1943,
  "slug": "sls-block-1b-artemis-7",
  "name": "SLS Block 1B | Artemis-7",
  "status": {
    "id": 2,
    "name": "To Be Determined",
    "abbrev": "TBD",
    "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources."
  },
  "net": "2028-01-01T00:00:00Z",
  "window_end": "2028-01-01T00:00:00Z",
  "window_start": "2028-01-01T00:00:00Z",
  "inhold": false,
  "tbdtime": false,
  "tbddate": false,
  "probability": -1,
  "holdreason": null,
  "failreason": null,
  "hashtag": null,
  "launch_service_provider": {
    "id": 44,
    "url": "https://ll.thespacedevs.com/2.1.0/agencies/44/",
    "name": "National Aeronautics and Space Administration",
    "type": "Government"
  },
  "rocket": {
    "id": 2548,
    "configuration": {
      "id": 205,
      "launch_library_id": 236,
      "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/205/",
      "name": "SLS Block 1B",
      "family": "",
      "full_name": "SLS Block 1B",
      "variant": ""
    }
  },
  "mission": null,
  "pad": {
    "id": 4,
    "url": "https://ll.thespacedevs.com/2.1.0/pad/4/",
    "agency_id": 44,
    "name": "Launch Complex 39B",
    "info_url": null,
    "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39B",
    "map_url": "http://maps.google.com/maps?q=28.627+N,+80.621+W",
    "latitude": "28.62711233",
    "longitude": "-80.62101503",
    "location": {
      "id": 27,
      "url": "https://ll.thespacedevs.com/2.1.0/location/27/",
      "name": "Kennedy Space Center, FL, USA",
      "country_code": "USA",
      "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
      "total_launch_count": 182,
      "total_landing_count": 0
    },
    "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_4_20200803143518.jpg",
    "total_launch_count": 57
  },
  "webcast_live": false,
  "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/sls_block_1b_image_20200905100013.jpeg",
  "infographic": null,
  "program": [
    {
      "id": 15,
      "url": "https://ll.thespacedevs.com/2.1.0/program/15/",
      "name": "Artemis",
      "description": "The Artemis program is a US government-funded crewed spaceflight program that has the goal of landing \\"the first woman and the next man\\" on the Moon, specifically at the lunar south pole region by 2024.",
      "agencies": [
        {
          "id": 44,
          "url": "https://ll.thespacedevs.com/2.1.0/agencies/44/",
          "name": "National Aeronautics and Space Administration",
          "type": "Government"
        }
      ],
      "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/artemis_program_20200821091844.png",
      "start_date": "2017-12-11T00:00:00Z",
      "end_date": null,
      "info_url": "https://www.nasa.gov/specials/artemis/",
      "wiki_url": "https://en.wikipedia.org/wiki/Artemis_program"
    }
  ]
}
"""

/**
 Gets an example Core Data entity `LiveStream` for use in previews.

 - returns: `LiveStream` entity suitable for previewing
 */
public func getSampleLiveStreamEntity() -> LiveStream?
{
   let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
   return getLiveStreamByURL( liveStreamURL: "https://www.youtube.com/watch?v=Ky5l9ZxsG9M", context: context )
}

/**
 Gets an example `LiveStreamJSON` struct for previews.

 - returns: `LiveStreamJSON` struct suitable for previewing
 */
public func getSampleLiveStream() -> LiveStreamJSON?
{
   return parseJSONString( json: sampleLiveStreamJSON )
}

private let sampleLiveStreamJSON =
"""
 {
   "title": "LabPadre 24/7 Livestream",
   "description": "LabPadre is a free 24/7 live stream of the SpaceX Starship construction and testing site in Boca Chica, Texas. Multi camera views placed in several locations capture every moment of the Starship's construction and testing. LabPadre is devoted to supporting and growing the amazing community surrounding SpaceX and their fascinating developments.",
   "image": "https://i.ytimg.com/vi/5QbM7Vsz3kg/maxresdefault_live.jpg",
   "url": "https://www.youtube.com/watch?v=Ky5l9ZxsG9M"
 }
"""

/**
 Gets an example Core Data entity `Location` for use in previews.

 - returns: `Location` entity suitable for previewing
 */
public func getSampleLocationEntity() -> Location?
{
   let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
   return getEntityByID( entityID: 10,
                         context: context,
                         entityName: LOCATION_ENTITY_NAME ) as? Location
}

/**
 Gets an example `LocationJSON` struct for previews.

 - returns: `LocationJSON` struct suitable for previewing
 */
public func getSampleLocation() -> LocationJSON?
{
   return parseJSONString( json: sampleLocationJSON )
}

private let sampleLocationJSON =
   """
{
  "id": 10,
  "url": "https://ll.thespacedevs.com/2.1.0/location/10/",
  "name": "Onenui Station, Mahia Peninsula, New Zealand",
  "country_code": "NZL",
  "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_10_20200803142509.jpg",
  "total_launch_count": 17,
  "total_landing_count": 1
}
"""

/**
 Gets an example Core Data entity `Mission` for use in previews.

 - returns: `Mission` entity suitable for previewing
 */
public func getSampleMissionEntity() -> Mission?
{
   let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
   return getEntityByID( entityID: 1087,
                         context: context,
                         entityName: MISSION_ENTITY_NAME ) as? Mission
}

/**
 Gets an example `MissionJSON` struct for previews.

 - returns: `MissionJSON` struct suitable for previewing
 */
func getSampleMission() -> MissionJSON?
{
   return parseJSONString( json: sampleMissionJSON )
}

private let sampleMissionJSON =
   """
{
  "id": 1087,
  "launch_library_id": 1284,
  "name": "Europa Clipper",
  "description": "Europa Clipper is the first dedicated mission to study Jupiter's moon Europa. Mission is developed by NASA and comprises of an orbiter spacecraft, which, while in orbit around Jupiter, will perform numerous flybys over Europa. Europa Clipper payload suit included high-resolution cameras and spectrometers for imaging Europa's surface and thin atmosphere, an ice-penetrating radar to search for subsurface water, and a magnetometer and gravity measurements to measure the moon's magnetic field and unlock clues about its ocean and deep interior.",
  "launch_designator": null,
  "type": "Planetary Science",
  "orbit": {
    "id": 6,
    "name": "Heliocentric N/A",
    "abbrev": "Helio-N/A"
  }
}
"""

/**
 Gets an example Core Data entity `Pad` for use in previews.

 - returns: `Pad` entity suitable for previewing
 */
public func getSamplePadEntity() -> Pad?
{
   let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
   return getEntityByID( entityID: 87,
                         context: context,
                         entityName: PAD_ENTITY_NAME ) as? Pad
}

/**
 Gets an example `PadJSON` struct for previews.

 - returns: `PadJSON` struct suitable for previewing
 */
public func getSamplePad() -> PadJSON?
{
   return parseJSONString( json: samplePadJSON )
}

private let samplePadJSON =
   """
{
   "id": 87,
   "url": "https://ll.thespacedevs.com/2.1.0/pad/87/",
   "agency_id": null,
   "name": "Launch Complex 39A",
   "info_url": null,
   "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A",
   "map_url": "http://maps.google.com/maps?q=28.608+N,+80.604+W",
   "latitude": "28.60822681",
   "longitude": "-80.60428186",
   "location": {
     "id": 27,
     "url": "https://ll.thespacedevs.com/2.1.0/location/27/",
     "name": "Kennedy Space Center, FL, USA",
     "country_code": "USA",
     "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
     "total_launch_count": 182,
     "total_landing_count": 0
   },
   "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_87_20200803143537.jpg",
   "total_launch_count": 125
}
"""

/**
 Gets an example Core Data entity `Program` for use in previews.

 - returns: `Program` entity suitable for previewing
 */
public func getSampleProgramEntity1() -> Program?
{
   let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
   return getEntityByID( entityID: 17,
                         context: context,
                         entityName: PROGRAM_ENTITY_NAME ) as? Program
}

/**
 Gets an example Core Data entity `Program` for use in previews.

 TODO make sure the second version is loaded in `Persistence`

 - returns: `Program` entity suitable for previewing
 */
public func getSampleProgramEntity2() -> Program?
{
   let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
   return getEntityByID( entityID: 15,
                         context: context,
                         entityName: PROGRAM_ENTITY_NAME ) as? Program
}

/**
 Returns a [ProgramJSON] to use in generating UI previews.

 - returns: Fixed program data
 */
public func getSampleProgram() -> ProgramJSON?
{
   return parseJSONString( json: sampleProgramJSON )
}

private let sampleProgramJSON =
   """
 {
   "id": 17,
   "url": "https://ll.thespacedevs.com/2.1.0/program/17/",
   "name": "International Space Station",
   "description": "The International Space Station programme is tied together by a complex set of legal, political and financial agreements between the sixteen nations involved in the project, governing ownership of the various components, rights to crewing and utilization, and responsibilities for crew rotation and resupply of the International Space Station. It was conceived in 1984 by President Ronald Reagan, during the Space Station Freedom project as it was originally called.",
   "agencies": [
     {
       "id": 16,
       "url": "https://ll.thespacedevs.com/2.1.0/agencies/16/",
       "name": "Canadian Space Agency",
       "type": "Government"
     },
     {
       "id": 27,
       "url": "https://ll.thespacedevs.com/2.1.0/agencies/27/",
       "name": "European Space Agency",
       "type": "Multinational"
     },
     {
       "id": 37,
       "url": "https://ll.thespacedevs.com/2.1.0/agencies/37/",
       "name": "Japan Aerospace Exploration Agency",
       "type": "Government"
     },
     {
       "id": 44,
       "url": "https://ll.thespacedevs.com/2.1.0/agencies/44/",
       "name": "National Aeronautics and Space Administration",
       "type": "Government"
     },
     {
       "id": 63,
       "url": "https://ll.thespacedevs.com/2.1.0/agencies/63/",
       "name": "Russian Federal Space Agency (ROSCOSMOS)",
       "type": "Government"
     }
   ],
   "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/international2_program_20201129184745.png",
   "start_date": "1998-11-20T06:40:00Z",
   "end_date": null,
   "info_url": "https://www.nasa.gov/mission_pages/station/main/index.html",
   "wiki_url": "https://en.wikipedia.org/wiki/International_Space_Station_programme"
 }
"""

/**
 Gets an example Core Data entity `Rocket` for use in previews.

 - returns: `Rocket` entity suitable for previewing
 */
public func getSampleRocketEntity() -> Rocket?
{
   return getEntityByID( entityID: 2663,
                         context: PersistenceController.preview.container.viewContext,
                         entityName: ROCKET_ENTITY_NAME ) as? Rocket
}

/**
 Gets an example `RocketJSON` struct for previews.

 - returns: `RocketJSON` struct suitable for previewing
 */
public func getSampleRocket() -> RocketJSON?
{
   return parseJSONString( json: sampleRocketJSON )
}

private let sampleRocketJSON =
   """
{
  "id": 2663,
  "configuration": {
    "id": 143,
    "launch_library_id": 144,
    "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/143/",
    "name": "Space Launch System (SLS)",
    "family": "SLS",
    "full_name": "Space Launch System (SLS)",
    "variant": ""
  }
}
"""

/**
 Gets an example Core Data entity `ServiceProvider` for use in previews.

 - returns: `ServiceProvider` entity suitable for previewing
 */
public func getSampleServiceProviderEntity() -> ServiceProvider?
{
   return getEntityByID( entityID: 121,
                         context: PersistenceController.preview.container.viewContext,
                         entityName: SERVICE_PROVIDER_ENTITY_NAME ) as? ServiceProvider
}

/**
 Gets an example `ServiceProviderJSON` struct for previews.

 - returns: `ServiceProviderJSON` struct suitable for previewing
 */
public func getSampleServiceProvider() -> ServiceProviderJSON?
{
   return parseJSONString( json: sampleServiceProviderJSON )
}

private let sampleServiceProviderJSON =
   """
{
   "id": 121,
   "name": "SpaceX",
   "type": "Commercial",
   "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
}
"""

/**
 Gets an example Core Data entity `SpacecraftConfig` for use in previews.

 - returns: `SpacecraftConfig` entity suitable for previewing
 */
public func getSampleSpacecraftConfigEntity() -> SpacecraftConfig?
{
   return getEntityByID( entityID: 1,
                         context: PersistenceController.preview.container.viewContext,
                         entityName: SPACECRAFT_CONFIG_ENTITY_NAME ) as? SpacecraftConfig
}

/**
 Gets an example `SpacecraftConfigJSON` struct for previews.

 - returns: `SpacecraftConfigJSON` struct suitable for previewing
 */
public func getSampleSpacecraftConfig() -> SpacecraftConfigJSON?
{
   return parseJSONString( json: sampleSpacecraftConfigJSON )
}

private let sampleSpacecraftConfigJSON =
   """
 {
   "id": 1,
   "url": "https://ll.thespacedevs.com/2.1.0/config/spacecraft/1/",
   "name": "Soyuz",
   "type": {
     "id": 1,
     "name": "Unknown"
   },
   "agency": {
     "id": 63,
     "url": "https://ll.thespacedevs.com/2.1.0/agencies/63/",
     "name": "Russian Federal Space Agency (ROSCOSMOS)",
     "type": "Government"
   },
   "in_use": true,
   "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/soyuz_image_20201015191152.jpg"
 }
"""

/**
 Gets an example Core Data entity `Spacecraft` for use in previews.

 - returns: `Spacecraft` entity suitable for previewing
 */
public func getSampleSpacecraftEntity() -> Spacecraft?
{
   return getEntityByID( entityID: 77,
                         context: PersistenceController.preview.container.viewContext,
                         entityName: SPACECRAFT_ENTITY_NAME ) as? Spacecraft
}

/**
 Gets an example `SpacecraftJSON` struct for previews.

 - returns: `SpacecraftJSON` struct suitable for previewing
 */
public func getSampleSpacecraft() -> SpacecraftJSON?
{
   return parseJSONString( json: sampleSpacecraftJSON )
}

private let sampleSpacecraftJSON =
"""
{
 "id": 77,
 "url": "https://ll.thespacedevs.com/2.1.0/spacecraft/77/",
 "name": "Soyuz TMA-16",
 "serial_number": "Soyuz TMA 11F732A17 #226",
 "status": {
   "id": 4,
   "name": "Single Use"
 },
 "description": "Soyuz TMA-16 was a Soyuz spacecraft which launched on September 30 2009 07:14 UTC. It transported two members of the Expedition 21 crew and one participant to the International Space Station. The Expedition 21 crew consisted of Maksim Surayev and Jeffrey Williams. The spaceflight participant was tourist Guy Laliberté.",
 "spacecraft_config": {
   "id": 1,
   "url": "https://ll.thespacedevs.com/2.1.0/config/spacecraft/1/",
   "name": "Soyuz",
   "type": {
     "id": 1,
     "name": "Unknown"
   },
   "agency": {
     "id": 63,
     "url": "https://ll.thespacedevs.com/2.1.0/agencies/63/",
     "name": "Russian Federal Space Agency (ROSCOSMOS)",
     "type": "Government"
   },
   "in_use": true,
   "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/soyuz_image_20201015191152.jpg"
 }
}
"""

/**
 Gets an example Core Data entity `SpaceStation` for use in previews.

 - returns: `SpaceStation` entity suitable for previewing
 */
public func getSampleSpaceStationEntity() -> SpaceStation?
{
   return getEntityByID( entityID: 4,
                         context: PersistenceController.preview.container.viewContext,
                         entityName: SPACESTATION_ENTITY_NAME ) as? SpaceStation
}

/**
 Gets an example `SpaceStationJSON` struct for previews.

 - returns: `SpaceStationJSON` struct suitable for previewing
 */
public func getSampleSpaceStation() -> SpaceStationJSON?
{
   return parseJSONString( json: sampleSpaceStationJSON )
}

private let sampleSpaceStationJSON =
   """
{
  "id": 4,
  "url": "https://ll.thespacedevs.com/2.1.0/spacestation/4/",
  "name": "International Space Station",
  "status": {
    "id": 1,
    "name": "Active"
  },
  "orbit": "Low Earth Orbit",
  "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/spacestation_images/international2520space2520station_image_20190220215716.jpeg"
}
"""

/**
 Gets an example Core Data entity `Vehicle` for use in previews.

 - returns: `Vehicle` entity suitable for previewing
 */
public func getSampleVehicleEntity() -> Vehicle?
{
   return getEntityByID( entityID: 75,
                         context: PersistenceController.preview.container.viewContext,
                         entityName: VEHICLE_ENTITY_NAME ) as? Vehicle
}

/**
 Gets an example `VehicleJSON` struct for previews.

 - returns: `VehicleJSON` struct suitable for previewing
 */
public func getSampleVehicle() -> VehicleJSON?
{
   return parseJSONString( json: sampleVehicleJSON )
}

private let sampleVehicleJSON =
   """
 {
   "id": 75,
   "url": "https://ll.thespacedevs.com/2.1.0/launcher/75/",
   "flight_proven": false,
   "serial_number": "Mk1",
   "status": "destroyed",
   "details": "Starship Mk1 was partially destroyed during max pressure tank testing, when the forward LOX tank ruptured along a weld line of the craft's steel structure, propelling the bulkhead several meters upwards.",
   "launcher_config": {
     "id": 207,
     "launch_library_id": null,
     "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/207/",
     "name": "Starship Prototype",
     "family": "Starship",
     "full_name": "Starship Prototype",
     "variant": "Prototype"
   },
   "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_core_images/75_image_20200821075135.jpeg",
   "flights": 0,
   "last_launch_date": null,
   "first_launch_date": null
 }
"""
