// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct SpacecraftRow: View
{
   var spacecraft: Spacecraft?

   var body: some View
   {
      if let spacecraft: Spacecraft = spacecraft
      {
         RowImage( imageURL: spacecraft.spacecraftConfig?.imageURL )
         VStack( alignment: .leading )
         {
            TitleField( text: spacecraft.name )
            HStack
            {
            }
         }
      }
   }
}
