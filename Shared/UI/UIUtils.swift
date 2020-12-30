import Foundation

func missionName( _ launch: Launch? ) -> String
{
   guard let launch = launch else { return "" }
   if let missionName = launch.mission?.name { return missionName }

   return launch.name?
            .components( separatedBy: "|" )[ 1 ]
            .trimmingCharacters( in: .whitespacesAndNewlines ) ?? launch.name ?? ""
}
