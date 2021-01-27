// Copyright © 2021 Bradford Holcombe. All rights reserved.

import Foundation
import Network

// see https://www.vadimbulavin.com/network-connectivity-on-ios-with-swift/

// swiftlint:disable identifier_name
/** Location of the API. */
let API_URL_BASE: String = "https://ll.thespacedevs.com/2.1.0/"
// swiftlint:enable identifier_name

struct APIManager
{
   static let shared: APIManager = APIManager()

   init()
   {
      let config: URLSessionConfiguration = URLSessionConfiguration.default
      config.waitsForConnectivity = true
      config.timeoutIntervalForResource = 300
      config.allowsConstrainedNetworkAccess = false

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

   func fetchAPIAgencies()
   {
      getAPIAgencies( with: AgencyRequest( base: API_URL_BASE, endPoint: "agencies/" ) )
   }

   func fetchAPIAgency( withID id: Int64 )
   {
      getAPIAgency( withID: id )
   }

   func fetchAPILaunches()
   {
      getAPILaunches( with: LaunchRequest( base: API_URL_BASE, endPoint: "launch/" ) )
   }

   func fetchAPIUpcomingLaunches()
   {
      getAPILaunches( with: LaunchRequest( base: API_URL_BASE, endPoint: "launch/upcoming/" ) )
   }

   func fetchAPIPreviousLaunches()
   {
      getAPILaunches( with: LaunchRequest( base: API_URL_BASE, endPoint: "launch/previous/" ) )
   }

   // TODO get previous launch by ID
   // TODO get upcoming launch by ID
}

func getAPIAgency( withID id: Int64 )
{
   var json: AgencyJSON?
   loadJSON( fromAPI: "\(API_URL_BASE)agencies/\(id)" )
   {
      result in

      switch result
      {
         case .success( let data ): json = parseJSONString( jsonData: data )
         case .failure( let error ): print( error ); return
      }
   }
   guard let agencyJSON: AgencyJSON = json else { return }
   _ = fetchAgency( agency: agencyJSON, context: PersistenceController.shared.container.viewContext )
}

func getAPIAgencies( with apiRequest: AgencyRequest )
{
   var request: APIRequest? = apiRequest
   while let currentRequest: APIRequest = request
   {
      var json: AgenciesListJSON?
      loadJSON( fromAPI: currentRequest.requestURL )
      {
         result in

         switch result
         {
            case .success( let data ): json = parseJSONString( jsonData: data )
            case .failure( let error ): print( error ); return
         }
      }
      guard let responseJSON: AgenciesListJSON = json else { break }

      for agencyJSON: AgencyJSON in responseJSON.sublist ?? []
      {
         _ = fetchAgency( agency: agencyJSON, context: PersistenceController.shared.container.viewContext )
      }

      request = apiRequest.getNextRequest( count: responseJSON.totalCount )
   }
}

/*
 Fill the database with the results of an API call that returns a `LaunchListJSON`.

 - parameter: apiRequest - {LaunchRequest} parameters for the API call
 */
func getAPILaunches( with apiRequest: LaunchRequest )
{
   var request: APIRequest? = apiRequest
   while let currentRequest: APIRequest = request
   {
      var json: LaunchListJSON?
      loadJSON( fromAPI: currentRequest.requestURL )
      {
         result in

         switch result
         {
            case .success( let data ): json = parseJSONString( jsonData: data )
            case .failure( let error ): print( error ); return
         }
      }
      guard let responseJSON: LaunchListJSON = json else { break }

      for launchJSON in responseJSON.sublist ?? []
      {
         _ = fetchLaunch( launch: launchJSON, context: PersistenceController.shared.container.viewContext )
      }

      request = apiRequest.getNextRequest( count: responseJSON.totalCount )
   }
}

/**
 Loads data from the API.

 - parameter apiString: `String` API URL
 - parameter completion: callback for successful load
 */
private func loadJSON( fromAPI apiString: String,
                       completion: @escaping ( Result< Data, Error > ) -> Void )
{
   guard let url = URL( string: apiString ) else { return }

   let urlSession: URLSessionDataTask =
      URLSession( configuration: .default, delegate: NetworkingHandler(), delegateQueue: .main ).dataTask( with: url )
      {
         data, _, error in

         if let error: Error = error
         {
            completion( .failure( error ) )
         }

         if let data: Data = data
         {
            completion( .success( data ) )
         }
      }

   urlSession.resume()
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
