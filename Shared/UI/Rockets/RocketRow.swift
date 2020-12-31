import Foundation
import SwiftUI

struct RocketRow: View
{
   var rocket: Rocket

   var body: some View
   {
      TitleField( s: rocket.fullName! )
   }
}
