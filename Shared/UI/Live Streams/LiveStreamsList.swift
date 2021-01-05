// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI
import CoreData

struct LiveStreamList: View
{
   @FetchRequest( entity: LiveStream.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \LiveStream.title,
                                                       ascending: true ) ],
                  animation: .default )
   private var liveStreams: FetchedResults< LiveStream >

   var body: some View
   {
      List( liveStreams )
      {
         ( liveStream: LiveStream ) in

         NavigationLink( destination: LiveStreamDetail( liveStream: liveStream ) )
         {
            LiveStreamRow( liveStream: liveStream )
         }
      }
      .navigationBarTitle( "LiveStreams", displayMode: .inline )
   }
}

struct LiveStreamRow: View
{
   var liveStream: LiveStream

   var body: some View
   {
      RowImage( imageURL: liveStream.image )
      VStack( alignment: .leading )
      {
         TitleField( s: liveStream.title! )
      }
   }
}

#if DEBUG
struct LiveStreamPreviews: PreviewProvider
{
    static var previews: some View
    {
//      NavigationView
//      {
        LiveStreamList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
//      }
    }
}
#endif
