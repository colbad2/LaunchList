// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct SocialMediaLink: View
{
   var linkURL: String?
   var title: String

   var body: some View
   {
      if let url: String = linkURL,
         let socialMediaURL: URL = wrapURL( url )
      {
         HStack
         {
            Link( title, destination: socialMediaURL )
               .font( .subheadline )
            // Spacer()
         }
      }
   }
}
