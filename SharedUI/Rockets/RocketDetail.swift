// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct RocketDetail: View
{
   var rocket: Rocket?

   var body: some View
   {
      ScrollView
      {
         TitleField( text: rocket?.family )
         LeftField( text: rocket?.variant )
      }
      .padding()
      .navigationBarTitle( "Rocket", displayMode: .inline )
   }
}

#if DEBUG
struct RocketPreview: PreviewProvider
{
   static var previews: some View
   {
      if let rocket: Rocket = getSampleRocketEntity()
      {
         Text( rocket.fullName ?? "" )
         RocketDetail( rocket: rocket )
      }
   }
}
#endif
