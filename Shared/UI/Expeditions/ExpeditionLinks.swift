// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct ExpeditionLinks: View
{
   var expeditions: NSSet?

   var body: some View
   {
      if let expeditions = expeditions
      {
         if expeditions.count > 0
         {
            Divider()
            HStack
            {
               Text( "Expeditions" )
                  .font( .headline )
                  .foregroundColor( .secondary )
               Spacer()
            }
            ForEach( getExpeditionsArray( expeditions: expeditions ), id: \.self )
            {
               expedition in
               ExpeditionLink( expeditionID: expedition.id )
            }
         }
      }
   }
}
