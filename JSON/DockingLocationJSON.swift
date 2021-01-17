// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Example JSON:
       {
       "id": 2,
       "name": "Zvezda aft"
       }
 */
public struct DockingLocationJSON: Decodable, Identifiable
{
   // translate API attribute names into better var names
   enum CodingKeys: String, CodingKey
   {
      case id, name
   }

   public var id: Int64
   var name: String?
}
