import Foundation

func missionName( _ launch: Launch? ) -> String
{
   guard let launch = launch else { return "" }
   if let missionName = launch.mission?.name { return missionName }
   let parts = launch.name?.components( separatedBy: "|" )
   let missionPart = parts?.last

   return missionPart?.trimmingCharacters( in: .whitespacesAndNewlines ) ?? launch.name ?? ""
}
