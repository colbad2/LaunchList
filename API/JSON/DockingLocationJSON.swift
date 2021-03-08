// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Spec (API model: DockingLocationSerializerForSpacestation)
 id   integer
 name*   string maxLength: 255 minLength: 1
 docked   DockingEventDetailedSerializerForSpacestation{...}
 */
public class DockingLocationJSON: Identifiable, JSONElement
{
   /** ID of the rocket within the API. */
   public let id: Int64?
   /** Station name. */
   let name: String?
   let docked: DockingEventJSON?

   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.name = nonEmptyString( json[ "name" ] )
      self.docked = DockingEventJSON( json[ "docked" ] )
   }
}
