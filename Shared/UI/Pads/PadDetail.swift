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
            AgencyLink( agencyID: pad.agencyID )
            IconView( withURL: pad.mapImage )
            LinkBarView( infoURL: pad.infoURL, wikiURL: pad.wikiURL, mapURL: pad.mapURL )

            // TODO country code?
         }
         .padding()
      }
      .navigationBarTitle( "Pad", displayMode: .inline )
   }
}

#if DEBUG
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
#endif
