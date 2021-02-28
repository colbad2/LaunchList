// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 API request for launcher config lists.

 - see `ConfigRequest`
 */
public class LauncherConfigRequest: ConfigListRequest
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
      var url: String = super.requestURL
      var parameters: [String] = []

      if let family: String = family { parameters.append( "family=\(family)" ) }
      if let name: String = name { parameters.append( "name=\(name)" ) }
      if let manufacturer: String = manufacturer { parameters.append( "manufacturer=\(manufacturer)" ) }
      if let fullName: String = fullName { parameters.append( "full_name=\(fullName)" ) }
      if let active: String = active { parameters.append( "active=\(active)" ) }
      if let reusable: String = reusable { parameters.append( "reusable=\(reusable)" ) }
      if let program: String = program { parameters.append( "program=\(program)" ) }

      if !parameters.isEmpty
      {
         url += "&"
         url += parameters.joined( separator: "&" )
      }

      return url
   }

   // MARK: Constructors

   /**
    Creates a request for a list of specific types.

    - parameter baseURL: `String` base part of the constructed request URL
    - parameter searchTerm: `String` search term to filter by
    - parameter orderingField: `String` which field to order by (can only be 'id' or 'name')
    - parameter limit: `Int` limit of records to return (max 100)
    - parameter offset: `Int` starting index of the types returned
    - parameter family: `String` launcher family
    - parameter name: `String` launcher name
    - parameter manufacturer: `String` launcher manufacturer
    - parameter fullName: `String` launcher full name
    - parameter active: `String` if the launcher is active
    - parameter reusable: `String` if the launcher is reusable
    - parameter program: `String` launcher program
    */
   init( baseURL: String, searchTerm: String? = nil,
         orderingField: String? = nil, limit: Int = 100, offset: Int = 0,
         family: String? = nil, name: String? = nil, manufacturer: String? = nil, fullName: String? = nil,
         active: String? = nil, reusable: String? = nil, program: String? = nil )
   {
      super.init( baseURL: baseURL, requestType: .launcher, searchTerm: searchTerm, orderingField: orderingField,
                  limit: limit, offset: offset )

      self.family = family
      self.name = name
      self.manufacturer = manufacturer
      self.fullName = fullName
      self.active = active
      self.reusable = reusable
      self.program = program
   }
}
