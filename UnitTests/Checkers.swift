import XCTest

func checkPad( pad: PadJSON?, id: Int64, agencyID: Int64? = nil, infoURL: String? = nil, lat: String, lon: String,
               mapImage: String? = nil, mapURL: String? = nil, name: String, totalLaunchCount: Int64,
               url: String? = nil,
               wikiURL: String? = nil )
{
   XCTAssertNotNil( pad )
   XCTAssertEqual( pad?.agencyID, agencyID )
   XCTAssertEqual( pad?.id, id )
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


func checkLocation( location: LocationJSON?, id: Int64, countryCode: String, mapImage: String? = nil, name: String,
                    landingCount: Int64, lauchCount: Int64, url: String? = nil )
{
   XCTAssertNotNil( location )
   XCTAssertEqual( location?.countryCode, countryCode )
   XCTAssertEqual( location?.id, id )
   XCTAssertEqual( location?.mapImage, mapImage )
   XCTAssertEqual( location?.name, name )
   XCTAssertEqual( location?.totalLandingCount, landingCount )
   XCTAssertEqual( location?.totalLaunchCount, lauchCount )
   XCTAssertEqual( location?.url, url )
}


func checkConfiguration( config: ConfigurationJSON?, id: Int64, family: String, fullName: String,
                         libraryID: Int64, name: String, url: String? = nil, variant: String )
{
   XCTAssertNotNil( config )
   XCTAssertEqual( config?.family, family )
   XCTAssertEqual( config?.fullName, fullName )
   XCTAssertEqual( config?.id, id )
   XCTAssertEqual( config?.launchLibraryID, libraryID )
   XCTAssertEqual( config?.name, name )
   XCTAssertEqual( config?.url, url )
   XCTAssertEqual( config?.variant, variant )
}

func checkMission( mission: MissionJSON?, id: Int64, description: String, designator: String? = nil,
                   libraryID: Int64? = nil, name: String, type: String, orbitAbbreviation: String? = nil,
                   orbitLibraryID: Int64? = nil, orbitName: String? = nil )
{
   XCTAssertNotNil( mission )
   XCTAssertEqual( mission?.description, description )
   XCTAssertEqual( mission?.id, id )
   XCTAssertEqual( mission?.launchDesignator, designator )
   XCTAssertEqual( mission?.launchLibraryID, libraryID )
   XCTAssertEqual( mission?.name, name )
   XCTAssertEqual( mission?.type, type )

   XCTAssertEqual( mission?.orbit?.abbreviation, orbitAbbreviation )
   XCTAssertEqual( mission?.orbit?.id, orbitLibraryID )
   XCTAssertEqual( mission?.orbit?.name, orbitName )
}

func checkStatus( status: StatusJSON?, abbreviation: String, description: String, id: Int64, name: String )
{
   XCTAssertNotNil( status )
   XCTAssertEqual( status?.abbreviation, abbreviation )
   XCTAssertEqual( status?.description, description )
   XCTAssertEqual( status?.id, id )
   XCTAssertEqual( status?.name, name )
}

func checkAgency( agency: AgencyJSON?, id: Int64, name: String, featured: Bool? = nil, type: String, url: String?,
                  countryCode: String? = nil, abbreviation: String? = nil, agencyDescription: String? = nil, administrator: String? = nil,
                  foundingYear: String? = nil, launchers: String? = nil, spacecraft: String? = nil, parent: String? = nil, imageURL: String? = nil )
{
   XCTAssertNotNil( agency )
   XCTAssertEqual( agency?.id, id )
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
}


func checkProgram( program: ProgramJSON?, id: Int64, description: String?, endDate: String? = nil,
                   imageURL: String? = nil, infoURL: String? = nil, name: String? = nil,
                   startDate: String? = nil , url: String? = nil, wikiURL: String? = nil )
{
   XCTAssertNotNil( program )
   XCTAssertEqual( program?.id, id )
   XCTAssertEqual( program?.description, description )
   XCTAssertEqual( program?.endDate, endDate )
   XCTAssertEqual( program?.imageURL, imageURL )
   XCTAssertEqual( program?.infoURL, infoURL )
   XCTAssertEqual( program?.name, name )
   XCTAssertEqual( program?.startDate, startDate )
   XCTAssertEqual( program?.url, url )
   XCTAssertEqual( program?.wikiURL, wikiURL )
}


func checkLaunch( launch: LaunchJSON?, id: String, failReason: String? = nil, hashtag: String? = nil,
                  holdReason: String? = nil, image: String? = nil, infographic: String? = nil, inHold: Bool,
                  libraryID: Int64, name: String, net: String, probability: Int16, slug: String, tbdDate: Bool,
                  tbdTime: Bool, url: String? = nil, webcastLive: Bool, windowEnd: String, windowStart: String )
{
   XCTAssertNotNil( launch )
   XCTAssertEqual( launch?.failReason, failReason )
   XCTAssertEqual( launch?.hashtag, hashtag )
   XCTAssertEqual( launch?.holdReason, holdReason )
   XCTAssertEqual( launch?.id, id )
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

