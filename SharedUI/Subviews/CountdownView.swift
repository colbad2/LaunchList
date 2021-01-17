// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct CountdownView: View
{
   @State var targetTime: Date?
   @State private var parts: DateComponents?
   // swiftlint:disable explicit_type_interface
   let timer =
      Timer.publish( every: 1, on: .main, in: .common ).autoconnect()
   // swiftlint:enable explicit_type_interface


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

         parts = Calendar.current.dateComponents( [ .day, .hour, .minute, .second ], from: Date(), to: targetTime ?? Date() )
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
   guard let date = countdownDate else { return "T " }
   if date < Date()
   {
      return "T+"
   }
   return "T-"
}

func countdownString( _ count: Int? ) -> String
{
   guard var countdownTimeString = count else { return "--" }
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
            CountdownView( targetTime: Date().addingTimeInterval( -360000 ) )
               .border( Color.blue )
         }
         .environment( \.colorScheme, .light )

         NavigationView
         {
            CountdownView( targetTime: Date().addingTimeInterval( -360000 ) )
               .border( Color.blue )
         }
         .environment( \.colorScheme, .dark )

         NavigationView
         {
            CountdownView( targetTime: Date().addingTimeInterval( -360000 ) )
               .environment( \.sizeCategory, .accessibilityExtraExtraExtraLarge )
         }
      }
   }
}
#endif
