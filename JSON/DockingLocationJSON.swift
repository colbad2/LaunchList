// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Spec (API model: DockingLocationSerializerForSpacestation)
 id   integer
 name*   string maxLength: 255 minLength: 1
 docked   DockingEventDetailedSerializerForSpacestation{...}
 */
public class DockingLocationJSON: Decodable, Identifiable, JSONElement
{
   /** ID of the rocket within the API. */
   public let id: Int64
   /** Station name. */
   let name: String?
   let docked: DockingEventJSON?

   init?( json: JSONStructure? )
   {
      guard let json = json else { return nil }
      guard let id = json[ "id" ] as? Int64 else { return nil }

      self.id = id
      self.name = json[ "name" ] as? String
      self.docked = DockingEventJSON( json: json[ "docked" ] as? JSONStructure )
   }
}
