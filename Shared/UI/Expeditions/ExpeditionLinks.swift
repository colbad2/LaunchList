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
         HStack
         {
            Text( "Expeditions" )
               .font( .headline )
               .foregroundColor( .secondary )
            Spacer()
         }
         ForEach( sortExpeditionsByName( expeditionArray: Array( expeditions ) ), id: \.self )
         {
            expedition in
            ExpeditionLink( expeditionID: expedition.id )
         }
      }
   }
}
