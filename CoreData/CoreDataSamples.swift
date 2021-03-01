// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/*
 These correspond to the JSON samples in Samples.swift. You would ahve to load those into a CoreData context
 before using these.
 */

/**
 Gets an example Core Data entity `Agency` for use in previews.

 - returns: `Agency` entity suitable for previewing
 */
public func getSampleAgencyEntity() -> Agency?
{
   return getEntityByID( entityID: 63,
                         context: PersistenceController.preview.container.viewContext,
                         entityName: AGENCY_ENTITY_NAME ) as? Agency
}

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
 Gets an example Core Data entity `LiveStream` for use in previews.

 - returns: `LiveStream` entity suitable for previewing
 */
public func getSampleLiveStreamEntity() -> LiveStream?
{
   let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
   return getLiveStreamByURL( liveStreamURL: "https://www.youtube.com/watch?v=Ky5l9ZxsG9M", context: context )
}

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
 Gets an example Core Data entity `SpaceStation` for use in previews.

 - returns: `SpaceStation` entity suitable for previewing
 */
public func getSampleSpaceStationEntity() -> SpaceStation?
{
   return getEntityByID( entityID: 4,
                         context: PersistenceController.preview.container.viewContext,
                         entityName: SPACESTATION_ENTITY_NAME ) as? SpaceStation
}
