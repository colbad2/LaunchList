// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct Countdown: View
{
   @State var targetTime: Date?
   @State private var parts: DateComponents?
   let timer = Timer.publish( every: 1, on: .main, in: .common ).autoconnect()

   var body: some View
   {
      HStack
      {
         TimerPiece( top: countdownSign( countdownDate: targetTime ), bottom: " " )
         TimerPiece( top: countdownString( self.parts?.day ), bottom: "days" )
         TimerPiece( top: ":", bottom: " " )
         TimerPiece( top: countdownString( self.parts?.hour ), bottom: "hours" )
         TimerPiece( top: ":", bottom: " " )
         TimerPiece( top: countdownString( self.parts?.minute ), bottom: "mins" )
         TimerPiece( top: ":", bottom: " " )
         TimerPiece( top: countdownString( self.parts?.second ), bottom: "secs" )
      }
      .onReceive( timer )
      {
         _ in // input

         if targetTime == nil { targetTime = Date() }
         parts = Calendar.current.dateComponents( [ .day, .hour, .minute, .second ], from: Date(), to: targetTime! )
      }
   }
}

struct TimerPiece: View
{
   var top: String
   var bottom: String

   var body: some View
   {
      VStack
      {
         Text( top )
            .font( .body )
         Text( bottom )
            .font( .caption )
            .foregroundColor( .secondary )
      }
   }
}

func countdownSign( countdownDate: Date? ) -> String
{
   if countdownDate == nil { return "T " }
   if countdownDate! < Date()
   {
      return "T+"

   }
   return "T-"
}

func countdownString( _ count: Int? ) -> String
{
   if count == nil { return "--" }
   var countdownTimeString = count!
   if countdownTimeString < 0 { countdownTimeString = -countdownTimeString }
   if countdownTimeString < 10 { return "0\(countdownTimeString)" }

   return "\(countdownTimeString)"
}

#if DEBUG
struct CountdownPreview: PreviewProvider
{
   static var previews: some View
   {
      Group
      {
         NavigationView
         {
            Countdown( targetTime: Date().addingTimeInterval( -360000 ) )
               .border( Color.blue )
         }
         .environment( \.colorScheme, .light )

         NavigationView
         {
            Countdown( targetTime: Date().addingTimeInterval( -360000 ) )
               .border( Color.blue )
         }
         .environment( \.colorScheme, .dark )

         NavigationView
         {
            Countdown( targetTime: Date().addingTimeInterval( -360000 ) )
               .environment( \.sizeCategory, .accessibilityExtraExtraExtraLarge )
         }
      }
   }
}
#endif
