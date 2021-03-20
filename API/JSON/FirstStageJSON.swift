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
      id = nonNegativeInt( json[ "id" ] )
      type = nonEmptyString( json[ "type" ] )
      reused = json[ "reused" ] as? Bool
      launcherFlightNumber = nonEmptyString( json[ "launcher_flight_number" ] )
      launcher = LauncherJSON( json[ "reused" ] )
      landing = LandingJSON( json[ "landing" ] )
      previousFlightDate = nonEmptyString( json[ "previous_flight_date" ] )
      turnaroundTimeDays = nonEmptyString( json[ "turn_around_time_days" ] )
      previousFlight = LaunchJSON( json[ "previous_flight" ] )
   }
}
