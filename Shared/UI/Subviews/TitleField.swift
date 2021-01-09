import SwiftUI

struct TitleField: View
{
   var s: String?

   var body: some View
   {
      if let title = s
      {
         HStack
         {
            Text( title )
               .font( .title3 )
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
