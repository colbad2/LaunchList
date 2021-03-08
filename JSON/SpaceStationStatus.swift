// Copyright © 2021 Bradford Holcombe. All rights reserved.

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

{
   "count": 25,
   "next": null,
   "previous": null,
   "results":
   [
      { "id": 1, "role": "Commander", "priority": 10 },
      { "id": 2, "role": "Pilot", "priority": 10 },
      { "id": 3, "role": "Flight Engineer", "priority": 10 },
      { "id": 4, "role": "Command Pilot", "priority": 10 },
      { "id": 5, "role": "Command Module Pilot", "priority": 10 },
      { "id": 6, "role": "Lunar Module Pilot", "priority": 10 },
      { "id": 7, "role": "Mission Specialist", "priority": 10 },
      { "id": 8, "role": "Payload Specialist", "priority": 10 },
      { "id": 9, "role": "Science Pilot", "priority": 10 },
      { "id": 10, "role": "Spaceflight Participant", "priority": 10 },
      { "id": 11, "role": "Research Cosmonaut", "priority": 10 },
      { "id": 12, "role": "Research Doctor", "priority": 10 },
      { "id": 13, "role": "Test Engineer", "priority": 10 },
      { "id": 14, "role": "Research Engineer", "priority": 10 },
      { "id": 16, "role": "Engineer", "priority": 10 },
      { "id": 17, "role": "Medical Doctor", "priority": 10 },
      { "id": 18, "role": "Docking Module Pilot", "priority": 10 },
      { "id": 19, "role": "Anthropomorphic Test Device", "priority": 10 },
      { "id": 20, "role": "Zero-G Indicator", "priority": 10 },
      { "id": 21, "role": "Space Traveller", "priority": 10 },
      { "id": 22, "role": "Orbital module astronaut", "priority": 10 },
      { "id": 23, "role": "Descent module monitor astronaut", "priority": 10 },
      { "id": 24, "role": "Spacecraft Commander", "priority": 10 },
      { "id": 25, "role": "Joint Operations Commander", "priority": 10 },
      { "id": 26, "role": "Flight Surgeon", "priority": 10 }
   ]
}
 */

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

/**
 Base class for all config pseudo-enums.
 */
public class BaseConfigs
{
   var knownConfigs: [IDNameJSON] = []
   var customConfigs: [IDNameJSON] = []
}
