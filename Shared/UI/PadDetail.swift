import Foundation
import SwiftUI
import CoreData

struct PadDetail: View
{
   var pad: Pad?

   var body: some View
   {
      VStack
      {
         ScrollView
         {
            if let padName = pad?.name
            {
               Text( "\(padName)" )
                  .font( .title )
                  .foregroundColor( .primary )
            }

            if let padLocationName = pad?.location?.name
            {
               Text( "\(padLocationName)" )
                  .foregroundColor( .primary )
            }

            if let lat = pad?.latitude, let lon = pad?.longitude
            {
               Text( "\(lat), \(lon)" )
            }

            // Text( "\(pad?.agencyID ?? 0)" ) // TODO link to agency detail

            if let mapImage = pad?.mapImage
            {
               IconView( withURL: mapImage )
            }

            HStack
            {
               if let infoURL = pad?.infoURL,
                  let url = wrapURL( infoURL )
               {
                  Link( "Info", destination: url )
                     .font( .subheadline )
               }

               if let mapURL = pad?.mapURL,
                  let url = wrapURL( mapURL )
               {
                  Link( "Map", destination: url )
                     .font( .subheadline )
               }

               if let wikiURL = pad?.wikiURL,
                  let url = wrapURL( wikiURL )
               {
                  Link( "Wiki", destination: url )
                     .font( .subheadline )
               }
            }
            .padding()

            // TODO country code?
         }
         .padding()
      }
      .navigationTitle( "Pad" )
   }
}

struct PadPreview: PreviewProvider
{
   static var previews: some View
   {
      let pad = getFirstEntity( context: PersistenceController.preview.container.viewContext,
                                     entityName: "Pad") as? Pad
      PadDetail( pad: pad )
   }
}
