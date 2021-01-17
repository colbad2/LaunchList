// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct TitleField: View
{
   var text: String?

   var body: some View
   {
      if let title: String = text
      {
         HStack
         {
            Text( title )
               .font( .title3 )
               .bold()
               .foregroundColor( .primary )
               .lineLimit( 3 )
            Spacer()
         }
      }
   }
}

#if DEBUG
struct TitleFieldPreview: PreviewProvider
{
   static var previews: some View
   {
      Group
      {
         NavigationView
         {
            TitleField( text: "Title" )
         }
         .environment( \.colorScheme, .light )

         NavigationView
         {
            TitleField( text: "Title" )
         }
         .environment( \.colorScheme, .dark )
      }
   }
}
#endif
