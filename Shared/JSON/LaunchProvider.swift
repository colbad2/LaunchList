import Foundation

public class LaunchProvider
{
   public var launches: LaunchListJSON?

   public init()
   {
      let decoder = JSONDecoder()
      decoder.keyDecodingStrategy = .convertFromSnakeCase

      do
      {
         let jsonData = launchListJSON.data( using: .utf8 )!
         launches = try decoder.decode( LaunchListJSON.self, from: jsonData )
      }
      catch DecodingError.dataCorrupted( let context ) { print( context ) }
      catch DecodingError.keyNotFound( let key, let context )
      {
          print( "Key '\(key)' not found:", context.debugDescription )
          print( "codingPath:", context.codingPath )
      }
      catch DecodingError.valueNotFound( let value, let context )
      {
          print( "Value '\(value)' not found:", context.debugDescription )
          print( "codingPath:", context.codingPath )
      }
      catch DecodingError.typeMismatch(let type, let context )
      {
          print( "Type '\(type)' mismatch:", context.debugDescription )
          print( "codingPath:", context.codingPath )
      }
      catch { print("error: ", error) }
   }
}

var launchListJSON: String =
#"""
{
    "count": 35,
    "next": "https://ll.thespacedevs.com/2.1.0/launch/upcoming/?limit=10&offset=10&search=SpaceX",
    "previous": null,
    "results": [
        {
            "failreason": "",
            "hashtag": null,
            "holdreason": "",
            "id": "d5d607b7-05ed-4142-8703-14b553c195e0",
            "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
            "infographic": null,
            "inhold": false,
            "launch_library_id": 1412,
            "launch_service_provider": {
                "id": 121,
                "name": "SpaceX",
                "type": "Commercial",
                "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
            },
            "mission": {
                "description": "T\u00fcrksat 5A is the first of two Turkish next generation communications satellites, which will be operated by T\u00fcrksat for commercial and military purposes.",
                "id": 1222,
                "launch_designator": null,
                "launch_library_id": null,
                "name": "T\u00fcrksat 5A",
                "orbit": {
                    "abbrev": "GTO",
                    "id": 2,
                    "name": "Geostationary Transfer Orbit"
                },
                "type": "Communications"
            },
            "name": "Falcon 9 Block 5 | T\u00fcrksat 5A",
            "net": "2021-01-05T01:27:00Z",
            "pad": {
                "agency_id": 121,
                "id": 80,
                "info_url": null,
                "latitude": "28.56194122",
                "location": {
                    "country_code": "USA",
                    "id": 12,
                    "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
                    "name": "Cape Canaveral, FL, USA",
                    "total_landing_count": 20,
                    "total_launch_count": 208,
                    "url": "https://ll.thespacedevs.com/2.1.0/location/12/"
                },
                "longitude": "-80.57735736",
                "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_80_20200803143323.jpg",
                "map_url": "http://maps.google.com/maps?q=28.56194122,-80.57735736",
                "name": "Space Launch Complex 40",
                "total_launch_count": 63,
                "url": "https://ll.thespacedevs.com/2.1.0/pad/80/",
                "wiki_url": "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_40"
            },
            "probability": -1,
            "program": [],
            "rocket": {
                "configuration": {
                    "family": "Falcon",
                    "full_name": "Falcon 9 Block 5",
                    "id": 164,
                    "launch_library_id": 188,
                    "name": "Falcon 9 Block 5",
                    "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                    "variant": "Block 5"
                },
                "id": 136
            },
            "slug": "falcon-9-block-5-turksat-5a",
            "status": {
                "abbrev": "TBC",
                "description": "Awaiting official confirmation - current date is known with some certainty.",
                "id": 8,
                "name": "To Be Confirmed"
            },
            "tbddate": true,
            "tbdtime": true,
            "url": "https://ll.thespacedevs.com/2.1.0/launch/d5d607b7-05ed-4142-8703-14b553c195e0/",
            "webcast_live": false,
            "window_end": "2021-01-05T05:29:00Z",
            "window_start": "2021-01-05T01:27:00Z"
        },
        {
            "failreason": "",
            "hashtag": null,
            "holdreason": "",
            "id": "f213a5df-579a-4682-8143-df228e463049",
            "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
            "infographic": null,
            "inhold": false,
            "launch_library_id": 1965,
            "launch_service_provider": {
                "id": 121,
                "name": "SpaceX",
                "type": "Commercial",
                "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
            },
            "mission": null,
            "name": "Falcon 9 Block 5 | Dedicated SSO Rideshare Mission 1",
            "net": "2021-01-14T00:00:00Z",
            "pad": {
                "agency_id": 121,
                "id": 80,
                "info_url": null,
                "latitude": "28.56194122",
                "location": {
                    "country_code": "USA",
                    "id": 12,
                    "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
                    "name": "Cape Canaveral, FL, USA",
                    "total_landing_count": 20,
                    "total_launch_count": 208,
                    "url": "https://ll.thespacedevs.com/2.1.0/location/12/"
                },
                "longitude": "-80.57735736",
                "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_80_20200803143323.jpg",
                "map_url": "http://maps.google.com/maps?q=28.56194122,-80.57735736",
                "name": "Space Launch Complex 40",
                "total_launch_count": 63,
                "url": "https://ll.thespacedevs.com/2.1.0/pad/80/",
                "wiki_url": "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_40"
            },
            "probability": -1,
            "program": [],
            "rocket": {
                "configuration": {
                    "family": "Falcon",
                    "full_name": "Falcon 9 Block 5",
                    "id": 164,
                    "launch_library_id": 188,
                    "name": "Falcon 9 Block 5",
                    "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                    "variant": "Block 5"
                },
                "id": 2518
            },
            "slug": "falcon-9-block-5-dedicated-sso-rideshare-mission-1",
            "status": {
                "abbrev": "TBD",
                "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
                "id": 2,
                "name": "To Be Determined"
            },
            "tbddate": true,
            "tbdtime": true,
            "url": "https://ll.thespacedevs.com/2.1.0/launch/f213a5df-579a-4682-8143-df228e463049/",
            "webcast_live": false,
            "window_end": "2021-01-14T00:00:00Z",
            "window_start": "2021-01-14T00:00:00Z"
        },
        {
            "failreason": "",
            "hashtag": null,
            "holdreason": "",
            "id": "edaf9a8d-d67c-4e0e-8452-a37b111581d5",
            "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
            "infographic": null,
            "inhold": false,
            "launch_library_id": 1417,
            "launch_service_provider": {
                "id": 121,
                "name": "SpaceX",
                "type": "Commercial",
                "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
            },
            "mission": {
                "description": "SXM-8 is a large high power broadcasting satellite for SiriusXM's digital audio radio service (DARS).\n\nSpace Systems/Loral (SS/L) got in July 2016 the contract to build the two satellites based on their SSL-1300 bus - SXM-7 and SXM-8. Both operate in the S-band spectrum. Each satellite will generate more than 20-kW of power and will have a large unfurlable antenna reflector, which enables broadcast to radios without the need for large dish-type antennas on the ground.\n\nSXM-8 is meant to replace the XM-4 satellite.",
                "id": 1045,
                "launch_designator": null,
                "launch_library_id": 1245,
                "name": "SXM-8",
                "orbit": null,
                "type": "Communications"
            },
            "name": "Falcon 9 Block 5 | Sirius SXM-8",
            "net": "2021-01-31T00:00:00Z",
            "pad": {
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
            },
            "probability": -1,
            "program": [],
            "rocket": {
                "configuration": {
                    "family": "Falcon",
                    "full_name": "Falcon 9 Block 5",
                    "id": 164,
                    "launch_library_id": 188,
                    "name": "Falcon 9 Block 5",
                    "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                    "variant": "Block 5"
                },
                "id": 139
            },
            "slug": "falcon-9-block-5-sirius-sxm-8",
            "status": {
                "abbrev": "TBD",
                "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
                "id": 2,
                "name": "To Be Determined"
            },
            "tbddate": true,
            "tbdtime": true,
            "url": "https://ll.thespacedevs.com/2.1.0/launch/edaf9a8d-d67c-4e0e-8452-a37b111581d5/",
            "webcast_live": false,
            "window_end": "2021-01-31T00:00:00Z",
            "window_start": "2021-01-31T00:00:00Z"
        },
        {
            "failreason": null,
            "hashtag": null,
            "holdreason": null,
            "id": "0098c032-73de-4c6f-8d73-5d68b9a12fdf",
            "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon2520heavy_image_20190224025007.jpeg",
            "infographic": null,
            "inhold": false,
            "launch_library_id": 1585,
            "launch_service_provider": {
                "id": 121,
                "name": "SpaceX",
                "type": "Commercial",
                "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
            },
            "mission": null,
            "name": "Falcon Heavy | USSF-52",
            "net": "2021-03-01T00:00:00Z",
            "pad": {
                "agency_id": null,
                "id": 87,
                "info_url": null,
                "latitude": "28.60822681",
                "location": {
                    "country_code": "USA",
                    "id": 27,
                    "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
                    "name": "Kennedy Space Center, FL, USA",
                    "total_landing_count": 0,
                    "total_launch_count": 182,
                    "url": "https://ll.thespacedevs.com/2.1.0/location/27/"
                },
                "longitude": "-80.60428186",
                "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_87_20200803143537.jpg",
                "map_url": "http://maps.google.com/maps?q=28.608+N,+80.604+W",
                "name": "Launch Complex 39A",
                "total_launch_count": 125,
                "url": "https://ll.thespacedevs.com/2.1.0/pad/87/",
                "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A"
            },
            "probability": -1,
            "program": [],
            "rocket": {
                "configuration": {
                    "family": "Falcon",
                    "full_name": "Falcon Heavy",
                    "id": 161,
                    "launch_library_id": 58,
                    "name": "Falcon Heavy",
                    "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/161/",
                    "variant": "Heavy"
                },
                "id": 162
            },
            "slug": "falcon-heavy-ussf-52",
            "status": {
                "abbrev": "TBD",
                "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
                "id": 2,
                "name": "To Be Determined"
            },
            "tbddate": false,
            "tbdtime": false,
            "url": "https://ll.thespacedevs.com/2.1.0/launch/0098c032-73de-4c6f-8d73-5d68b9a12fdf/",
            "webcast_live": false,
            "window_end": "2021-03-01T00:00:00Z",
            "window_start": "2021-03-01T00:00:00Z"
        },
        {
            "failreason": null,
            "hashtag": null,
            "holdreason": null,
            "id": "89a150ea-6e4b-489f-853c-3603ae684611",
            "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
            "infographic": null,
            "inhold": false,
            "launch_library_id": 2090,
            "launch_service_provider": {
                "id": 121,
                "name": "SpaceX",
                "type": "Commercial",
                "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
            },
            "mission": null,
            "name": "Falcon 9 Block 5 | Dragon CRS-2 SpX-22",
            "net": "2021-03-12T00:00:00Z",
            "pad": {
                "agency_id": null,
                "id": 87,
                "info_url": null,
                "latitude": "28.60822681",
                "location": {
                    "country_code": "USA",
                    "id": 27,
                    "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
                    "name": "Kennedy Space Center, FL, USA",
                    "total_landing_count": 0,
                    "total_launch_count": 182,
                    "url": "https://ll.thespacedevs.com/2.1.0/location/27/"
                },
                "longitude": "-80.60428186",
                "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_87_20200803143537.jpg",
                "map_url": "http://maps.google.com/maps?q=28.608+N,+80.604+W",
                "name": "Launch Complex 39A",
                "total_launch_count": 125,
                "url": "https://ll.thespacedevs.com/2.1.0/pad/87/",
                "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A"
            },
            "probability": -1,
            "program": [
                {
                    "agencies": [
                        {
                            "id": 44,
                            "name": "National Aeronautics and Space Administration",
                            "type": "Government",
                            "url": "https://ll.thespacedevs.com/2.1.0/agencies/44/"
                        },
                        {
                            "id": 257,
                            "name": "Northrop Grumman Innovation Systems",
                            "type": "Commercial",
                            "url": "https://ll.thespacedevs.com/2.1.0/agencies/257/"
                        },
                        {
                            "id": 1020,
                            "name": "Sierra Nevada Corporation",
                            "type": "Commercial",
                            "url": "https://ll.thespacedevs.com/2.1.0/agencies/1020/"
                        },
                        {
                            "id": 121,
                            "name": "SpaceX",
                            "type": "Commercial",
                            "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
                        }
                    ],
                    "description": "Commercial Resupply Services (CRS) are a series of flights awarded by NASA for the delivery of cargo and supplies to the International Space Station.The first CRS contracts were signed in 2008 and awarded $1.6 billion to SpaceX for twelve cargo Dragon and $1.9 billion to Orbital Sciences for eight Cygnus flights, covering deliveries to 2016. The Falcon 9 and Antares rockets were also developed under the CRS program to deliver cargo spacecraft to the ISS.",
                    "end_date": null,
                    "id": 11,
                    "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/commercial2520_program_20201129212219.png",
                    "info_url": null,
                    "name": "Commercial Resupply Services",
                    "start_date": "2008-12-23T00:00:00Z",
                    "url": "https://ll.thespacedevs.com/2.1.0/program/11/",
                    "wiki_url": "https://en.wikipedia.org/wiki/Commercial_Resupply_Services#Commercial_Resupply_Services"
                }
            ],
            "rocket": {
                "configuration": {
                    "family": "Falcon",
                    "full_name": "Falcon 9 Block 5",
                    "id": 164,
                    "launch_library_id": 188,
                    "name": "Falcon 9 Block 5",
                    "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                    "variant": "Block 5"
                },
                "id": 2746
            },
            "slug": "falcon-9-block-5-dragon-crs-2-spx-22",
            "status": {
                "abbrev": "TBD",
                "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
                "id": 2,
                "name": "To Be Determined"
            },
            "tbddate": true,
            "tbdtime": true,
            "url": "https://ll.thespacedevs.com/2.1.0/launch/89a150ea-6e4b-489f-853c-3603ae684611/",
            "webcast_live": false,
            "window_end": "2021-03-12T00:00:00Z",
            "window_start": "2021-03-12T00:00:00Z"
        },
        {
            "failreason": "",
            "hashtag": null,
            "holdreason": "",
            "id": "32dcb5ad-7609-4fc0-8094-768ee5c2ebe0",
            "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
            "infographic": null,
            "inhold": false,
            "launch_library_id": 2077,
            "launch_service_provider": {
                "id": 121,
                "name": "SpaceX",
                "type": "Commercial",
                "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
            },
            "mission": {
                "description": "SpaceX Crew-2 will be the second crewed operational flight of a Crew Dragon spacecraft, and the third overall crewed orbital flight. It will use the same Falcon 9 first stage as the Crew-1 mission and the same Crew Dragon capsule as the Demo-2 mission (Endeavour).",
                "id": 1137,
                "launch_designator": null,
                "launch_library_id": 1330,
                "name": "SpX USCV-2 (NASA Crew Flight 2)",
                "orbit": {
                    "abbrev": "LEO",
                    "id": 8,
                    "name": "Low Earth Orbit"
                },
                "type": "Human Exploration"
            },
            "name": "Falcon 9 Block 5 | SpX USCV-2 (NASA Crew Flight 2)",
            "net": "2021-03-30T00:00:00Z",
            "pad": {
                "agency_id": null,
                "id": 87,
                "info_url": null,
                "latitude": "28.60822681",
                "location": {
                    "country_code": "USA",
                    "id": 27,
                    "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
                    "name": "Kennedy Space Center, FL, USA",
                    "total_landing_count": 0,
                    "total_launch_count": 182,
                    "url": "https://ll.thespacedevs.com/2.1.0/location/27/"
                },
                "longitude": "-80.60428186",
                "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_87_20200803143537.jpg",
                "map_url": "http://maps.google.com/maps?q=28.608+N,+80.604+W",
                "name": "Launch Complex 39A",
                "total_launch_count": 125,
                "url": "https://ll.thespacedevs.com/2.1.0/pad/87/",
                "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A"
            },
            "probability": -1,
            "program": [
                {
                    "agencies": [
                        {
                            "id": 80,
                            "name": "Boeing",
                            "type": "Commercial",
                            "url": "https://ll.thespacedevs.com/2.1.0/agencies/80/"
                        },
                        {
                            "id": 44,
                            "name": "National Aeronautics and Space Administration",
                            "type": "Government",
                            "url": "https://ll.thespacedevs.com/2.1.0/agencies/44/"
                        },
                        {
                            "id": 121,
                            "name": "SpaceX",
                            "type": "Commercial",
                            "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
                        }
                    ],
                    "description": "The Commercial Crew Program (CCP) is a human spaceflight program operated by NASA, in association with American aerospace manufacturers Boeing and SpaceX. The program conducts rotations between the expeditions of the International Space Station program, transporting crews to and from the International Space Station (ISS) aboard Boeing Starliner and SpaceX Crew Dragon capsules, in the first crewed orbital spaceflights operated by private companies.",
                    "end_date": null,
                    "id": 5,
                    "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/commercial2520_program_20200820201209.png",
                    "info_url": "https://www.nasa.gov/exploration/commercial/crew/index.html",
                    "name": "Commercial Crew Program",
                    "start_date": "2011-04-18T00:00:00Z",
                    "url": "https://ll.thespacedevs.com/2.1.0/program/5/",
                    "wiki_url": "https://en.wikipedia.org/wiki/Commercial_Crew_Program"
                },
                {
                    "agencies": [
                        {
                            "id": 16,
                            "name": "Canadian Space Agency",
                            "type": "Government",
                            "url": "https://ll.thespacedevs.com/2.1.0/agencies/16/"
                        },
                        {
                            "id": 27,
                            "name": "European Space Agency",
                            "type": "Multinational",
                            "url": "https://ll.thespacedevs.com/2.1.0/agencies/27/"
                        },
                        {
                            "id": 37,
                            "name": "Japan Aerospace Exploration Agency",
                            "type": "Government",
                            "url": "https://ll.thespacedevs.com/2.1.0/agencies/37/"
                        },
                        {
                            "id": 44,
                            "name": "National Aeronautics and Space Administration",
                            "type": "Government",
                            "url": "https://ll.thespacedevs.com/2.1.0/agencies/44/"
                        },
                        {
                            "id": 63,
                            "name": "Russian Federal Space Agency (ROSCOSMOS)",
                            "type": "Government",
                            "url": "https://ll.thespacedevs.com/2.1.0/agencies/63/"
                        }
                    ],
                    "description": "The International Space Station programme is tied together by a complex set of legal, political and financial agreements between the sixteen nations involved in the project, governing ownership of the various components, rights to crewing and utilization, and responsibilities for crew rotation and resupply of the International Space Station. It was conceived in 1984 by President Ronald Reagan, during the Space Station Freedom project as it was originally called.",
                    "end_date": null,
                    "id": 17,
                    "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/international2_program_20201129184745.png",
                    "info_url": "https://www.nasa.gov/mission_pages/station/main/index.html",
                    "name": "International Space Station",
                    "start_date": "1998-11-20T06:40:00Z",
                    "url": "https://ll.thespacedevs.com/2.1.0/program/17/",
                    "wiki_url": "https://en.wikipedia.org/wiki/International_Space_Station_programme"
                }
            ],
            "rocket": {
                "configuration": {
                    "family": "Falcon",
                    "full_name": "Falcon 9 Block 5",
                    "id": 164,
                    "launch_library_id": 188,
                    "name": "Falcon 9 Block 5",
                    "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                    "variant": "Block 5"
                },
                "id": 2732
            },
            "slug": "falcon-9-block-5-spx-uscv-2-nasa-crew-flight-2",
            "status": {
                "abbrev": "TBD",
                "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
                "id": 2,
                "name": "To Be Determined"
            },
            "tbddate": true,
            "tbdtime": true,
            "url": "https://ll.thespacedevs.com/2.1.0/launch/32dcb5ad-7609-4fc0-8094-768ee5c2ebe0/",
            "webcast_live": false,
            "window_end": "2021-03-30T00:00:00Z",
            "window_start": "2021-03-30T00:00:00Z"
        },
        {
            "failreason": null,
            "hashtag": null,
            "holdreason": null,
            "id": "572dbb78-06f5-47dd-be8c-593967333d81",
            "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
            "infographic": null,
            "inhold": false,
            "launch_library_id": 1527,
            "launch_service_provider": {
                "id": 121,
                "name": "SpaceX",
                "type": "Commercial",
                "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
            },
            "mission": null,
            "name": "Falcon 9 Block 5 | GPS III SV06",
            "net": "2021-04-01T00:00:00Z",
            "pad": {
                "agency_id": 121,
                "id": 80,
                "info_url": null,
                "latitude": "28.56194122",
                "location": {
                    "country_code": "USA",
                    "id": 12,
                    "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
                    "name": "Cape Canaveral, FL, USA",
                    "total_landing_count": 20,
                    "total_launch_count": 208,
                    "url": "https://ll.thespacedevs.com/2.1.0/location/12/"
                },
                "longitude": "-80.57735736",
                "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_80_20200803143323.jpg",
                "map_url": "http://maps.google.com/maps?q=28.56194122,-80.57735736",
                "name": "Space Launch Complex 40",
                "total_launch_count": 63,
                "url": "https://ll.thespacedevs.com/2.1.0/pad/80/",
                "wiki_url": "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_40"
            },
            "probability": -1,
            "program": [],
            "rocket": {
                "configuration": {
                    "family": "Falcon",
                    "full_name": "Falcon 9 Block 5",
                    "id": 164,
                    "launch_library_id": 188,
                    "name": "Falcon 9 Block 5",
                    "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                    "variant": "Block 5"
                },
                "id": 174
            },
            "slug": "falcon-9-block-5-gps-iii-sv06",
            "status": {
                "abbrev": "TBD",
                "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
                "id": 2,
                "name": "To Be Determined"
            },
            "tbddate": true,
            "tbdtime": true,
            "url": "https://ll.thespacedevs.com/2.1.0/launch/572dbb78-06f5-47dd-be8c-593967333d81/",
            "webcast_live": false,
            "window_end": "2021-04-01T00:00:00Z",
            "window_start": "2021-04-01T00:00:00Z"
        },
        {
            "failreason": "",
            "hashtag": null,
            "holdreason": "",
            "id": "aa88b853-9e04-4a28-9433-d87799331b1b",
            "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon2520heavy_image_20190224025007.jpeg",
            "infographic": null,
            "inhold": false,
            "launch_library_id": 1695,
            "launch_service_provider": {
                "id": 121,
                "name": "SpaceX",
                "type": "Commercial",
                "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
            },
            "mission": null,
            "name": "Falcon Heavy | USSF-44",
            "net": "2021-05-01T00:00:00Z",
            "pad": {
                "agency_id": null,
                "id": 87,
                "info_url": null,
                "latitude": "28.60822681",
                "location": {
                    "country_code": "USA",
                    "id": 27,
                    "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
                    "name": "Kennedy Space Center, FL, USA",
                    "total_landing_count": 0,
                    "total_launch_count": 182,
                    "url": "https://ll.thespacedevs.com/2.1.0/location/27/"
                },
                "longitude": "-80.60428186",
                "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_87_20200803143537.jpg",
                "map_url": "http://maps.google.com/maps?q=28.608+N,+80.604+W",
                "name": "Launch Complex 39A",
                "total_launch_count": 125,
                "url": "https://ll.thespacedevs.com/2.1.0/pad/87/",
                "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A"
            },
            "probability": -1,
            "program": [],
            "rocket": {
                "configuration": {
                    "family": "Falcon",
                    "full_name": "Falcon Heavy",
                    "id": 161,
                    "launch_library_id": 58,
                    "name": "Falcon Heavy",
                    "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/161/",
                    "variant": "Heavy"
                },
                "id": 2220
            },
            "slug": "falcon-heavy-ussf-44",
            "status": {
                "abbrev": "TBD",
                "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
                "id": 2,
                "name": "To Be Determined"
            },
            "tbddate": true,
            "tbdtime": true,
            "url": "https://ll.thespacedevs.com/2.1.0/launch/aa88b853-9e04-4a28-9433-d87799331b1b/",
            "webcast_live": false,
            "window_end": "2021-05-01T00:00:00Z",
            "window_start": "2021-05-01T00:00:00Z"
        },
        {
            "failreason": null,
            "hashtag": null,
            "holdreason": null,
            "id": "78998f82-47ce-47b4-849c-2356fe592a13",
            "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg",
            "infographic": null,
            "inhold": false,
            "launch_library_id": 1966,
            "launch_service_provider": {
                "id": 121,
                "name": "SpaceX",
                "type": "Commercial",
                "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
            },
            "mission": null,
            "name": "Falcon 9 Block 5 | Dedicated SSO Rideshare Mission 2",
            "net": "2021-06-01T00:00:00Z",
            "pad": {
                "agency_id": 121,
                "id": 80,
                "info_url": null,
                "latitude": "28.56194122",
                "location": {
                    "country_code": "USA",
                    "id": 12,
                    "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
                    "name": "Cape Canaveral, FL, USA",
                    "total_landing_count": 20,
                    "total_launch_count": 208,
                    "url": "https://ll.thespacedevs.com/2.1.0/location/12/"
                },
                "longitude": "-80.57735736",
                "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_80_20200803143323.jpg",
                "map_url": "http://maps.google.com/maps?q=28.56194122,-80.57735736",
                "name": "Space Launch Complex 40",
                "total_launch_count": 63,
                "url": "https://ll.thespacedevs.com/2.1.0/pad/80/",
                "wiki_url": "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_40"
            },
            "probability": -1,
            "program": [],
            "rocket": {
                "configuration": {
                    "family": "Falcon",
                    "full_name": "Falcon 9 Block 5",
                    "id": 164,
                    "launch_library_id": 188,
                    "name": "Falcon 9 Block 5",
                    "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
                    "variant": "Block 5"
                },
                "id": 2520
            },
            "slug": "falcon-9-block-5-dedicated-sso-rideshare-mission-2",
            "status": {
                "abbrev": "TBD",
                "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
                "id": 2,
                "name": "To Be Determined"
            },
            "tbddate": true,
            "tbdtime": true,
            "url": "https://ll.thespacedevs.com/2.1.0/launch/78998f82-47ce-47b4-849c-2356fe592a13/",
            "webcast_live": false,
            "window_end": "2021-06-01T00:00:00Z",
            "window_start": "2021-06-01T00:00:00Z"
        },
        {
            "failreason": "",
            "hashtag": null,
            "holdreason": "",
            "id": "8b1067dd-81c6-4bc3-b0f1-45f78963716f",
            "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon2520heavy_image_20190224025007.jpeg",
            "infographic": null,
            "inhold": false,
            "launch_library_id": 1644,
            "launch_service_provider": {
                "id": 121,
                "name": "SpaceX",
                "type": "Commercial",
                "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/"
            },
            "mission": {
                "description": "The ViaSat-3 is a series of three Ka-band satellites is expected to provide vastly superior capabilities in terms of service speed and flexibility for a satellite platform. Each ViaSat-3 class satellite is expected to deliver more than 1-Terabit per second of network capacity, and to leverage high levels of flexibility to dynamically direct capacity to where customers are located.",
                "id": 699,
                "launch_designator": null,
                "launch_library_id": 883,
                "name": "ViaSat-3",
                "orbit": {
                    "abbrev": "GTO",
                    "id": 2,
                    "name": "Geostationary Transfer Orbit"
                },
                "type": "Communications"
            },
            "name": "Falcon Heavy | ViaSat-3 series satellite",
            "net": "2021-06-01T00:00:00Z",
            "pad": {
                "agency_id": null,
                "id": 87,
                "info_url": null,
                "latitude": "28.60822681",
                "location": {
                    "country_code": "USA",
                    "id": 27,
                    "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
                    "name": "Kennedy Space Center, FL, USA",
                    "total_landing_count": 0,
                    "total_launch_count": 182,
                    "url": "https://ll.thespacedevs.com/2.1.0/location/27/"
                },
                "longitude": "-80.60428186",
                "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_87_20200803143537.jpg",
                "map_url": "http://maps.google.com/maps?q=28.608+N,+80.604+W",
                "name": "Launch Complex 39A",
                "total_launch_count": 125,
                "url": "https://ll.thespacedevs.com/2.1.0/pad/87/",
                "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A"
            },
            "probability": -1,
            "program": [],
            "rocket": {
                "configuration": {
                    "family": "Falcon",
                    "full_name": "Falcon Heavy",
                    "id": 161,
                    "launch_library_id": 58,
                    "name": "Falcon Heavy",
                    "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/161/",
                    "variant": "Heavy"
                },
                "id": 2142
            },
            "slug": "falcon-heavy-viasat-3-series-satellite",
            "status": {
                "abbrev": "TBD",
                "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources.",
                "id": 2,
                "name": "To Be Determined"
            },
            "tbddate": false,
            "tbdtime": false,
            "url": "https://ll.thespacedevs.com/2.1.0/launch/8b1067dd-81c6-4bc3-b0f1-45f78963716f/",
            "webcast_live": false,
            "window_end": "2021-06-01T00:00:00Z",
            "window_start": "2021-06-01T00:00:00Z"
        }
    ]
}

"""#
