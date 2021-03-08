// Copyright © 2021 Bradford Holcombe. All rights reserved.

// swiftlint:disable line_length
// swiftlint:disable identifier_name
// s wiftlint:disable file_length
// s wiftlint:disable type_body_length
// s wiftlint:disable function_body_length

/**
 Enum-like class for known space station statuses.
 */
public class SpaceStationStatus: BaseConfigs
{
   let ACTIVE: IDNameJSON = IDNameJSON( id: 1, name: "Active" )
   let DEORBITED: IDNameJSON = IDNameJSON( id: 2, name: "De-Orbited" )
   let ABANDONED: IDNameJSON = IDNameJSON( id: 3, name: "Abandoned" )

   override init()
   {
      super.init()
      knownConfigs.append( ACTIVE )
      knownConfigs.append( DEORBITED )
      knownConfigs.append( ABANDONED )
   }
}

/**
 Enum-like class for known agency types.

 From /config/agencytype/

 ### Example:
      {
         "count": 6,
         "next": null,
         "previous": null,
         "results":
         [
            { "id": 1, "name": "Government" },
            { "id": 2, "name": "Multinational" },
            { "id": 3, "name": "Commercial" },
            { "id": 4, "name": "Educational" },
            { "id": 5, "name": "Private" },
            { "id": 6, "name": "Unknown" }
         ]
      }
 */
public class AgencyType: BaseConfigs
{
   let GOVERNMENT: IDNameJSON = IDNameJSON( id: 1, name: "Government" )
   let MULTINATIONAL: IDNameJSON = IDNameJSON( id: 2, name: "Multinational" )
   let COMMERCIAL: IDNameJSON = IDNameJSON( id: 3, name: "Commercial" )
   let EDUCATIONAL: IDNameJSON = IDNameJSON( id: 4, name: "Educational" )
   let PRIVATE: IDNameJSON = IDNameJSON( id: 5, name: "Private" )
   let UNKNOWN: IDNameJSON = IDNameJSON( id: 6, name: "Unknown" )

   override init()
   {
      super.init()
      knownConfigs.append( GOVERNMENT )
      knownConfigs.append( MULTINATIONAL )
      knownConfigs.append( COMMERCIAL )
      knownConfigs.append( EDUCATIONAL )
      knownConfigs.append( PRIVATE )
      knownConfigs.append( UNKNOWN )
   }
}

/**
 /config/astronautrole/
 */
public class AstronautRoleEnum: BaseConfigs
{
   let COMMANDER: AstronautRoleJSON = AstronautRoleJSON( id: 1, role: "Commander" )
   let PILOT: AstronautRoleJSON = AstronautRoleJSON( id: 2, role: "Pilot" )
   let FLIGHT_ENGINEER: AstronautRoleJSON = AstronautRoleJSON( id: 3, role: "Flight Engineer" )
   let COMMAND_PILOT: AstronautRoleJSON = AstronautRoleJSON( id: 4, role: "Command Pilot" )
   let COMMAND_MODULE_PILOT: AstronautRoleJSON = AstronautRoleJSON( id: 5, role: "Command Module Pilot" )
   let LUNAR_MODULE_PILOT: AstronautRoleJSON = AstronautRoleJSON( id: 6, role: "Lunar Module Pilot" )
   let MISSION_SPECIALIST: AstronautRoleJSON = AstronautRoleJSON( id: 7, role: "Mission Specialist" )
   let PAYLOAD_SPECIALIST: AstronautRoleJSON = AstronautRoleJSON( id: 8, role: "Payload Specialist" )
   let SCIENCE_PILOT: AstronautRoleJSON = AstronautRoleJSON( id: 9, role: "Science Pilot" )
   let SPACEFLIGHT_PARTICIPANT: AstronautRoleJSON = AstronautRoleJSON( id: 10, role: "Spaceflight Participant" )
   let RESEARCH_COSMONAUT: AstronautRoleJSON = AstronautRoleJSON( id: 11, role: "Research Cosmonaut" )
   let RESEARCH_DOCTOR: AstronautRoleJSON = AstronautRoleJSON( id: 12, role: "Research Doctor" )
   let TEST_ENGINEER: AstronautRoleJSON = AstronautRoleJSON( id: 13, role: "Test Engineer" )
   let RESEARCH_ENGINEER: AstronautRoleJSON = AstronautRoleJSON( id: 14, role: "Research Engineer" )
   let ENGINEER: AstronautRoleJSON = AstronautRoleJSON( id: 16, role: "Engineer" )
   let MEDICAL_DOCTOR: AstronautRoleJSON = AstronautRoleJSON( id: 17, role: "Medical Doctor" )
   let DOCKING_MODULE_PILOT: AstronautRoleJSON = AstronautRoleJSON( id: 18, role: "Docking Module Pilot" )
   let ANTHROPOMORPHIC_TEST_DEVICE: AstronautRoleJSON = AstronautRoleJSON( id: 19, role: "Anthropomorphic Test Device" )
   let ZERO_G_INDICATOR: AstronautRoleJSON = AstronautRoleJSON( id: 20, role: "Zero-G Indicator" )
   let SPACE_TRAVELLER: AstronautRoleJSON = AstronautRoleJSON( id: 21, role: "Space Traveller" )
   let ORBITAL_MONITOR_ASTRONAUT: AstronautRoleJSON = AstronautRoleJSON( id: 22, role: "Orbital module astronaut" )
   let DESCENT_MODULE_MONITOR_ASTRONAUT: AstronautRoleJSON = AstronautRoleJSON( id: 23, role: "Descent module monitor astronaut" )
   let SPACECRAFT_COMMANDER: AstronautRoleJSON = AstronautRoleJSON( id: 24, role: "Spacecraft Commander" )
   let JOINT_OPS_COMMANDER: AstronautRoleJSON = AstronautRoleJSON( id: 25, role: "Joint Operations Commander" )
   let FLIGHT_SURGEON: AstronautRoleJSON = AstronautRoleJSON( id: 26, role: "Flight Surgeon" )

   override init()
   {
      super.init()
      knownConfigs.append( COMMANDER )
      knownConfigs.append( ORBITAL_MONITOR_ASTRONAUT )
      knownConfigs.append( DESCENT_MODULE_MONITOR_ASTRONAUT )
      knownConfigs.append( SPACECRAFT_COMMANDER )
      knownConfigs.append( JOINT_OPS_COMMANDER )
      knownConfigs.append( FLIGHT_SURGEON )
   }
}

/**
 /config/astronautstatus/

{
   "count": 9,
   "next": null,
   "previous": null,
   "results":
   [
      { "id": 1, "name": "Active" },
      { "id": 2, "name": "Retired" },
      { "id": 3, "name": "In-Training" },
      { "id": 4, "name": "Lost In Flight" },
      { "id": 5, "name": "Lost In Training" },
      { "id": 6, "name": "Died While In Active Service" },
      { "id": 7, "name": "Dismissed" },
      { "id": 8, "name": "Resigned during Training" },
      { "id": 11, "name": "Deceased" }
   ]
}
 */

/**
 /config/astronauttype/

   {
      "count": 7,
      "next": null,
      "previous": null,
      "results":
      [
         { "id": 1, "name": "Unknown" },
         { "id": 2, "name": "Government" },
         { "id": 3, "name": "Private" },
         { "id": 4, "name": "Non-Astronaut Passenger" },
         { "id": 5, "name": "Payload Specialist" },
         { "id": 6, "name": "Non-Human" },
         { "id": 7, "name": "Commercial" }
      ]
   }
 */

/*

 /config/dockinglocation/

   {
      "count": 28,
      "next": null,
      "previous": null,
      "results":
      [
         { "id": 1, "name": "Unity nadir" },
         { "id": 2, "name": "Zvezda aft" },
         { "id": 3, "name": "Poisk zenith" },
         { "id": 4, "name": "Forward" },
         { "id": 5, "name": "Core forward" },
         { "id": 6, "name": "Kvant-1" },
         { "id": 7, "name": "Mir-Progress 27" },
         { "id": 8, "name": "Kvant-2" },
         { "id": 9, "name": "Core aft" },
         { "id": 10, "name": "Kristall module" },
         { "id": 11, "name": "SO starboard" },
         { "id": 12, "name": "Node 2 forward" },
         { "id": 13, "name": "Rassvet nadir" },
         { "id": 14, "name": "Zarya forward" },
         { "id": 15, "name": "Unity forward" },
         { "id": 16, "name": "Zvezda" },
         { "id": 17, "name": "Destiny forward" },
         { "id": 18, "name": "Pirs nadir" },
         { "id": 19, "name": "Harmony forward" },
         { "id": 20, "name": "Zarya nadir" },
         { "id": 21, "name": "Harmony nadir" },
         { "id": 22, "name": "Forward" },
         { "id": 25, "name": "Forward" },
         { "id": 26, "name": "Forward" },
         { "id": 27, "name": "Forward" },
         { "id": 28, "name": "Forward" },
         { "id": 29, "name": "Core aft" },
         { "id": 30, "name": "Harmony zenith" }
      ]
   }
 */

/*
 /config/eventtype/

{
   "count": 25,
   "next": null,
   "previous": null,
   "results":
   [
      { "id": 1, "name": "Unknown" },
      { "id": 2, "name": "Docking" },
      { "id": 3, "name": "EVA" },
      { "id": 4, "name": "Berthing" },
      { "id": 5, "name": "Static Fire" },
      { "id": 6, "name": "Spacecraft Event" },
      { "id": 7, "name": "Moon Landing" },
      { "id": 10, "name": "Abort Test" },
      { "id": 8, "name": "Undocking" },
      { "id": 11, "name": "Celestial Event" },
      { "id": 14, "name": "Test Flight" },
      { "id": 9, "name": "Landing" },
      { "id": 20, "name": "Press Event" },
      { "id": 12, "name": "Hatch Opening" },
      { "id": 13, "name": "Release" },
      { "id": 15, "name": "Change of Command" },
      { "id": 16, "name": "Orbital Insertion" },
      { "id": 17, "name": "Farewell Ceremony" },
      { "id": 18, "name": "Rehearsal" },
      { "id": 19, "name": "Ambient Pressure Test" },
      { "id": 21, "name": "Cryoproof Test" },
      { "id": 22, "name": "Wet Dress Rehearsal" },
      { "id": 23, "name": "Flyby" },
      { "id": 24, "name": "Launch" },
      { "id": 25, "name": "Relocation" }
   ]
}
 */

/*
 /config/firststagetype/

 {
 "count": 2,
 "next": null,
 "previous": null,
 "results": [
 { "id": 2, "name": "Strap-On Booster" },
 { "id": 1, "name": "Core" }
 ]
 }
 */

/*
 /config/landinglocation/

 {
 "count": 12,
 "next": null,
 "previous": null,
 "results": [
 {
 "id": 2,
 "name": "Landing Zone 3",
 "abbrev": "LZ-3",
 "description": null,
 "location": null,
 "successful_landings": 0
 },
 {
 "id": 1,
 "name": "Of Course I Still Love You",
 "abbrev": "OCISLY",
 "description": "The second ASDS barge, Of Course I Still Love You (OCISLY) services launches in the Atlantic Ocean and was the site of the first landing of a SpaceX Falcon 9 first stage during CRS-8, the launch of a Dragon spacecraft to the International Space Station.",
 "location": null,
 "successful_landings": 38
 },
 {
 "id": 11,
 "name": "Corn Ranch Landing Pad, West Texas",
 "abbrev": "CR",
 "description": "New Shepard landing site.",
 "location": null,
 "successful_landings": 13
 },
 {
 "id": 6,
 "name": "Atlantic",
 "abbrev": "ATL",
 "description": "The Atlantic ocean on the East coast of the United States is a common landing area for expended boosters.",
 "location": null,
 "successful_landings": 3
 },
 {
 "id": 12,
 "name": "Unknown",
 "abbrev": "N/A",
 "description": null,
 "location": null,
 "successful_landings": 0
 },
 {
 "id": 13,
 "name": "Spaceport America Area",
 "abbrev": "SAA",
 "description": "Area around Spaceport America",
 "location": null,
 "successful_landings": 3
 },
 {
 "id": 14,
 "name": "SpaceX Starship Landing Pad",
 "abbrev": "LZ",
 "description": "This is the landing pad used for early Starship development flights.",
 "location": {
 "id": 143,
 "url": "https://ll.thespacedevs.com/2.2.0/location/143/",
 "name": "SpaceX Space Launch Facility, TX, USA",
 "country_code": "USA",
 "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_143_20200803142438.jpg",
 "total_launch_count": 7,
 "total_landing_count": 7
 },
 "successful_landings": 4
 },
 {
 "id": 15,
 "name": "Pacific",
 "abbrev": "PAC",
 "description": "Pacific Ocean off the coast of Mahia Peninsula, New Zealand.",
 "location": {
 "id": 10,
 "url": "https://ll.thespacedevs.com/2.2.0/location/10/",
 "name": "Onenui Station, Mahia Peninsula, New Zealand",
 "country_code": "NZL",
 "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_10_20200803142509.jpg",
 "total_launch_count": 18,
 "total_landing_count": 1
 },
 "successful_landings": 1
 },
 {
 "id": 4,
 "name": "Landing Zone 1",
 "abbrev": "LZ-1",
 "description": "LZ-1 Pad located at Cape Canaveral Space Force Station at the previous LC-13",
 "location": {
 "id": 12,
 "url": "https://ll.thespacedevs.com/2.2.0/location/12/",
 "name": "Cape Canaveral, FL, USA",
 "country_code": "USA",
 "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
 "total_launch_count": 212,
 "total_landing_count": 20
 },
 "successful_landings": 16
 },
 {
 "id": 5,
 "name": "Landing Zone 2",
 "abbrev": "LZ-2",
 "description": "LZ-2 Pad located at Cape Canaveral Space Force Station at the previous LC-13. Directly next to LZ-1",
 "location": {
 "id": 12,
 "url": "https://ll.thespacedevs.com/2.2.0/location/12/",
 "name": "Cape Canaveral, FL, USA",
 "country_code": "USA",
 "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
 "total_launch_count": 212,
 "total_landing_count": 20
 },
 "successful_landings": 3
 },
 {
 "id": 7,
 "name": "Landing Zone 4",
 "abbrev": "LZ-4",
 "description": "LZ at Vandenberg",
 "location": {
 "id": 11,
 "url": "https://ll.thespacedevs.com/2.2.0/location/11/",
 "name": "Vandenberg AFB, CA, USA",
 "country_code": "USA",
 "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_11_20200803142416.jpg",
 "total_launch_count": 83,
 "total_landing_count": 3
 },
 "successful_landings": 3
 },
 {
 "id": 3,
 "name": "Just Read the Instructions",
 "abbrev": "JRTI",
 "description": "The third ASDS barge, Just Read the Instructions (JRTI) is currently used to recover Falcon 9 boosters in the Altantic Ocean. It used to service launches in the Pacific Ocean for launches from Vandenberg AFB. It was first put to use in January of 2016 to attempt to recover a Falcon 9 first-stage booster from the Jason-3 mission which successfully landed but subsequently fell over and experienced an Rapid Unscheduled Disassembly (RUD).",
 "location": null,
 "successful_landings": 15
 }
 ]
 }
 */

/*
 /config/launchstatus/

 {
 "count": 8,
 "next": null,
 "previous": null,
 "results": [
 {
 "id": 2,
 "name": "To Be Determined",
 "abbrev": "TBD",
 "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources."
 },
 {
 "id": 8,
 "name": "To Be Confirmed",
 "abbrev": "TBC",
 "description": "Awaiting official confirmation - current date is known with some certainty."
 },
 {
 "id": 1,
 "name": "Go for Launch",
 "abbrev": "Go",
 "description": "Current T-0 confirmed by official or reliable sources."
 },
 {
 "id": 3,
 "name": "Launch Successful",
 "abbrev": "Success",
 "description": "The launch vehicle successfully inserted its payload(s) into the target orbit(s)."
 },
 {
 "id": 4,
 "name": "Launch Failure",
 "abbrev": "Failure",
 "description": "Either the launch vehicle did not reach orbit, or the payload(s) failed to separate."
 },
 {
 "id": 5, "name": "On Hold", "abbrev": "Hold",
 "description": "The countdown has been paused, but the launch can still happen within the launch window."
 },
 {
 "id": 6,
 "name": "Launch in Flight",
 "abbrev": "In Flight",
 "description": "The lauch vehicle has lifted off from the launchpad."
 },
 {
 "id": 7,
 "name": "Launch was a Partial Failure",
 "abbrev": "Partial Failure",
 "description": "Either the launch vehicle reached orbit but did not deliver its payload in the targeted orbit, or an exceptional event made it impossible to consider the mission a success."
 }
 ]
 }
 */

/**
 Base class for all config pseudo-enums.
 */
public class BaseConfigs
{
   var knownConfigs: [JSONElement] = []
   var customConfigs: [JSONElement] = []
}
