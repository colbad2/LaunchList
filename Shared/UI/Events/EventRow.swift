//
//  EventRow.swift
//  LaunchList
//
//  Created by Bradford Holcombe on 1/2/21.
//  Copyright © 2021 Bradford Holcombe. All rights reserved.
//

import Foundation
import SwiftUI

struct EventRow: View
{
   var event: Event

   var body: some View
   {
      HStack
      {
         VStack( alignment: .leading )
         {
            TitleField( s: event.name! )
         }
      }
   }
}
