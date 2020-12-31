import Foundation
import SwiftUI

struct AstronautRow: View
{
   var astronaut: Astronaut

   var body: some View
   {
      HStack
      {
         if let thumb = astronaut.profileImageThumbnail
         {
            IconView( withURL: thumb )
               .frame( width: 40, height: 60 )
            Spacer()
               .frame( width: 15 )
         }
         else
         {
            Spacer()
               .frame( width: 55 )
         }

         VStack( alignment: .leading )
         {
            TitleField( s: astronaut.name! )
            Text( astronaut.nationality! )
               .font( .subheadline )
               .foregroundColor( .secondary )
         }
      }
   }
}
