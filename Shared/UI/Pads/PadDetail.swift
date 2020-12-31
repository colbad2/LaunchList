import Foundation
import SwiftUI
import CoreData

struct PadDetail: View
{
   var pad: Pad

   var body: some View
   {
      VStack
      {
         ScrollView
         {
            TitleField( s: pad.name )
            LeftField( s: pad.location?.name )
            LeftField( s: "\(pad.latitude!), \(pad.longitude!)" )

            // TODO need CD context here before adding this
//            if let agencyID = pad?.agencyID
//            {
//               let agency = getAgency( by: agencyID, context: context )
//               Text( "\(agencyID)" ) // TODO link to agency detail
//            }

            if let mapImage = pad.mapImage
            {
               IconView( withURL: mapImage )
            }

            LinkBarView( infoURL: pad.infoURL, wikiURL: pad.wikiURL, mapURL: pad.mapURL )

            // TODO country code?
         }
         .padding()
      }
      .navigationBarTitle( "Pad", displayMode: .inline )
   }
}

struct PadPreview: PreviewProvider
{
   static var previews: some View
   {
      let context = PersistenceController.preview.container.viewContext
      let pad = getEntityByID( id: 87,
                               context: context,
                               entityName: "Pad" ) as! Pad
      PadDetail( pad: pad )
   }
}
