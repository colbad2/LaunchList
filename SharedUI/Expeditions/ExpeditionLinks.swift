// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct ExpeditionLinks: View
{
   var expeditions: Set< Expedition >

   var body: some View
   {
      if !expeditions.isEmpty
      {
         Divider()
         GrayHeadlineText( text: "Expeditions" )
         ForEach( sortExpeditionsByName( expeditionArray: Array( expeditions ) ) )
         {
            expedition in
            ExpeditionLink( expeditionID: expedition.id )
         }
      }
   }
}
