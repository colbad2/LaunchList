// Copyright © 2021 Bradford Holcombe. All rights reserved.

import Foundation
import Network

// see https://www.vadimbulavin.com/network-connectivity-on-ios-with-swift/

// swiftlint:disable identifier_name
/** Location of the API. */
let API_URL_BASE: String = "https://ll.thespacedevs.com/2.2.0/"
// swiftlint:enable identifier_name

class APIManager
{
   static let shared: APIManager = APIManager()

   var baseURL: String = API_URL_BASE
   var callCount: Int64 = 0

   init()
   {
      let config: URLSessionConfiguration = URLSessionConfiguration.default
      config.waitsForConnectivity = true
      config.timeoutIntervalForResource = 300
      config.allowsConstrainedNetworkAccess = false

      URLCache.shared = URLCache( memoryCapacity: 20 * 1024 * 1024,
                                  diskCapacity: 100 * 1024 * 1024,
                                  diskPath: nil )

      let monitor: NWPathMonitor = NWPathMonitor()
      monitor.pathUpdateHandler =
      {
         path in
         if path.status == .satisfied
         {
            // Indicate network status, e.g., back to online
         }
         else
         {
            // Indicate network status, e.g., offline mode
         }

         if path.isExpensive
         {
            // Using an expensive interface, such as Cellular or a Personal Hotspot
         }

         if path.isConstrained
         {
            // Using Low Data Mode
         }
      }
      monitor.start( queue: .global() ) // Deliver updates on the background queue
   }

   func resetCallCount()
   {
      callCount = 0
   }

   // /agencies/
   func agencyList() -> [AgencyJSON]
   {
      return getAPIList( with: AgencyListRequest( baseURL: self.baseURL ) )
   }

   // /agencies/{id}
   func agency( withID id: Int64 ) -> AgencyJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)agencies/\(id)" )
   }

   // /astronaut/
   func astronautList() -> [AstronautJSON]
   {
      return getAPIList( with: AstronautListRequest( baseURL: self.baseURL ) )
   }

   // /astronaut/{id}
   func astronaut( withID id: Int64 ) -> AstronautJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)astronaut/\(id)" )
   }

   // /config/agencytype/
   func agencyTypeList() -> [IDNameJSON]
   {
      return getResults( withURL: "\(API_URL_BASE)config/agencytype/" )
   }

   // /config/agencytype/{id}
   func agencyType( withID id: Int64 ) -> IDNameJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)config/agencytype/\(id)" )
   }

   // /config/astronautrole/
   func astronautRoleList() -> [IDNameJSON]
   {
      return getResults( withURL: "\(API_URL_BASE)config/astronautrole/" )
   }

   // /config/astronautrole/{id}
   func astronautRole( withID id: Int64 ) -> IDNameJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)config/astronautrole/\(id)" )
   }

   // /config/astronautstatus/
   func astronautStatusList() -> [IDNameJSON]
   {
      return getResults( withURL: "\(API_URL_BASE)config/astronautstatus/" )
   }

   // /config/astronautstatus/{id}
   func astronautStatus( withID id: Int64 ) -> IDNameJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)config/astronautstatus/\(id)" )
   }

   // /config/astronauttype/
   func astronautTypeList() -> [IDNameJSON]
   {
      return getResults( withURL: "\(API_URL_BASE)config/astronauttype/" )
   }

   // /config/astronauttype/{id}
   func astronautType( withID id: Int64 ) -> IDNameJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)config/astronauttype/\(id)" )
   }

   // /config/dockinglocation/
   func dockingLocationList() -> [IDNameJSON]
   {
      return getResults( withURL: "\(API_URL_BASE)config/dockinglocation/" )
   }

   // /config/dockinglocation/{id}
   func dockingLocation( withID id: Int64 ) -> IDNameJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)config/dockinglocation/\(id)" )
   }

   // /config/eventtype/
   func eventTypeList() -> [IDNameJSON]
   {
      return getResults( withURL: "\(API_URL_BASE)config/eventtype/" )
   }

   // /config/eventtype/{id}
   func eventType( withID id: Int64 ) -> IDNameJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)config/eventtype/\(id)" )
   }

   // /config/firststagetype/
   func firstStagetypeTypeList() -> [IDNameJSON]
   {
      return getResults( withURL: "\(API_URL_BASE)config/firststagetype/" )
   }

   // /config/firststagetype/{id}
   func firstStageType( withID id: Int64 ) -> IDNameJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)config/firststagetype/\(id)" )
   }

   // /config/landinglocation/
   func landingLocationList() -> [IDNameJSON]
   {
      return getResults( withURL: "\(API_URL_BASE)config/landinglocation/" )
   }

   // /config/landinglocation/{id}
   func landingLocation( withID id: Int64 ) -> IDNameJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)config/landinglocation/\(id)" )
   }

   // /config/launcher/
   func launcherList() -> [IDNameJSON]
   {
      return getResults( withURL: "\(API_URL_BASE)config/launcher/" )
   }

   // /config/launcher/{id}
   func launcher( withID id: Int64 ) -> IDNameJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)config/launcher/\(id)" )
   }

   // /config/launchstatus/
   func launchStatusList() -> [IDNameJSON]
   {
      return getResults( withURL: "\(API_URL_BASE)config/launchstatus/" )
   }

   // /config/launchstatus/{id}
   func launchStatus( withID id: Int64 ) -> IDNameJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)config/launchstatus/\(id)" )
   }

   // /config/missiontype/
   func missionTypeList() -> [IDNameJSON]
   {
      return getResults( withURL: "\(API_URL_BASE)config/missiontype/" )
   }

   // /config/missiontype/{id}
   func missionType( withID id: Int64 ) -> IDNameJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)config/missiontype/\(id)" )
   }

   // /config/noticetype/
   func noticeTypeList() -> [IDNameJSON]
   {
      return getResults( withURL: "\(API_URL_BASE)config/noticetype/" )
   }

   // /config/noticetype/{id}
   func noticeType( withID id: Int64 ) -> IDNameJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)config/noticetype/\(id)" )
   }

   // /config/orbit/
   func orbitList() -> [IDNameJSON]
   {
      return getResults( withURL: "\(API_URL_BASE)config/orbit/" )
   }

   // /config/orbit/{id}
   func orbit( withID id: Int64 ) -> IDNameJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)config/orbit/\(id)" )
   }

   // /config/roadclosurestatus/
   func roadClosureStatusList() -> [IDNameJSON]
   {
      return getResults( withURL: "\(API_URL_BASE)config/roadclosurestatus/" )
   }

   // /config/roadclosurestatus/{id}
   func roadClosureStatus( withID id: Int64 ) -> IDNameJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)config/roadclosurestatus/\(id)" )
   }

   // /config/spacecraft/
   func spacecraftList() -> [IDNameJSON]
   {
      return getResults( withURL: "\(API_URL_BASE)config/spacecraft/" )
   }

   // /config/spacecraft/{id}
   func spacecraft( withID id: Int64 ) -> IDNameJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)config/spacecraft/\(id)" )
   }

   // /config/spacecraftstatus/
   func spacecraftStatusList() -> [IDNameJSON]
   {
      return getResults( withURL: "\(API_URL_BASE)config/spacecraftstatus/" )
   }

   // /config/spacecraftstatus/{id}
   func spacecraftStatus( withID id: Int64 ) -> IDNameJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)config/spacecraftstatus/\(id)" )
   }

   // /config/spacestationstatus/
   func spaceStationStatusList() -> [IDNameJSON]
   {
      return getResults( withURL: "\(API_URL_BASE)config/spacestationstatus/" )
   }

   // /config/spacestationstatus/{id}
   func spaceStationStatus( withID id: Int64 ) -> IDNameJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)config/spacestationstatus/\(id)" )
   }

   // /dashboard/starship/

   // /docking_event/

   // /docking_event/{id}

   // /event/

   // /event/{id}

   // /event/previous/

   // /event/previous/{id}

   // /event/upcoming

   // /event/upcoming/{id}

   // /expedition/

   // /expedition/{id}

   // /launch/
   func getAPILaunches() -> [LaunchJSON]
   {
      return getAPIList( with: LaunchRequest( baseURL: self.baseURL, endPoint: "launch/" ) )
   }

   // /launch/{id}

   // /launch/previous/
   func getAPIPreviousLaunches() -> [LaunchJSON]
   {
      return getAPIList( with: LaunchRequest( baseURL: self.baseURL, endPoint: "launch/previous/" ) )
   }

   // /launch/previous/{id}
   func getAPIPreviousLaunch( withID id: Int64 ) -> LaunchJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)launch/previous/\(id)" )
   }

   // /launch/upcoming
   func getAPIUpcomingLaunches() -> [LaunchJSON]
   {
      return getAPIList( with: LaunchRequest( baseURL: self.baseURL, endPoint: "launch/upcoming/" ) )
   }

   // /launch/upcoming/{id}
   func getAPIUpcomingLaunch( withID id: Int64 ) -> LaunchJSON?
   {
      return getAPIRecord( withURL: "\(API_URL_BASE)launch/upcoming/\(id)" )
   }

   // /launcher/
   // /launcher/{id}
   // /location/
   // /location/{id}
   // /pad/
   // /pad/{id}
   // /program/
   // /program/{id}
   // /spacecraft/
   // /spacecraft/{id}
   // /spacecraft/flight/
   // /spacecraft/flight/{id}
   // /spacestation/
   // /spacestation/{id}
   // /updates/
   // /updates/{id}

   /**
    Synchronously fetch a JSON record from the API.

    - parameter urlString: JSON URL to fetch
    - returns              JSON record, if any
    */
   func getAPIJSON( urlString: String ) -> JSONStructure?
   {
      callCount += 1
      guard let apiURL: URL = URL( string: urlString ) else { return nil }
      let apiResult: SessionResult = URLSession.shared.synchronousDataTask( with: apiURL )
      // test and report errors
      guard let data: Data = apiResult.data else { return nil }
      return parseJSON( data: data )
   }

   func getAPIRecord< T: JSONElement >( withURL url: String ) -> T?
   {
      return T( getAPIJSON( urlString: url ) )
   }

   func getAPIList< T: JSONElement >( with apiRequest: APIListRequest ) -> [T]
   {
      var request: APIListRequest? = apiRequest
      var result: [T] = []
      while let currentRequest: APIListRequest = request
      {
         guard let json: JSONStructure = getAPIJSON( urlString: currentRequest.requestURL ) else { break }
         let sublist: [T] = parseArray( json[ "sublist" ] )
         result.append( contentsOf: sublist )
         request = apiRequest.getNextRequest( count: sublist.count )
      }

      return result
   }

   func getResults( withURL url: String ) -> [IDNameJSON]
   {
      guard let json: JSONStructure = getAPIJSON( urlString: url ) else { return [] }
      return parseArray( json[ "results" ] )
   }
}

typealias SessionResult = ( data: Data?, response: URLResponse?, error: Error? )

extension URLSession
{
   func synchronousDataTask( with url: URL ) -> SessionResult
   {
      var data: Data?
      var response: URLResponse?
      var error: Error?

      let semaphore: DispatchSemaphore = DispatchSemaphore( value: 0 )

      let dataTask: URLSessionDataTask = self.dataTask( with: url )
      {
         data = $0
         response = $1
         error = $2

         semaphore.signal()
      }
      dataTask.resume()

      _ = semaphore.wait( timeout: .distantFuture )

      return ( data, response, error )
   }
}

/**
 
 */
class NetworkingHandler: NSObject, URLSessionDelegate
{
   func urlSession( _ session: URLSession, taskIsWaitingForConnectivity task: URLSessionTask )
   {
      // Indicate network status, e.g., offline mode
   }

   func urlSession( _ session: URLSession, task: URLSessionTask, willBeginDelayedRequest: URLRequest,
                    completionHandler: (URLSession.DelayedRequestDisposition, URLRequest?) -> Void )
   {
      // Indicate network status, e.g., back to online
   }
}
