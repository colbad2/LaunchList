// Copyright © 2021 Bradford Holcombe. All rights reserved.

struct AstronautTypeJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, name
   }

   var id: Int64
   var name: String?
}
