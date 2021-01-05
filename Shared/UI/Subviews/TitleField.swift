import SwiftUI

struct TitleField: View
{
   var s: String?

   var body: some View
   {
      if s != nil
      {
         HStack
         {
            Text( "\(s!)" )
               .font( .title2 )
               .bold()
               .foregroundColor( .primary )
               .lineLimit( 3 )
            Spacer()
         }
      }
   }
}

#if DEBUG
struct TitleFieldPreview: PreviewProvider
{
   static var previews: some View
   {
      Group
      {
         NavigationView
         {
            TitleField( s: "Title" )
         }
         .environment( \.colorScheme, .light )

         NavigationView
         {
            TitleField( s: "Title" )
         }
         .environment( \.colorScheme, .dark )
      }
   }
}
#endif
