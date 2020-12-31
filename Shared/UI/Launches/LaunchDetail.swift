import Foundation
import SwiftUI
import CoreData

struct LaunchDetail: View
{
   var launch: Launch

   var body: some View
   {
      VStack
      {
         ScrollView
         {
            VStack
            {
               TitleField( s: missionName( launch ) )
               TwoFields( leftString: launch.getProviderName(),
                          rightString: launch.rocket?.name ?? launch.name )
               TwoFields( leftString: launch.serviceProvider?.type,
                          rightString: launch.mission?.type )
               LeftField( prefix: "Orbit: ", s: launch.mission?.orbitName )
               NavigationLink( destination: PadDetail( pad: launch.pad! ) )
               {
                  LeftField( s: launch.pad?.name )
               }
            }

            if let windowStart = launch.windowStart
            {
               let stopShowingCountdown = windowStart + ( 60 * 60 * 5 )
               if Date() < stopShowingCountdown
               {
                  Divider()
                  Countdown( targetTime: windowStart )
               }
            }

            if launch.inHold == true || launch.failReason != nil
            {
               Divider()

               if launch.inHold == true
               {
                  HStack
                  {
                     Text( "HOLD" )
                        .foregroundColor( .orange )
                     Spacer()
                     Text( "\(launch.holdReason ?? "")" )
                  }
               }

               if launch.failReason != nil
               {
                  HStack( alignment: .top )
                  {
                     Text( "FAIL" )
                        .foregroundColor( .red )
                     Spacer()
                     Text( "\(launch.failReason ?? "")" )
                  }
               }
            }

            DescriptionView( desc: launch.mission?.missionDescription )

            if let imageURL = launch.image
            {
               IconView( withURL: imageURL )
            }

            if let infographic = launch.infographic
            {
               IconView( withURL: infographic )
            }
         }
         .padding()
      }
      .navigationBarTitle( "Launch", displayMode: .inline )
   }
}

struct LaunchPreview: PreviewProvider
{
   static var previews: some View
   {
      let context = PersistenceController.preview.container.viewContext
      let launch = getEntityByID( id: "724dd8ce-78ec-4dad-b17c-ff66c257fab7",
                                  context: context,
                                  entityName: "Launch" ) as? Launch
      // TODO launch nil
      LaunchDetail( launch: launch! )
   }
}
