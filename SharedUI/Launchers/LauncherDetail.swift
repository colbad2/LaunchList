// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct LauncherDetail: View
{
   var launcher: Launcher?

   var body: some View
   {
      ScrollView
      {
         TitleField( text: launcher?.launcherConfig?.fullName )
         LeftField( text: launcher?.serialNumber )
      }
      .padding()
      .navigationTitle( "Launcher" )
   }
}

#if DEBUG
struct LauncherPreview: PreviewProvider
{
   static var previews: some View
   {
      if let launcher: Launcher = getSampleLauncherEntity()
      {
         Text( launcher.launcherConfig?.fullName ?? "" )
         LauncherDetail( launcher: launcher )
      }
   }
}
#endif
