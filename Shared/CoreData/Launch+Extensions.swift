import Foundation

extension Launch
{
   func getProviderName() -> String
   {
      var providerName = self.serviceProvider?.name
      if providerName == "National Aeronautics and Space Administration"
      {
         providerName = "NASA"
      }
      else if providerName == "United States Air Force"
      {
         providerName = "US Air Force"
      }
      else if providerName == "Russian Federal Space Agency (ROSCOSMOS)"
      {
         providerName = "ROSCOSMOS"
      }

      return providerName ?? ""
   }
}
