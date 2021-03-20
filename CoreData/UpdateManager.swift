// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

/**
 Update messages manager.
 */
public class LogManager
{
   static var shared: LogManager = LogManager()

   var reports: [String] = []

   func report( _ reportString: String )
   {
      reports.append( reportString )
   }
}

class DatabaseStats
{
   var agencyCount: Int = 0
   var astronautCount: Int = 0

   func updateStats( context: NSManagedObjectContext )
   {
      agencyCount = getRecordsCount( entityName: AGENCY_ENTITY_NAME, context: context )
      astronautCount = getRecordsCount( entityName: ASTRONAUT_ENTITY_NAME, context: context )
   }

   func totalRecordCount() -> Int
   {
      agencyCount + astronautCount
   }
}

/**
 Central point for updating the CoreData context from the API.

 The API has a call limit of 100 calls per day.

 We reserve calls for days on which a launch is scheduled (to update launch info), and some for manual updates.
 The rest of the calls can be used to update records, or fill in details.
 */
public class UpdateManger
{
   var context: NSManagedObjectContext
   var databaseStats: DatabaseStats

   init( context: NSManagedObjectContext )
   {
      self.context = context
      databaseStats = DatabaseStats()
      databaseStats.updateStats( context: context )
   }

   // agency list (< 300)
   // astronaut list (< 700)
   // docking list (< 300)
   // event
   // expedition
   // launch
   // launcher
   // location
   // pad
   // program
   // spacecraft
   // spacecraft flight
   // spacestation

   // starship dashboard
   // updates

   /**
    Start the full update process.
    */
   public func update()
   {
      // create update call list
      // execute each update
   }

   func updateAgencyList()
   {
      APIManager.shared.agencyList().forEach { _ = fetchAgency( agency: $0, context: context ) }
      LogManager.shared.report( "Fetched complete agency list" )
   }

   func updateAgency( id: Int64 )
   {
      guard let json: AgencyJSON = APIManager.shared.agency( withID: id ) else { return }
      _ = fetchAgency( agency: json, context: context )
      LogManager.shared.report( "Fetched agency \(json.id ?? -1) \(json.name ?? "{missing name}")" )
   }

   func updateAstronautList()
   {
      APIManager.shared.astronautList().forEach { _ = fetchAstronaut( astronaut: $0, context: context ) }
      LogManager.shared.report( "Fetched complete astronaut list" )
   }

   func updateAstronaut( id: Int64 )
   {
      guard let json: AstronautJSON = APIManager.shared.astronaut( withID: id ) else { return }
      _ = fetchAstronaut( astronaut: json, context: context )
      LogManager.shared.report( "Fetched astronaut \(json.id ?? -1) \(json.name ?? "{missing name}")" )
   }

   // No CD representation right now
//   func updateStarshipDashboard()
//   {
//      // let dashboard: StarshipListJSON = APIManager.shared.starshipDashboard()
//   }

   func updateDockingEventList()
   {
      APIManager.shared.dockingEventList().forEach { _ = fetchDockingEvent( dockingEvent: $0, context: context ) }
      LogManager.shared.report( "Fetched complete docking event list" )
   }

   func updateDockingEvent( id: Int64 )
   {
      guard let json: DockingJSON = APIManager.shared.dockingEvent( withID: id ) else { return }
      _ = fetchDockingEvent( dockingEvent: json, context: context )
      LogManager.shared.report( "Fetched docking event \(json.id ?? -1) \(json.docking ?? "{missing name}")" )
   }

   func updateEventList()
   {
      APIManager.shared.eventList().forEach { _ = fetchEvent( event: $0, context: context ) }
      LogManager.shared.report( "Fetched complete event list" )
   }

   func updateEvent( id: Int64 )
   {
      guard let json: EventJSON = APIManager.shared.event( withID: id ) else { return }
      _ = fetchEvent( event: json, context: context )
      LogManager.shared.report( "Fetched event \(json.id ?? -1) \(json.name ?? "{missing name}")" )
   }

   func updateExpeditionList()
   {
      APIManager.shared.expeditionList().forEach { _ = fetchExpedition( expedition: $0, context: context ) }
      LogManager.shared.report( "Fetched complete expedition list" )
   }

   func updateExpedition( id: Int64 )
   {
      guard let json: ExpeditionJSON = APIManager.shared.expedition( withID: id ) else { return }
      _ = fetchExpedition( expedition: json, context: context )
      LogManager.shared.report( "Fetched expedition \(json.id ?? -1) \(json.name ?? "{missing name}")" )
   }

   func updateLaunchList()
   {
      APIManager.shared.launchList().forEach { _ = fetchLaunch( launch: $0, context: context ) }
      LogManager.shared.report( "Fetched complete launch list" )
   }

   func updateLaunch( id: Int64 )
   {
      guard let json: LaunchJSON = APIManager.shared.launch( withID: id ) else { return }
      _ = fetchLaunch( launch: json, context: context )
      LogManager.shared.report( "Fetched launch \(json.id ?? "{missing ID}") \(json.name ?? "{missing name}")" )
   }

   func updateLauncherList()
   {
      APIManager.shared.launcherList().forEach { _ = fetchLauncher( launcher: $0, context: context ) }
      LogManager.shared.report( "Fetched complete launcher list" )
   }

   func updateLauncher( id: Int64 )
   {
      guard let json: LauncherJSON = APIManager.shared.launcher( withID: id ) else { return }
      _ = fetchLauncher( launcher: json, context: context )
      LogManager.shared.report( "Fetched launcher \(json.id ?? -1) \(json.launcherConfig?.name ?? "{missing name}")" )
   }

   func updateLocationList()
   {
      APIManager.shared.locationList().forEach { _ = fetchLocation( location: $0, context: context ) }
      LogManager.shared.report( "Fetched complete location list" )
   }

   func updateLocation( id: Int64 )
   {
      guard let json: LocationJSON = APIManager.shared.location( withID: id ) else { return }
      _ = fetchLocation( location: json, context: context )
      LogManager.shared.report( "Fetched location \(json.id ?? -1) \(json.name ?? "{missing name}")" )
   }

   func updatePadList()
   {
      APIManager.shared.padList().forEach { _ = fetchPad( pad: $0, context: context ) }
      LogManager.shared.report( "Fetched complete pad list" )
   }

   func updatePad( id: Int64 )
   {
      guard let json: PadJSON = APIManager.shared.pad( withID: id ) else { return }
      _ = fetchPad( pad: json, context: context )
      LogManager.shared.report( "Fetched pad \(json.id ?? -1) \(json.name ?? "{missing name}")" )
   }

   func updateProgramList()
   {
      APIManager.shared.programList().forEach { _ = fetchProgram( program: $0, context: context ) }
      LogManager.shared.report( "Fetched complete program list" )
   }

   func updateProgram( id: Int64 )
   {
      guard let json: ProgramJSON = APIManager.shared.program( withID: id ) else { return }
      _ = fetchProgram( program: json, context: context )
      LogManager.shared.report( "Fetched program \(json.id ?? -1) \(json.name ?? "{missing name}")" )
   }

   func updateSpacecraftList()
   {
      APIManager.shared.spacecraftList().forEach { _ = fetchSpacecraft( spacecraft: $0, context: context ) }
      LogManager.shared.report( "Fetched complete spacecraft list" )
   }

   func updateSpacecraft( id: Int64 )
   {
      guard let json: SpacecraftJSON = APIManager.shared.spacecraft( withID: id ) else { return }
      _ = fetchSpacecraft( spacecraft: json, context: context )
      LogManager.shared.report( "Fetched spacecraft \(json.id ?? -1) \(json.name ?? "{missing name}")" )
   }

   func updateSpacecraftFlightList()
   {
      APIManager.shared.spacecraftFlightList().forEach { _ = fetchSpacecraftFlight( flight: $0, context: context ) }
      LogManager.shared.report( "Fetched complete spacecraft flight list" )
   }

   func updateSpacecraftFlight( id: Int64 )
   {
      guard let json: SpacecraftFlightJSON = APIManager.shared.spacecraftFlight( withID: id ) else { return }
      _ = fetchSpacecraftFlight( flight: json, context: context )
      LogManager.shared.report( "Fetched spacecraft flight \(json.id ?? -1) \(json.destination ?? "{missing destination}")" )
   }

   func updateSpaceStationList()
   {
      APIManager.shared.spaceStationList().forEach { _ = fetchSpaceStation( spaceStation: $0, context: context ) }
      LogManager.shared.report( "Fetched complete space station list" )
   }

   func updateSpaceStation( id: Int64 )
   {
      guard let json: SpaceStationJSON = APIManager.shared.spaceStation( withID: id ) else { return }
      _ = fetchSpaceStation( spaceStation: json, context: context )
      LogManager.shared.report( "Fetched space station \(json.id ?? -1) \(json.name ?? "{missing destination}")" )
   }

   // No CD representation right now
//   func updateUpdateList()
//   {
//      APIManager.shared.updateList().forEach { _ = fetchUpdate( update: $0, context: context ) }
//      LogManager.shared.report( "Fetched complete update list" )
//   }
//
//   func updateUpdate( id: Int64 )
//   {
//      guard let json: UpdateJSON = APIManager.shared.update( withID: id ) else { return }
//      _ = fetchUpdate( update: json, context: context )
//      LogManager.shared.report( "Fetched update \(json.id ?? -1) \(json.name ?? "{missing destination}")" )
//   }
}
