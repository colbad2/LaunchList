// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

/**
 View of the details of a `LiveStream`.

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
            LoadedImageView( withURL: liveStream.image )
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
 Preview view of the `LiveStreamDetail`
 */
#if DEBUG
struct LiveStreamPreview: PreviewProvider
{
   static var previews: some View
   {
      if let liveStream: LiveStream = getSampleLiveStreamEntity()
      {
         LiveStreamDetail( liveStream: liveStream )
      }
   }
}
#endif
