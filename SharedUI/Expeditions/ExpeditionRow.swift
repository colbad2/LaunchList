// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct ExpeditionRow: View
{
   var expedition: Expedition

   var body: some View
   {
      RowImage( imageURL: expedition.spaceStation?.imageURL )
      VStack( alignment: .leading )
      {
         TitleField( text: expeditionTitle( expedition: expedition ) )
         GraySubheadlineText( text: expeditionDates( expedition: expedition ) )
      }
   }
}
