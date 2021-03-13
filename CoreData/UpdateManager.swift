// Copyright © 2021 Bradford Holcombe. All rights reserved.

import Foundation

/**
 Central point for updating the CoreData context from the API.

 The API has a call limit of 100 calls per day.

 We reserve calls for days on which a launch is scheduled (to update launch info), and some for manual updates.
 The rest of the calls can be used to update records, or fill in details.
 */
public class UpdateManger
{
   static let shared: UpdateManger = UpdateManger()

   /**
    Start the full update process.
    */
   public func update()
   {
      // create update call list
      // execute each update
   }
}
