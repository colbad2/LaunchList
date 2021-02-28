// Copyright © 2021 Bradford Holcombe. All rights reserved.

/** API end point for agency requests. */
private let apiEndPoint: String = "config/"

/**
 An API request under the 'config/' endpoints. Most return `IDNameJSON` objects, either a single one, or a list.
 Specific return types can be seen in the `ConfigRequestMode` enum.

 Config requests come in two flavors: one that returns a list of all records of the given type, one that returns
 a specific, detailed, record with a given ID.

 Almost all use the same requests parameters, but some use more. Those requests are handled through `ConfigRequest`
 subclasses.
 */
public class ConfigListRequest: BaseAPIListRequest, APIListRequest
{
   /** Type of data being fetched. */
   var requestType: ConfigRequestMode = .agencyType
   /** URL for the request. */
   override var requestURL: String
   {
      return super.requestURL
   }

   /**
    Creates a request for a list of specific types.

    - parameter baseURL:       base part of the constructed request URL
    - parameter requestType:   what type is being requested
    - parameter searchTerm:    search term to filter by
    - parameter orderingField: which field to order by (can only be 'id' or 'name')
    - parameter limit:         limit of records to return (max 100)
    - parameter offset:        starting index of the types returned
    */
   init( baseURL: String, requestType: ConfigRequestMode, searchTerm: String? = nil,
         orderingField: String? = nil, limit: Int = 100, offset: Int = 0 )
   {
      super.init( baseURL: baseURL, endPoint: apiEndPoint + requestType.rawValue.lowercased(), searchTerm: searchTerm,
                  orderingField: orderingField, limit: limit, offset: offset )
   }

   /**
    Makes a copy of this request

    - returns: copy of this request
    */
   func copy() -> APIListRequest
   {
      return AgencyListRequest( baseURL: base, searchTerm: search,
                                orderingField: ordering, limit: limit, offset: offset )
   }
}

public class ConfigRequest: BaseAPIIDRequest
{
   /**
    Creates a request for a specific type, with a specific ID.

    - parameter baseURL:     base part of the constructed request URL
    - parameter requestType: what type is being requested
    - parameter id:          ID of the type requested
    */
   init( baseURL: String, requestType: ConfigRequestMode, id: Int64 )
   {
      super.init( baseURL: baseURL, endPoint: apiEndPoint + requestType.rawValue.lowercased(), id: id )
   }
}

/**
 Types of config requests that can be made.
 */
enum ConfigRequestMode: String
{
   case agencyType // returns IDNameJSON
   case astronautRole // returns RoleTypeJSON
   case astronautStatus // returns IDNameJSON
   case astronautType // returns IDNameJSON
   case dockingLocation // returns IDNameJSON
   case eventType // returns IDNameJSON
   case firstStageType // returns IDNameJSON
   case landingLocation // returns LandingLocationJSON
   case launcher // returns LauncherConfigJSON
   case launchStatus // returns LaunchStatusJSON
   case missionType // returns IDNameJSON
   case noticeType // returns IDNameJSON
   case orbit // returns OrbitJSON
   case roadClosureStatus // returns IDNameJSON
   case spacecraft // returns SpacecraftConfigJSON
   case spacecraftStatus // returns IDNameJSON
   case spaceStationStatus // returns IDNameJSON
}
