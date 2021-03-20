// Copyright © 2021 Bradford Holcombe. All rights reserved.

import XCTest

// s wiftlint:disable function_parameter_count
// s wiftlint:disable function_default_parameter_at_end

// swiftlint:disable line_length
// s wiftlint:disable file_length
// s wiftlint:disable type_body_length
// s wiftlint:disable function_body_length

func checkPad( pad: PadJSON?, padID: Int64, agencyID: Int64? = nil, infoURL: String? = nil, lat: String? = nil, lon: String? = nil,
               mapImage: String? = nil, mapURL: String? = nil, name: String? = nil, totalLaunchCount: Int64? = nil,
               url: String? = nil, wikiURL: String? = nil )
{
   XCTAssertNotNil( pad )
   XCTAssertEqual( pad?.agencyID, agencyID )
   XCTAssertEqual( pad?.id, padID )
   XCTAssertEqual( pad?.infoURL, infoURL )
   XCTAssertEqual( pad?.latitude, lat )
   XCTAssertEqual( pad?.longitude, lon )
   XCTAssertEqual( pad?.mapImage, mapImage )
   XCTAssertEqual( pad?.mapURL, mapURL )
   XCTAssertEqual( pad?.name, name )
   XCTAssertEqual( pad?.totalLaunchCount, totalLaunchCount )
   XCTAssertEqual( pad?.url, url )
   XCTAssertEqual( pad?.wikiURL, wikiURL )
}

func checkLocation( location: LocationJSON?, locationID: Int64, countryCode: String? = nil, mapImage: String? = nil,
                    name: String? = nil, landingCount: Int64? = nil, launchCount: Int64? = nil, url: String? = nil )
{
   XCTAssertNotNil( location )
   XCTAssertEqual( location?.countryCode, countryCode )
   XCTAssertEqual( location?.id, locationID )
   XCTAssertEqual( location?.mapImage, mapImage )
   XCTAssertEqual( location?.name, name )
   XCTAssertEqual( location?.totalLandingCount, landingCount )
   XCTAssertEqual( location?.totalLaunchCount, launchCount )
   XCTAssertEqual( location?.url, url )
}

func checkMission( mission: MissionJSON?, missionID: Int64, description: String? = nil, designator: String? = nil,
                   libraryID: Int64? = nil, name: String? = nil, type: String? = nil )
{
   XCTAssertNotNil( mission )
   XCTAssertEqual( mission?.description, description )
   XCTAssertEqual( mission?.id, missionID )
   XCTAssertEqual( mission?.launchDesignator, designator )
   XCTAssertEqual( mission?.launchLibraryID, libraryID )
   XCTAssertEqual( mission?.name, name )
   XCTAssertEqual( mission?.type, type )
   // check orbit
}

func checkStatus( status: StatusJSON?, abbreviation: String? = nil, description: String? = nil, statusID: Int64? = nil, name: String? = nil )
{
   XCTAssertNotNil( status )
   XCTAssertEqual( status?.abbreviation, abbreviation )
   XCTAssertEqual( status?.description, description )
   XCTAssertEqual( status?.id, statusID )
   XCTAssertEqual( status?.name, name )
}

func checkAgency( agency: AgencyJSON?, agencyID: Int64, name: String? = nil, featured: Bool? = nil, type: String? = nil, url: String? = nil,
                  countryCode: String? = nil, abbreviation: String? = nil, agencyDescription: String? = nil,
                  administrator: String? = nil, foundingYear: String? = nil, launchers: String? = nil,
                  spacecraft: String? = nil, parent: String? = nil,
                  imageURL: String? = nil, infoURL: String? = nil, wikiURL: String? = nil, logoURL: String? = nil,
                  nationURL: String? = nil, totalLaunchCount: Int64? = nil, successfulLaunches: Int64? = nil,
                  consecutiveSuccessfulLaunches: Int64? = nil, failedLaunches: Int64? = nil, pendingLaunches: Int64? = nil,
                  successfulLandings: Int64? = nil, failedLandings: Int64? = nil, attemptedLandings: Int64? = nil,
                  consecutiveSuccessfulLandings: Int64? = nil )
{
   XCTAssertNotNil( agency )
   XCTAssertEqual( agency?.id, agencyID )
   XCTAssertEqual( agency?.name, name )
   XCTAssertEqual( agency?.featured, featured )
   XCTAssertEqual( agency?.type, type )
   XCTAssertEqual( agency?.url, url )
   XCTAssertEqual( agency?.countryCode, countryCode )
   XCTAssertEqual( agency?.abbreviation, abbreviation )
   XCTAssertEqual( agency?.agencyDescription, agencyDescription )
   XCTAssertEqual( agency?.administrator, administrator )
   XCTAssertEqual( agency?.foundingYear, foundingYear )
   XCTAssertEqual( agency?.launchers, launchers )
   XCTAssertEqual( agency?.spacecraft, spacecraft )
   XCTAssertEqual( agency?.parent, parent )
   XCTAssertEqual( agency?.imageURL, imageURL )
   XCTAssertEqual( agency?.infoURL, infoURL )
   XCTAssertEqual( agency?.wikiURL, wikiURL )
   XCTAssertEqual( agency?.logoURL, logoURL )
   XCTAssertEqual( agency?.nationURL, nationURL )
   XCTAssertEqual( agency?.totalLaunchCount, totalLaunchCount )
   XCTAssertEqual( agency?.successfulLaunches, successfulLaunches )
   XCTAssertEqual( agency?.consecutiveSuccessfulLaunches, consecutiveSuccessfulLaunches )
   XCTAssertEqual( agency?.failedLaunches, failedLaunches )
   XCTAssertEqual( agency?.pendingLaunches, pendingLaunches )
   XCTAssertEqual( agency?.successfulLandings, successfulLandings )
   XCTAssertEqual( agency?.failedLandings, failedLandings )
   XCTAssertEqual( agency?.attemptedLandings, attemptedLandings )
   XCTAssertEqual( agency?.consecutiveSuccessfulLandings, consecutiveSuccessfulLandings )
}

func checkProgram( program: ProgramJSON?, programID: Int64, description: String? = nil, endDate: String? = nil,
                   imageURL: String? = nil, infoURL: String? = nil, name: String? = nil,
                   startDate: String? = nil, url: String? = nil, wikiURL: String? = nil )
{
   XCTAssertNotNil( program )
   XCTAssertEqual( program?.id, programID )
   XCTAssertEqual( program?.description, description )
   XCTAssertEqual( program?.endDate, endDate )
   XCTAssertEqual( program?.imageURL, imageURL )
   XCTAssertEqual( program?.infoURL, infoURL )
   XCTAssertEqual( program?.name, name )
   XCTAssertEqual( program?.startDate, startDate )
   XCTAssertEqual( program?.url, url )
   XCTAssertEqual( program?.wikiURL, wikiURL )
}

func checkLaunch( launch: LaunchJSON?, launchID: String, failReason: String? = nil, hashtag: String? = nil,
                  holdReason: String? = nil, image: String? = nil, infographic: String? = nil, inHold: Bool? = nil,
                  libraryID: Int64? = nil, name: String? = nil, net: String? = nil, probability: Int64? = nil, slug: String? = nil, tbdDate: Bool? = nil,
                  tbdTime: Bool? = nil, url: String? = nil, webcastLive: Bool? = nil, windowEnd: String? = nil, windowStart: String? = nil, lastUpdated: String? = nil )
{
   XCTAssertNotNil( launch )
   XCTAssertEqual( launch?.failReason, failReason )
   XCTAssertEqual( launch?.hashtag, hashtag )
   XCTAssertEqual( launch?.holdReason, holdReason )
   XCTAssertEqual( launch?.id, launchID )
   XCTAssertEqual( launch?.image, image )
   XCTAssertEqual( launch?.infographic, infographic )
   XCTAssertEqual( launch?.inHold, inHold )
   XCTAssertEqual( launch?.launchLibraryID, libraryID )
   XCTAssertEqual( launch?.name, name )
   XCTAssertEqual( launch?.net, net )
   XCTAssertEqual( launch?.probability, probability )
   XCTAssertEqual( launch?.slug, slug )
   XCTAssertEqual( launch?.tbdDate, tbdDate )
   XCTAssertEqual( launch?.tbdTime, tbdTime )
   XCTAssertEqual( launch?.url, url )
   XCTAssertEqual( launch?.webcastLive, webcastLive )
   XCTAssertEqual( launch?.windowEnd, windowEnd )
   XCTAssertEqual( launch?.windowStart, windowStart )
   XCTAssertEqual( launch?.lastUpdated, lastUpdated )
}

func checkLauncherConfig( launcher: LauncherConfigJSON?, launcherID: Int64, libraryID: Int64? = nil, url: String? = nil, name: String? = nil,
                          description: String? = nil, family: String? = nil, fullName: String? = nil, variant: String? = nil,
                          alias: String? = nil, minStage: Int64? = nil, maxStage: Int64? = nil, length: Double? = nil,
                          diameter: Double? = nil, maidenFlight: String? = nil, launchMass: Int64? = nil, leoCapacity: Int64? = nil,
                          gtoCapacity: Int64? = nil, takeoffThrust: Int64? = nil, apogee: Int64? = nil, vehicleRange: Int64? = nil,
                          imageURL: String? = nil, infoURL: String? = nil, wikiURL: String? = nil, consecutiveSuccessfulLaunches: Int64? = nil,
                          successfulLaunches: Int64? = nil, failedLaunches: Int64? = nil, pendingLaunches: Int64? = nil )
{
   XCTAssertNotNil( launcher )
   XCTAssertEqual( launcher?.id, launcherID )
   XCTAssertEqual( launcher?.launchLibraryID, libraryID )
   XCTAssertEqual( launcher?.url, url )
   XCTAssertEqual( launcher?.name, name )
   XCTAssertEqual( launcher?.launcherConfigDescription, description )
   XCTAssertEqual( launcher?.family, family )
   XCTAssertEqual( launcher?.fullName, fullName )
   XCTAssertEqual( launcher?.variant, variant )
   XCTAssertEqual( launcher?.alias, alias )
   XCTAssertEqual( launcher?.minStage, minStage )
   XCTAssertEqual( launcher?.maxStage, maxStage )
   XCTAssertEqual( launcher?.length, length )
   XCTAssertEqual( launcher?.diameter, diameter )
   XCTAssertEqual( launcher?.maidenFlight, maidenFlight )
   XCTAssertEqual( launcher?.launchMass, launchMass )
   XCTAssertEqual( launcher?.leoCapacity, leoCapacity )
   XCTAssertEqual( launcher?.gtoCapacity, gtoCapacity )
   XCTAssertEqual( launcher?.takeoffThrust, takeoffThrust )
   XCTAssertEqual( launcher?.apogee, apogee )
   XCTAssertEqual( launcher?.vehicleRange, vehicleRange )
   XCTAssertEqual( launcher?.imageURL, imageURL )
   XCTAssertEqual( launcher?.infoURL, infoURL )
   XCTAssertEqual( launcher?.wikiURL, wikiURL )
   XCTAssertEqual( launcher?.consecutiveSuccessfulLaunches, consecutiveSuccessfulLaunches )
   XCTAssertEqual( launcher?.successfulLaunches, successfulLaunches )
   XCTAssertEqual( launcher?.failedLaunches, failedLaunches )
   XCTAssertEqual( launcher?.pendingLaunches, pendingLaunches )
}

func checkSpacecraftConfig( spacecraft: SpacecraftConfigJSON?, spacecraftID: Int64, url: String? = nil, name: String? = nil,
                            type: String? = nil, inUse: Bool? = nil, capability: String? = nil,
                            history: String? = nil, details: String? = nil, maidenFlight: String? = nil,
                            height: Double? = nil, diameter: Double? = nil, humanRated: Bool? = nil, crewCapacity: Int64? = nil,
                            payloadCapacity: Int64? = nil, flightLife: String? = nil, imageURL: String? = nil, nationURL: String? = nil,
                            wikiURL: String? = nil, infoURL: String? = nil )
{
   XCTAssertNotNil( spacecraft )
   XCTAssertEqual( spacecraft?.id, spacecraftID )
   XCTAssertEqual( spacecraft?.url, url )
   XCTAssertEqual( spacecraft?.name, name )
   XCTAssertEqual( spacecraft?.type?.name, type )
   // test agency
   XCTAssertEqual( spacecraft?.inUse, inUse )
   XCTAssertEqual( spacecraft?.capability, capability )
   XCTAssertEqual( spacecraft?.history, history )
   XCTAssertEqual( spacecraft?.details, details )
   XCTAssertEqual( spacecraft?.maidenFlight, maidenFlight )
   XCTAssertEqual( spacecraft?.height, height )
   XCTAssertEqual( spacecraft?.diameter, diameter )
   XCTAssertEqual( spacecraft?.humanRated, humanRated )
   XCTAssertEqual( spacecraft?.crewCapacity, crewCapacity )
   XCTAssertEqual( spacecraft?.payloadCapacity, payloadCapacity )
   XCTAssertEqual( spacecraft?.flightLife, flightLife )
   XCTAssertEqual( spacecraft?.imageURL, imageURL )
   XCTAssertEqual( spacecraft?.nationURL, nationURL )
   XCTAssertEqual( spacecraft?.wikiURL, wikiURL )
   XCTAssertEqual( spacecraft?.infoURL, infoURL )
}

func checkAstronaut( astronaut: AstronautJSON?, id: Int64, url: String? = nil, name: String? = nil, statusID: Int64? = nil, statusName: String? = nil,
                     typeID: Int64? = nil, typeName: String? = nil, dateOfBirth: String? = nil, dateOfDeath: String? = nil, nationality: String? = nil,
                     twitter: String? = nil, instagram: String? = nil, bio: String? = nil, profileImage: String? = nil, profileImageThumbnail: String? = nil,
                     wiki: String? = nil, lastFlight: String? = nil, firstFlight: String? = nil )
{
   XCTAssertNotNil( astronaut )
   XCTAssertEqual( astronaut?.id, id )
   XCTAssertEqual( astronaut?.url, url )
   XCTAssertEqual( astronaut?.name, name )
   XCTAssertEqual( astronaut?.status?.id, statusID )
   XCTAssertEqual( astronaut?.status?.name, statusName )
   XCTAssertEqual( astronaut?.type?.id, typeID )
   XCTAssertEqual( astronaut?.type?.name, typeName )
   // test agency
   XCTAssertEqual( astronaut?.dateOfBirth, dateOfBirth )
   XCTAssertEqual( astronaut?.dateOfDeath, dateOfDeath )
   XCTAssertEqual( astronaut?.nationality, nationality )
   XCTAssertEqual( astronaut?.twitter, twitter )
   XCTAssertEqual( astronaut?.instagram, instagram )
   XCTAssertEqual( astronaut?.bio, bio )
   XCTAssertEqual( astronaut?.profileImage, profileImage )
   XCTAssertEqual( astronaut?.profileImageThumbnail, profileImageThumbnail )
   XCTAssertEqual( astronaut?.wiki, wiki )
   XCTAssertEqual( astronaut?.lastFlight, lastFlight )
   XCTAssertEqual( astronaut?.firstFlight, firstFlight )
}

func checkOrbit( orbit: OrbitJSON?, id: Int64, name: String? = nil, abbreviation: String? = nil )
{
   XCTAssertNotNil( orbit )
   XCTAssertEqual( orbit?.abbreviation, abbreviation )
   XCTAssertEqual( orbit?.id, id )
   XCTAssertEqual( orbit?.name, name )
}

func checkSpacecraftFlight( spacecraftFlight: SpacecraftFlightJSON, id: Int64, url: String? = nil, destination: String? = nil, missionEnd: String? = nil )
{
   XCTAssertNotNil( spacecraftFlight )
   XCTAssertEqual( spacecraftFlight.id, id )
   XCTAssertEqual( spacecraftFlight.url, url )
   XCTAssertEqual( spacecraftFlight.destination, destination )
   XCTAssertEqual( spacecraftFlight.missionEnd, missionEnd )

   /*
    let spacecraft: SpacecraftJSON?
    let launch: LaunchJSON?
    var launchCrew: [AstronautFlightJSON] = []
    var onboardCrew: [AstronautFlightJSON] = []
    var landingCrew: [AstronautFlightJSON] = []
    var dockingEvents: [DockingEventJSON] = []
    */
}

func checkSpacecraft( spacecraft: SpacecraftJSON?, id: Int64, url: String? = nil, name: String? = nil, serialNumber: String? = nil,
                      description: String? = nil )
{
   XCTAssertNotNil( spacecraft )
   XCTAssertEqual( spacecraft?.id, id )
   XCTAssertEqual( spacecraft?.url, url )
   XCTAssertEqual( spacecraft?.name, name )
   XCTAssertEqual( spacecraft?.serialNumber, serialNumber )
   // check status
   XCTAssertEqual( spacecraft?.spacecraftDescription, description )
   // check spacecraft_config
   // check flights
}

func checkIDName( json: IDNameJSON?, id: Int64, name: String? = nil )
{
   XCTAssertNotNil( json )
   XCTAssertEqual( json?.id, id )
   XCTAssertEqual( json?.name, name )
}
