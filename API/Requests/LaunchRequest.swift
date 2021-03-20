// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Encapsulation of the API upcoming launch endpoint parameters. Returns future Launch objects and launches from
 the last twenty four hours.
 */
class LaunchRequest: BaseAPIListRequest, APIListRequest
{
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

   override var requestURL: String
   {
      parameters = []
      addParam( name: "name", value: name )
      addParam( name: "slug", value: slug )
      addParam( name: "rocket__configuration__name", value: rocketConfigName )
      addParam( name: "rocket__configuration__id", value: rocketConfigID )
      addParam( name: "status", value: status )
      addParam( name: "launch_library_id", value: launchLibraryID )
      addParam( name: "rocket__spacecraftflight__spacecraft__name", value: spacecraftName )
      addParam( name: "rocket__spacecraftflight__spacecraft__name__icontains", value: spacecraftNameContains )
      addParam( name: "rocket__spacecraftflight__spacecraft__id", value: spacecraftID )
      addParam( name: "rocket__configuration__manufacturer__name", value: manufacturerName )
      addParam( name: "rocket__configuration__manufacturer__name__icontains", value: manufacturerNameContains )
      addParam( name: "rocket__configuration__full_name", value: rocketConfigFullName )
      addParam( name: "rocket__configuration__full_name__icontains", value: rocketConfigFullNameContains )
      addParam( name: "mission__orbit__name", value: orbitName )
      addParam( name: "mission__orbit__name_icontains", value: orbitNameContains )
      addParam( name: "program", value: program )
      addParam( name: "location__ids", value: locationIDs )
      addParam( name: "lsp__ids", value: launchServiceProviderIDs )
      addParam( name: "is_crewed", value: isCrewed )
      addParam( name: "include_suborbital", value: includeSuborbital )
      addParam( name: "serial_number", value: serialNumber )
      addParam( name: "lsp__name", value: launchServiceProviderName )
      addParam( name: "lsp__id", value: launchServiceProviderID )
      addParam( name: "launcher_config__id", value: launcherConfigID )
      addParam( name: "spacecraft_config_ids", value: spacecraftConfigIDs )
      addParam( name: "related", value: related )
      addParam( name: "hide_recent_previous", value: hideRecentPrevious )

      addParam( name: "mode", value: "detailed" )

      return super.requestURL + parameters.joined( separator: "&" )
   }

   init( baseURL: String, endPoint: String, searchTerm: String? = nil,
         orderingField: String? = nil, limit: Int = 100, offset: Int = 0, name: String? = nil, slug: String? = nil,
         rocketConfigName: String? = nil, rocketConfigID: String? = nil, status: String? = nil, launchLibraryID: Int? = nil,
         spacecraftName: String? = nil, spacecraftNameContains: String? = nil, spacecraftID: Int? = nil, manufacturerName: String? = nil,
         manufacturerNameContains: String? = nil, rocketConfigFullName: String? = nil, rocketConfigFullNameContains: String? = nil,
         orbitName: String? = nil, orbitNameContains: String? = nil, program: String? = nil, locationIDs: [Int]? = nil,
         launchServiceProviderIDs: [Int]? = nil, isCrewed: Bool? = nil, includeSuborbital: Bool? = nil, serialNumber: String? = nil,
         launchServiceProviderName: String? = nil, launchServiceProviderID: Int? = nil, launcherConfigID: Int? = nil,
         spacecraftConfigIDs: [Int]? = nil, related: Bool? = nil, hideRecentPrevious: Bool? = nil )
   {
      super.init( baseURL: baseURL, endPoint: endPoint, searchTerm: searchTerm,
                  orderingField: orderingField, limit: limit, offset: offset )

      self.name = name
      self.slug = slug
      self.rocketConfigName = rocketConfigName
      self.rocketConfigID = rocketConfigID
      self.status = status
      self.launchLibraryID = launchLibraryID
      self.spacecraftName = spacecraftName
      self.spacecraftNameContains = spacecraftNameContains
      self.spacecraftID = spacecraftID
      self.manufacturerName = manufacturerName
      self.manufacturerNameContains = manufacturerNameContains
      self.rocketConfigFullName = rocketConfigFullName
      self.rocketConfigFullNameContains = rocketConfigFullNameContains
      self.orbitName = orbitName
      self.orbitNameContains = orbitNameContains
      self.program = program
      self.locationIDs = locationIDs
      self.launchServiceProviderIDs = launchServiceProviderIDs
      self.isCrewed = isCrewed
      self.includeSuborbital = includeSuborbital
      self.serialNumber = serialNumber
      self.launchServiceProviderName = launchServiceProviderName
      self.launchServiceProviderID = launchServiceProviderID
      self.launcherConfigID = launcherConfigID
      self.spacecraftConfigIDs = spacecraftConfigIDs
      self.related = related
      self.hideRecentPrevious = hideRecentPrevious
   }

   func copy() -> APIListRequest
   {
      LaunchRequest( baseURL: base, endPoint: endPoint, searchTerm: search, orderingField: ordering,
                     limit: limit, offset: offset, name: name, slug: slug,
                     rocketConfigName: rocketConfigName, rocketConfigID: rocketConfigID, status: status,
                     launchLibraryID: launchLibraryID,
                     spacecraftName: spacecraftName, spacecraftNameContains: spacecraftNameContains,
                     spacecraftID: spacecraftID, manufacturerName: manufacturerName,
                     manufacturerNameContains: manufacturerNameContains, rocketConfigFullName: rocketConfigFullName,
                     rocketConfigFullNameContains: rocketConfigFullNameContains,
                     orbitName: orbitName, orbitNameContains: orbitNameContains, program: program, locationIDs: locationIDs,
                     launchServiceProviderIDs: launchServiceProviderIDs, isCrewed: isCrewed,
                     includeSuborbital: includeSuborbital, serialNumber: serialNumber,
                     launchServiceProviderName: launchServiceProviderName, launchServiceProviderID: launchServiceProviderID,
                     launcherConfigID: launcherConfigID,
                     spacecraftConfigIDs: spacecraftConfigIDs, related: related, hideRecentPrevious: hideRecentPrevious )
   }
}
