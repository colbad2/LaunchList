import Foundation
import SwiftUI
import CoreData

struct PadDetail: View
{
   var pad: Pad?

   var body: some View
   {
      ScrollView
      {
         Text( "\(pad?.name ?? "")" )
            .font( .title )
            .foregroundColor( .primary )
         Text( "\(pad?.location?.name ?? "")" )
            .foregroundColor( .primary )

         Text( "\(pad?.latitude ?? 0), \(pad?.longitude ?? 0)" )
         Text( "Launch count: \(pad?.totalLaunchCount ?? 0)" )
         // Text( "\(pad?.agencyID ?? 0)" ) // TODO link to agency detail

         if pad?.mapImage != nil
         {
            IconView( withURL: pad?.mapImage ?? "" )
         }

         HStack
         {
            if pad?.infoURL != nil
            {
               Link( "Info", destination: wrapURL( pad!.infoURL! )! )
                  .font(.subheadline)
            }

            if pad?.mapURL != nil
            {
               Link( "Map", destination: wrapURL( pad!.mapURL! )! )
                  .font(.subheadline)
            }

            if pad?.wikiURL != nil
            {
               Link( "Wiki", destination: wrapURL( pad!.wikiURL! )! )
                  .font(.subheadline)
            }
         }
      }
      .padding()
   }
}

struct PadPreview: PreviewProvider
{
   static var previews: some View
   {
      let managedObjectContext = PersistenceController.preview.container.viewContext
      let request = NSFetchRequest<NSFetchRequestResult>( entityName: "Pad" )
      let pad = try! managedObjectContext.fetch( request ).first as! Pad

      PadDetail( pad: pad )
   }
}
