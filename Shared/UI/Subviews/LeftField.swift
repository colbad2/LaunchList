import SwiftUI

struct LeftField: View
{
   var prefix: String = ""
   var s: String?

   var body: some View
   {
      if s != nil
      {
         HStack
         {
            Text( "\(prefix)\(s!)" )
               .font( .subheadline )
               .foregroundColor( .secondary )
               .lineLimit( 2 )
            Spacer()
         }
      }
   }
}

#if DEBUG
struct LeftFieldPreviews: PreviewProvider
{
   static var previews: some View
   {
      Group
      {
         LeftField( prefix: "Orbit:  ", s: "Low Earth Orbit" )
            .padding()
         LeftField( prefix: "", s: "Low Earth Orbit" )
            .padding()
      }
   }
}
#endif
