// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct DescriptionView: View
{
   var desc: String?

   var body: some View
   {
      if let description: String = desc
      {
         VStack( alignment: .leading )
         {
            Divider()

            Text( description )
               .lineLimit( 50 )
               .layoutPriority( 200 )
               .fixedSize( horizontal: false, vertical: true )
            // here to force last line to draw, may be fixed in later SwiftUI releases
         }
      }
   }
}

#if DEBUG
struct DescriptionViewPreview: PreviewProvider
{
   static var previews: some View
   {
      Group
      {
         // swiftlint:disable line_length
         DescriptionView( desc: "The Shuttle–Mir program was a collaborative 11-mission space program between Russia and the United States that involved American Space Shuttles visiting the Russian space station Mir, Russian cosmonauts flying on the Shuttle, and an American astronaut flying aboard a Soyuz spacecraft to engage in long-duration expeditions aboard Mir." )
               .padding()

         DescriptionView( desc: "The International Space Station programme is tied together by a complex set of legal, political and financial agreements between the sixteen nations involved in the project, governing ownership of the various components, rights to crewing and utilization, and responsibilities for crew rotation and resupply of the International Space Station. It was conceived in 1984 by President Ronald Reagan, during the Space Station Freedom project as it was originally called." )
               .padding()
      }
   }
}
#endif
