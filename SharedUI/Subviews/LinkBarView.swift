// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct LinkBarView: View
{
   var links: [String: String]?

   var body: some View
   {
      if let linkPairs: [String: String] = links
      {
         HStack
         {
            ForEach( linkPairs.sorted( by: > ), id: \.key)
            {
               name, urlString in

               SocialMediaLink( linkURL: urlString, title: name )
            }
         }
         .padding()
      }
   }
}

#if DEBUG
struct LinkBarViewPreview: PreviewProvider
{
   static var previews: some View
   {
      Group
      {
         LinkBarView( links: [ "Info": "a", "Wiki": "b", "Map": "c" ] )
         .environment( \.colorScheme, .light )

         LinkBarView( links: [ "Info": "a", "Wiki": "b", "Map": "c" ] )
         .environment( \.colorScheme, .dark )
      }
   }
}
#endif
