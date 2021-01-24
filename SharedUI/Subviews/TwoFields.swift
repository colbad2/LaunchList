// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct TwoFields: View
{
   var leftPrefix: String?
   var leftString: String?
   var rightPrefix: String?
   var rightString: String?

   var body: some View
   {
      if leftString != nil || rightString != nil
      {
         HStack( alignment: .top )
         {
            if leftString != nil
            {
               GraySubheadlineText( text: "\(leftPrefix ?? "")\(leftString ?? "")" )
            }
            Spacer()
            if rightString != nil
            {
               GraySubheadlineText( text: "\(rightPrefix ?? "")\(rightString ?? "")" )
            }
         }
      }
   }
}

#if DEBUG
struct TwoFieldsPreview: PreviewProvider
{
   static var previews: some View
   {
      Group
      {
         NavigationView
         {
            TwoFields( leftPrefix: "prefix1: ", leftString: "string1",
                       rightPrefix: "prefix2: ", rightString: "string2" )
               .padding()
         }
         .environment( \.colorScheme, .light )

         NavigationView
         {
            TwoFields( leftPrefix: "pre1 ", leftString: "s1", rightPrefix: "pre2 ", rightString: "s2" )
               .padding()
         }
         .environment( \.colorScheme, .dark )
      }
   }
}
#endif
