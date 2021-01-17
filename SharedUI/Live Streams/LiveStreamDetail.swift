// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

/**
 View of the details of an [LiveStream].

 ### Usage
 LiveStreamDetail( liveStream: liveStreamEntity )
 */
struct LiveStreamDetail: View
{
   /** Entity with details to show. */
   var liveStream: LiveStream

   /** View contents. */
   var body: some View
   {
      VStack
      {
         ScrollView
         {
            TitleField( text: liveStream.title )
            IconView( withURL: liveStream.image )
            DescriptionView( desc: liveStream.liveStreamDescription )
            if liveStream.url != nil
            {
               HStack
               {
                  if let streamURL: URL = wrapURL( liveStream.url )
                  {
                     Link( "Live Stream", destination: streamURL )
                        .font( .subheadline )
                  }
               }
               .padding()
            }
         }
         .padding()
      }
      .navigationBarTitle( "LiveStream", displayMode: .inline )
   }
}

/**
 Preview view of the [LiveStreamDetail]
 */
#if DEBUG
struct LiveStreamPreview: PreviewProvider
{
   static var previews: some View
   {
      let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
      if let liveStream: LiveStream = getEntityByID( entityID: 276,
                                                     context: context,
                                                     entityName: LIVE_STREAM_ENTITY_NAME ) as? LiveStream
      {
         LiveStreamDetail( liveStream: liveStream )
      }
   }
}
#endif
