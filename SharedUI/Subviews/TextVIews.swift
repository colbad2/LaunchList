// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct GrayHeadlineText: View
{
   var text: String?

   var body: some View
   {
      if let text: String = text
      {
         HStack
         {
            Text( text )
               .font( .headline )
               .foregroundColor( .secondary )
               .fixedSize( horizontal: false, vertical: true )
            Spacer()
         }
      }
   }
}

struct BlackHeadlineText: View
{
   var text: String?

   var body: some View
   {
      if let text: String = text
      {
         Text( text )
            .font( .headline )
            .fixedSize( horizontal: false, vertical: true )
      }
   }
}

struct GraySubheadlineText: View
{
   var text: String?

   var body: some View
   {
      if let text: String = text
      {
         Text( text )
            .font( .subheadline )
            .foregroundColor( .secondary )
            .fixedSize( horizontal: false, vertical: true )
      }
   }
}

struct BlackSubheadlineText: View
{
   var text: String?

   var body: some View
   {
      if let text: String = text
      {
         Text( text )
            .font( .subheadline )
            .fixedSize( horizontal: false, vertical: true )
      }
   }
}
