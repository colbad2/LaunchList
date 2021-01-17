// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct HoldFailView: View
{
   var launch: Launch

   var body: some View
   {
      if launch.inHold == true
      {
         HStack
         {
            Text( "HOLD" )
               .foregroundColor( .orange )
            if let holdReason: String = launch.holdReason
            {
               Spacer()
               Text( holdReason )
            }
         }
      }

      if launch.failReason != nil
      {
         HStack( alignment: .top )
         {
            Text( "FAIL" )
               .foregroundColor( .red )
            if let failReason: String = launch.failReason
            {
               Spacer()
               Text( failReason )
            }
         }
      }
   }
}
