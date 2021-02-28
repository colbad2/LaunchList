// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct RocketDetail: View
{
   var rocket: Rocket?

   var body: some View
   {
      ScrollView
      {
         TitleField( text: rocket?.configuration?.family )
         LeftField( text: rocket?.configuration?.variant )
      }
      .padding()
      .navigationTitle( "Rocket" )
      .navigationBarTitleDisplayMode( .inline )
   }
}

#if DEBUG
struct RocketPreview: PreviewProvider
{
   static var previews: some View
   {
      if let rocket: Rocket = getSampleRocketEntity()
      {
         Text( rocket.configuration?.fullName ?? "" )
         RocketDetail( rocket: rocket )
      }
   }
}
#endif
