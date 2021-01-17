// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct MissionDetail: View
{
   var mission: Mission?

   var body: some View
   {
      ScrollView
      {
         VStack
         {
            TitleField( text: mission?.name )
            LeftField( text: mission?.type )
            LeftField( text: mission?.orbitName  )
            DescriptionView( desc: mission?.missionDescription )
         }
      }
      .padding()
   }
}

#if DEBUG
struct MissionDetailPreview: PreviewProvider
{
   static var previews: some View
   {
      if let mission: Mission = getSampleMissionEntity()
      {
         NavigationView
         {
            MissionDetail( mission: mission )
         }
      }
   }
}
#endif
