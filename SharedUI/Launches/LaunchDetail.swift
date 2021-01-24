// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct LaunchDetail: View
{
   var launch: Launch

   var body: some View
   {
      ScrollView
      {
         VStack
         {
            HStack( alignment: .top )
            {
               TitleField( text: missionName( launch ) )
               if let flags: String = allProgramFlags( launch: launch )
               {
                  Spacer()
                  Text( flags )
               }
            }
            TwoFields( leftString: launch.getProviderName(),
                       rightString: launch.rocket?.name ?? launch.name )
            TwoFields( leftString: launch.agency?.type,
                       rightString: launch.mission?.type )
            LeftField( text: launch.mission?.orbitName )
            if let start: Date = launch.windowStart
            {
               HStack
               {
                  GraySubheadlineText( text: tightDateString( start ).uppercased() )
                  Spacer()
                  if let end: Date = launch.windowEnd
                  {
                     if start != end
                     {
                        GraySubheadlineText( text: tightDateString( end ).uppercased() )
                     }
                  }
               }
            }
            if let pad: Pad = launch.pad
            {
               NavigationLink( destination: PadDetail( pad: pad ) )
               {
                  LeftField( text: pad.name )
               }
            }
         }

         if let windowStart: Date = launch.windowStart
         {
            let stopShowingCountdown: Date = windowStart + ( 60 * 60 * 5 )
            if Date() < stopShowingCountdown
            {
               Divider()
               CountdownView( targetTime: windowStart )
            }
         }

         if launch.inHold == true || launch.failReason != nil
         {
            Divider()
            HoldFailView( launch: launch )
         }
         DescriptionView( desc: launch.mission?.missionDescription )
         // IconView( withURL: launch.image )
         NavigationLink( destination: ImageViewer( withURL: launch.image ) )
         {
            LoadedImageView( withURL: launch.image )
         }
         LoadedImageView( withURL: launch.infographic )

         ProgramLinks( programs: launch.programsSet )
      }
      .padding()
      .navigationBarTitle( "Launch", displayMode: .inline )
   }
}

func allProgramFlags( launch: Launch ) -> String?
{
   var codes: Set< String > = Set< String >()
   for program in launch.programsSet
   {
      for code in getAllAgencyFlags( program: program ) { codes.insert(code ) }
//      if let agencies = program.agencies
//      {
//         for agency in agencies as! Set<Agency>
//         {
//            if let countryCodes = agency.countryCodes
//            {
//               for countryCode in countryCodes
//               {
//                  codes.insert( countryCode )
//               }
//            }
//         }
//      }
   }

   if codes.isEmpty { return nil }
   var result: String = ""
   for code in codes
   {
      if let flag: String = flag( for: code )
      {
         result += flag
      }
   }

   return result
}

#if DEBUG
struct LaunchPreview: PreviewProvider
{
   static var previews: some View
   {
      if let previewLaunch: Launch = getSampleLaunchEntity()
      {
         Group
         {
            NavigationView
            {
               LaunchDetail( launch: previewLaunch )
               //               .border( Color.blue )
            }
            .environment( \.colorScheme, .light )

            NavigationView
            {
               LaunchDetail( launch: previewLaunch )
               //               .border( Color.blue )
            }
            .environment( \.colorScheme, .dark )
         }
      }
   }
}
#endif
