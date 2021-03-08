// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Type of a landing.

 ### Spec (API model: LandingType)
       id   integer
       name   string maxLength: 255
       abbrev   string maxLength: 255
       description   string
       maxLength: 2048
 }
 */
public class LandingTypeJSON: Decodable, Identifiable, JSONElement
{
   /** ID of the landing type within the API. */
   public let id: Int64?
   let name: String?
   var abbreviation: String?
   var typeDescription: String?

   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.name = nonEmptyString( json[ "name" ] )
      self.abbreviation = nonEmptyString( json[ "abbrev" ] )
      self.typeDescription = nonEmptyString( json[ "description" ] )
   }
}
