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
               HStack( alignment: .top )
               {
                  TitleField( s: missionName( launch ) )
                  let flags: String? = allProgramFlags( launch: launch )
                  if flags != nil
                  {
                     Spacer()
                     Text( flags! )
                  }
               }
               TwoFields( leftString: launch.getProviderName(),
                          rightString: launch.rocket?.name ?? launch.name )
               TwoFields( leftString: launch.serviceProvider?.type,
                          rightString: launch.mission?.type )
               LeftField( s: launch.mission?.orbitName )
               HStack
               {
                  // TODO if start and end same, skip end
                  // TODO if no end, then blank
                  // TODO if now past end,
                  Text( "\(launch.windowStart!, formatter: LaunchRow.taskDateFormat)" )
                     .font( .subheadline )
                     .foregroundColor( .secondary )
                     .textCase( .uppercase )
                  Spacer()
                  Text( "\(launch.windowEnd!, formatter: LaunchRow.taskDateFormat)" )
                     .font( .subheadline )
                     .foregroundColor( .secondary )
                     .textCase( .uppercase )
               }
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
            // IconView( withURL: launch.image )

            NavigationLink( destination: ImageViewer( withURL: launch.image ) )
            {
               IconView( withURL: launch.image )
            }
            IconView( withURL: launch.infographic )
         }
         .padding()
      }
      .navigationBarTitle( "Launch", displayMode: .inline )
   }
}

func allProgramFlags( launch: Launch ) -> String?
{
   if launch.programs == nil { return nil }

   var codes = Set< String >()
   for program in launch.programs! as! Set<Program>
   {
      if let agencies = program.agencies
      {
         for agency in agencies as! Set<Agency>
         {
            if let countryCodes = agency.countryCodes
            {
               for countryCode in countryCodes
               {
                  codes.insert( countryCode )
               }
            }
         }
      }
   }

   if codes.count == 0 { return nil }
   var result = ""
   for code in codes
   {
      if let f = flag( for: code )
      {
         result += f
      }
   }

   return result
}

#if DEBUG
struct LaunchPreview: PreviewProvider
{
   static var previews: some View
   {
      let context = PersistenceController.preview.container.viewContext
      let launch = getEntityByID( id: "724dd8ce-78ec-4dad-b17c-ff66c257fab7",
                                  context: context,
                                  entityName: "Launch" ) as? Launch

      Group
      {
         NavigationView
         {
            LaunchDetail( launch: launch! )
//               .border( Color.blue )
         }
         .environment( \.colorScheme, .light )
         
         NavigationView
         {
            LaunchDetail( launch: launch! )
//               .border( Color.blue )
         }
         .environment( \.colorScheme, .dark )
      }
   }
}
#endif