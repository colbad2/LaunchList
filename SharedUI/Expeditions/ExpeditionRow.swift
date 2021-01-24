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
         //         HStack
         //         {
         if let dates: String = expeditionDates( expedition: expedition )
         {
            // TODO gather these as a common View
            Text( dates )
               .font( .subheadline )
               .foregroundColor( .secondary )
            //                  .textCase( .uppercase )
         }
         //         }
      }
   }
}
