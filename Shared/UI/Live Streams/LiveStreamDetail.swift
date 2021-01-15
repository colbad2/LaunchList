// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI
import CoreData

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
                  if let streamURL = wrapURL( liveStream.url )
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
      let context = PersistenceController.preview.container.viewContext
      let liveStream = getEntityByID( entityID: 276,
                                      context: context,
                                      entityName: "LiveStream" ) as? LiveStream
      LiveStreamDetail( liveStream: liveStream! )
   }
}
#endif
