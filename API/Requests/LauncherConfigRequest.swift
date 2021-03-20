// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 API request for launcher config lists.
 */
public class LauncherConfigRequest: BaseAPIListRequest, APIListRequest
{
   var family: String?
   var name: String?
   var manufacturer: String?
   var fullName: String?
   var active: String?
   var reusable: String?
   var program: String?

   /** The complete URL for the request. */
   override var requestURL: String
   {
      parameters = []

      addParam( name: "family", value: family )
      addParam( name: "name", value: name )
      addParam( name: "manufacturer", value: manufacturer )
      addParam( name: "full_name", value: fullName )
      addParam( name: "active", value: active )
      addParam( name: "reusable", value: reusable )
      addParam( name: "program", value: program )

      return super.requestURL + parameters.joined( separator: "&" )
   }

   /**
    Creates a request for a list of specific types.

    - parameter baseURL:       `String` base part of the constructed request URL
    - parameter searchTerm:    `String` search term to filter by
    - parameter orderingField: `String` which field to order by (can only be 'id' or 'name')
    - parameter limit:         `Int` limit of records to return (max 100)
    - parameter offset:        `Int` starting index of the types returned
    - parameter family:        `String` launcher family
    - parameter name:          `String` launcher name
    - parameter manufacturer:  `String` launcher manufacturer
    - parameter fullName:      `String` launcher full name
    - parameter active:        `String` if the launcher is active
    - parameter reusable:      `String` if the launcher is reusable
    - parameter program:       `String` launcher program
    */
   init( baseURL: String, searchTerm: String? = nil,
         orderingField: String? = nil, limit: Int = 100, offset: Int = 0,
         family: String? = nil, name: String? = nil, manufacturer: String? = nil, fullName: String? = nil,
         active: String? = nil, reusable: String? = nil, program: String? = nil )
   {
      super.init( baseURL: baseURL, endPoint: "launcher/", searchTerm: searchTerm, orderingField: orderingField,
                  limit: limit, offset: offset )

      self.family = family
      self.name = name
      self.manufacturer = manufacturer
      self.fullName = fullName
      self.active = active
      self.reusable = reusable
      self.program = program
   }

   /**
    Makes a copy of this request

    - returns: copy of this request
    */
   func copy() -> APIListRequest
   {
      LauncherConfigRequest( baseURL: base, searchTerm: search, orderingField: ordering, limit: limit, offset: offset,
                             family: family, name: name, manufacturer: manufacturer, fullName: fullName,
                             active: active, reusable: reusable, program: program )
   }
}
