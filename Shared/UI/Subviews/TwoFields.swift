import SwiftUI

struct TwoFields: View
{
   var leftPrefix: String?
   var leftString: String?
   var rightPrefix: String?
   var rightString: String?

   var body: some View
   {
      if leftString != nil || rightString != nil
      {
         HStack( alignment: .top )
         {
            if leftString != nil
            {
               Text( "\(leftPrefix ?? "")\(leftString!)" )
                  .font( .subheadline )
                  .foregroundColor( .secondary )
            }
            Spacer()
            if rightString != nil
            {
               Text( "\(rightPrefix ?? "")\(rightString!)" )
                  .font( .subheadline )
                  .foregroundColor( .secondary )
            }
         }
      }
   }
}

#if DEBUG
struct TwoFieldsPreview: PreviewProvider
{
   static var previews: some View
   {
      Group
      {
         NavigationView
         {
            TwoFields( leftPrefix: "prefix1: ", leftString: "string1", rightPrefix: "prefix2: ", rightString: "string2" )
               .padding()
         }
         .environment( \.colorScheme, .light )

         NavigationView
         {
            TwoFields( leftPrefix: "pre1 ", leftString: "s1", rightPrefix: "pre2 ", rightString: "s2" )
               .padding()
         }
         .environment( \.colorScheme, .dark )
      }
   }
}
#endif