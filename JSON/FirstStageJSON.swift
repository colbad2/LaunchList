// Copyright © 2021 Bradford Holcombe. All rights reserved.

/**
 ### Spec (API model: FirstStage)
      id                      integer
      type                    string
      reused                  boolean x-nullable: true
      launcher_flight_number  string
      launcher                LauncherDetailed{...}
      landing                 Landing{...}
      previous_flight_date    string
      turn_around_time_days   string
      previous_flight         Launch{...}
}
*/
public class FirstStageJSON: Identifiable, JSONElement
{
   /** ID of the landing type within the API. */
   public let id: Int64?
   var type: String?
   var reused: Bool?
   var launcherFlightNumber: String?
   var launcher: LauncherJSON?
   var landing: LandingJSON?
   var previousFlightDate: String?
   var turnaroundTimeDays: String?
   var previousFlight: LaunchJSON?

   public required init?( _ json: Any? )
   {
      guard let json: JSONStructure = json as? JSONStructure else { return nil }
      self.id = nonNegativeInt( json[ "id" ] )
      self.type = nonEmptyString( json[ "type" ] )
      self.reused = json[ "reused" ] as? Bool
      self.launcherFlightNumber = nonEmptyString( json[ "launcher_flight_number" ] )
      self.launcher = LauncherJSON( json[ "reused" ] )
      self.landing = LandingJSON( json[ "landing" ] )
      self.previousFlightDate = nonEmptyString( json[ "previous_flight_date" ] )
      self.turnaroundTimeDays = nonEmptyString( json[ "turn_around_time_days" ] )
      self.previousFlight = LaunchJSON( json[ "previous_flight" ] )
   }
}
