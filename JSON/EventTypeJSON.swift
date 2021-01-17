// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 Status of an [EventJSON].

 Used in parsing [EventJSON]. Flattened into the [Event] CoreData entity.

 ### Example
 {
    "id": 21,
    "name": "Cryoproof Test"
 }
 */
public struct EventTypeJSON: Decodable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, name
   }

   let id: Int64
   let name: String?
}
