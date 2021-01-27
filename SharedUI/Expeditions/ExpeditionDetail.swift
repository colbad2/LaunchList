// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct ExpeditionDetail: View
{
   var expedition: Expedition

   var body: some View
   {
      VStack
      {
         ScrollView
         {
            TitleField( text: expedition.name )
            NavigationLink( destination: SpaceStationDetail( spaceStation: expedition.spaceStation ) )
            {
               LeftField( prefix: "destination: ", text: expedition.spaceStation?.name )
            }
            LeftField( prefix: "began: ", text: dateString( parseISODate( isoDate: expedition.start ) ) )
            LeftField( prefix: "ended: ", text: dateString( parseISODate( isoDate: expedition.end ) ) )
            LeftField( prefix: "orbit: ", text: expedition.spaceStation?.orbit )

            LoadedImageView( withURL: expedition.spaceStation?.imageURL )
         }
         .padding()
      }
      .navigationTitle( "Expedition" )
      .navigationBarTitleDisplayMode( .inline )
   }
}

#if DEBUG
struct ExpeditionPreview: PreviewProvider
{
   static var previews: some View
   {
      if let expedition: Expedition = getSampleExpeditionEntity()
      {
         ExpeditionDetail( expedition: expedition )
      }
   }
}
#endif
