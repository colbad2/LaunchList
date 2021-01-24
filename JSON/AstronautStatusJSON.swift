// Copyright © 2021 Bradford Holcombe. All rights reserved.

public struct AstronautStatusJSON: Decodable, Identifiable, JSONElement
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, name
   }

   public var id: Int64
   var name: String?
}
