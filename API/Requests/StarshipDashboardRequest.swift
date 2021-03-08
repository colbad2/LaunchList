// Copyright © 2021 Bradford Holcombe. All rights reserved.

public class StarshipDashboardRequest: BaseAPIRequest
{
   /**
    Creates a request for a specific type, with a specific ID.

    - parameter baseURL: `String` base part of the constructed request URL
    */
   init( baseURL: String )
   {
      super.init( base: baseURL, endPoint: "/dashboard/starship/" )
   }
}
