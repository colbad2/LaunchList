// Copyright © 2021 Bradford Holcombe. All rights reserved.

import XCTest

// swiftlint:disable function_parameter_count
// swiftlint:disable function_default_parameter_at_end

func checkPad( pad: PadJSON?, padID: Int64, agencyID: Int64? = nil, infoURL: String? = nil, lat: String, lon: String,
               mapImage: String? = nil, mapURL: String? = nil, name: String, totalLaunchCount: Int64,
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

func checkLocation( location: LocationJSON?, locationID: Int64, countryCode: String, mapImage: String? = nil,
                    name: String, landingCount: Int64, lauchCount: Int64, url: String? = nil )
{
   XCTAssertNotNil( location )
   XCTAssertEqual( location?.countryCode, countryCode )
   XCTAssertEqual( location?.id, locationID )
   XCTAssertEqual( location?.mapImage, mapImage )
   XCTAssertEqual( location?.name, name )
   XCTAssertEqual( location?.totalLandingCount, landingCount )
   XCTAssertEqual( location?.totalLaunchCount, lauchCount )
   XCTAssertEqual( location?.url, url )
}

func checkMission( mission: MissionJSON?, missionID: Int64, description: String, designator: String? = nil,
                   libraryID: Int64? = nil, name: String, type: String, orbitAbbreviation: String? = nil,
                   orbitLibraryID: Int64? = nil, orbitName: String? = nil )
{
   XCTAssertNotNil( mission )
   XCTAssertEqual( mission?.description, description )
   XCTAssertEqual( mission?.id, missionID )
   XCTAssertEqual( mission?.launchDesignator, designator )
   XCTAssertEqual( mission?.launchLibraryID, libraryID )
   XCTAssertEqual( mission?.name, name )
   XCTAssertEqual( mission?.type, type )

   XCTAssertEqual( mission?.orbit?.abbreviation, orbitAbbreviation )
   XCTAssertEqual( mission?.orbit?.id, orbitLibraryID )
   XCTAssertEqual( mission?.orbit?.name, orbitName )
}

func checkStatus( status: StatusJSON?, abbreviation: String, description: String, statusID: Int64, name: String )
{
   XCTAssertNotNil( status )
   XCTAssertEqual( status?.abbreviation, abbreviation )
   XCTAssertEqual( status?.description, description )
   XCTAssertEqual( status?.id, statusID )
   XCTAssertEqual( status?.name, name )
}

func checkAgency( agency: AgencyJSON?, agencyID: Int64, name: String, featured: Bool? = nil, type: String, url: String?,
                  countryCode: String? = nil, abbreviation: String? = nil, agencyDescription: String? = nil,
                  administrator: String? = nil, foundingYear: String? = nil, launchers: String? = nil,
                  spacecraft: String? = nil, parent: String? = nil,
                  imageURL: String? = nil, infoURL: String? = nil, wikiURL: String? = nil, logoURL: String? = nil,
                  nationURL: String? = nil, totalLaunchCount: Int64? = nil, successfulLaunches: Int64? = nil,
                  consecutiveSuccessfulLaunches: Int64? = nil, failedLaunches: Int64? = nil, pendingLaunches: Int64? = nil,
                  successfulLandings: Int64? = nil, failedLandings: Int64? = nil, attemptedLandings: Int64? = nil,
                  consecutiveSuccessfulLandings: Int64? = nil)
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

   /*
    "launcher_list":
    "spacecraft_list":
    */
}

func checkProgram( program: ProgramJSON?, programID: Int64, description: String?, endDate: String? = nil,
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
                  holdReason: String? = nil, image: String? = nil, infographic: String? = nil, inHold: Bool,
                  libraryID: Int64, name: String, net: String, probability: Int16, slug: String, tbdDate: Bool,
                  tbdTime: Bool, url: String? = nil, webcastLive: Bool, windowEnd: String, windowStart: String )
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
}
