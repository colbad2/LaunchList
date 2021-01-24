// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Encapsulation of the API upcoming launch endpoint parameters. Returns future Launch objects and launches from
 the last twenty four hours.
 */
struct LaunchRequest: APIRequest
{
   var base: String
   var endPoint: String
   var name: String?
   var slug: String?
   var rocketConfigName: String?
   var rocketConfigID: String?
   var status: String?
   var launchLibraryID: Int?
   var spacecraftName: String?
   var spacecraftNameContains: String?
   var spacecraftID: Int?
   var manufacturerName: String?
   var manufacturerNameContains: String?
   var rocketConfigFullName: String?
   var rocketConfigFullNameContains: String?
   var orbitName: String?
   var orbitNameContains: String?
   var program: String?
   var search: String? // Searches through the launch name, rocket name, launch agency and mission name.
   var ordering: String?
   var limit: Int = 100
   var offset: Int = 0
   var mode: APIRequestMode = APIRequestMode.detailed // 'normal', 'list', 'detailed'
   var locationIDs: [Int]?
   var launchServiceProviderIDs: [Int]?
   var isCrewed: Bool?
   var includeSuborbital: Bool?
   var serialNumber: String?
   var launchServiceProviderName: String?
   var launchServiceProviderID: Int?
   var launcherConfigID: Int?
   var spacecraftConfigIDs: [Int]?
   var related: Bool?
   var hideRecentPrevious: Bool? // not for previous launches

   var requestURL: String
   {
      var url: String = base + endPoint // "launch/upcoming/?"

      var parameters: [String] = []
      if let name: String = name { parameters.append( "name=\(name)" ) }
      if let slug: String = slug { parameters.append( "slug=\(slug)" ) }
      if let rocketConfigName: String = rocketConfigName { parameters.append( "rocket__configuration__name=\(rocketConfigName)" ) }
      if let rocketConfigID: String = rocketConfigID { parameters.append( "rocket__configuration__id=\(rocketConfigID)" ) }
      if let status: String = status { parameters.append( "status=\(status)" ) }
      if let launchLibraryID: Int = launchLibraryID { parameters.append( "launch_library_id=\(launchLibraryID)" ) }
      if let spacecraftName: String = spacecraftName { parameters.append( "rocket__spacecraftflight__spacecraft__name=\(spacecraftName)" ) }
      if let spacecraftNameContains: String = spacecraftNameContains
         { parameters.append( "rocket__spacecraftflight__spacecraft__name__icontains=\(spacecraftNameContains)" ) }
      if let spacecraftID: Int = spacecraftID { parameters.append( "rocket__spacecraftflight__spacecraft__id=\(spacecraftID)" ) }
      if let manufacturerName: String = manufacturerName { parameters.append( "rocket__configuration__manufacturer__name=\(manufacturerName)" ) }
      if let manufacturerNameContains: String = manufacturerNameContains
         { parameters.append( "rocket__configuration__manufacturer__name__icontains=\(manufacturerNameContains)" ) }
      if let rocketConfigFullName: String = rocketConfigFullName { parameters.append( "rocket__configuration__full_name=\(rocketConfigFullName)" ) }
      if let rocketConfigFullNameContains: String = rocketConfigFullNameContains
         { parameters.append( "rocket__configuration__full_name__icontains=\(rocketConfigFullNameContains)" ) }
      if let orbitName: String = orbitName { parameters.append( "mission__orbit__name=\(orbitName)" ) }
      if let orbitNameContains: String = orbitNameContains { parameters.append( "mission__orbit__name=\(orbitNameContains)" ) }
      if let program: String = program { parameters.append( "program=\(program)" ) }
      if let search: String = search { parameters.append( "search=\(search)" ) }
      if let ordering: String = ordering { parameters.append( "ordering=\(ordering)" ) }
      parameters.append( "limit=\(limit)" )
      parameters.append( "offset=\(offset)" )
      parameters.append( "mode=\(mode)" )
      if let locationIDs: [Int] = locationIDs { parameters.append( "location__ids=\(locationIDs)" ) }
      if let launchServiceProviderIDs: [Int] = launchServiceProviderIDs { parameters.append( "lsp__ids=\(launchServiceProviderIDs)" ) }
      if let isCrewed: Bool = isCrewed { parameters.append( "is_crewed=\(isCrewed)" ) }
      if let includeSuborbital: Bool = includeSuborbital { parameters.append( "include_suborbital=\(includeSuborbital)" ) }
      if let serialNumber: String = serialNumber { parameters.append( "serial_number=\(serialNumber)" ) }
      if let launchServiceProviderName: String = launchServiceProviderName { parameters.append( "lsp__name=\(launchServiceProviderName)" ) }
      if let launchServiceProviderID: Int = launchServiceProviderID { parameters.append( "lsp__id=\(launchServiceProviderID)" ) }
      if let launcherConfigID: Int = launcherConfigID { parameters.append( "launcher_config__id=\(launcherConfigID)" ) }
      if let spacecraftConfigIDs: [Int] = spacecraftConfigIDs { parameters.append( "spacecraft_config_ids=\(spacecraftConfigIDs)" ) }
      if let related: Bool = related { parameters.append( "related=\(related)" ) }
      if let hideRecentPrevious: Bool = hideRecentPrevious { parameters.append( "hide_recent_previous=\(hideRecentPrevious)" ) }

      url += parameters.joined( separator: "&" )

      return url
   }
}

// preserves auto-generated init
extension LaunchRequest
{
   init( base: String, endPoint: String, limit: Int = 100, offset: Int = 0 )
   {
      self.base = base
      self.endPoint = endPoint + "?"
      self.name = nil
      self.slug = nil
      self.rocketConfigName = nil
      self.rocketConfigID = nil
      self.status = nil
      self.launchLibraryID = nil
      self.spacecraftName = nil
      self.spacecraftNameContains = nil
      self.spacecraftID = nil
      self.manufacturerName = nil
      self.manufacturerNameContains = nil
      self.rocketConfigFullName = nil
      self.rocketConfigFullNameContains = nil
      self.orbitName = nil
      self.orbitNameContains = nil
      self.program = nil
      self.search = nil
      self.ordering = nil
      self.limit = limit
      self.offset = offset
      self.mode = APIRequestMode.detailed
      self.locationIDs = nil
      self.launchServiceProviderIDs = nil
      self.isCrewed = nil
      self.includeSuborbital = nil
      self.serialNumber = nil
      self.launchServiceProviderName = nil
      self.launchServiceProviderID = nil
      self.launcherConfigID = nil
      self.spacecraftConfigIDs = nil
      self.related = nil
      self.hideRecentPrevious = nil
   }
}
