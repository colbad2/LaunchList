// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct SettingsView: View
{
   var body: some View
   {
      NavigationView
      {
         Form
         {
            Section( header: Text( "API" ) )
            {
               Text( "Settings" )
            }
            Section( header: Text( "Core Data" ) )
            {
               Text( "Stats" )
               Text( "Image loading" )
            }
         }
      }
      .navigationBarTitleDisplayMode( .inline )
      .toolbar( content:
      {
         ToolbarItem( placement: .navigationBarLeading, content: { Text( "Settings" ).font( .title ) } )
      })
   }
}
