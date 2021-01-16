// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct LeftField: View
{
   var prefix: String = ""
   var text: String?

   var body: some View
   {
      if let fieldText: String = text
      {
         HStack
         {
            Text( "\(prefix)\(fieldText)" )
               .font( .subheadline )
               .foregroundColor( .secondary )
               .lineLimit( 2 )
            Spacer()
         }
      }
   }
}

#if DEBUG
struct LeftFieldPreviews: PreviewProvider
{
   static var previews: some View
   {
      Group
      {
         LeftField( prefix: "Orbit:  ", text: "Low Earth Orbit" )
            .padding()
         LeftField( prefix: "", text: "Low Earth Orbit" )
            .padding()
      }
   }
}
#endif
