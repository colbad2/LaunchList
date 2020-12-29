import Foundation
import SwiftUI

struct Countdown: View
{
   @State var targetTime: Date?
   @State var parts: DateComponents?
   let timer = Timer.publish( every: 1, on: .main, in: .common ).autoconnect()

   var body: some View
   {
      HStack
      {
         TimerPiece( top: countdownSign( d: targetTime ), bottom: " " )
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
         input in

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

func countdownSign( d: Date? ) -> String
{
   if d == nil { return "T " }
   if d! < Date()
   {
      return "T+"

   }
   return "T-"
}

func countdownString( _ n: Int? ) -> String
{
   if n == nil { return "--" }
   if n! < 10 { return "0\(n!)" }

   return "\(n!)"
}


struct CountdownPreview: PreviewProvider
{
   static var previews: some View
   {
      Countdown( targetTime: Date().addingTimeInterval( 360000 ) )
   }
}
