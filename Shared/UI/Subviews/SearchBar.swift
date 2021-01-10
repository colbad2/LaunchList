// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct SearchBar: View
{
   @Binding var text: String

   @State private var isEditing = false

   var body: some View
   {
      HStack
      {
         TextField( "Search...", text: $text )
            .padding( 7 )
            .padding( .horizontal, 25 )
            .background( Color(.systemGray6 ) )
            .cornerRadius( 8 )
            .overlay(
               HStack
               {
                  Image( systemName: "magnifyingglass")
                     .foregroundColor( .gray )
//                     .frame( minWidth: 0, maxWidth: .infinity )
                     .padding( .leading, 8 )
                  Spacer()
                  if isEditing
                  {
                     Button( action:
                              {
                                 self.isEditing = false
                                 self.text = ""
                                 UIApplication.shared.sendAction( #selector( UIResponder.resignFirstResponder ), to: nil, from: nil, for: nil  )
                              } )
                     {
                        Image( systemName: "multiply.circle" )
                           .foregroundColor( .gray )
                           .padding( .trailing, 8 )
                     }
                  }
               }
            )
            .padding( .horizontal, 10 )
            .onTapGesture {
               self.isEditing = true
            }

         if isEditing
         {
            Button( action:
                     {
                        self.isEditing = false
                        self.text = ""
                        UIApplication.shared.sendAction( #selector( UIResponder.resignFirstResponder ), to: nil, from: nil, for: nil  )
                     } )
            {
               Text( "Cancel" )
            }
            .padding( .trailing, 10 )
            .transition( .move( edge: .trailing ) )
            .animation( .default )
         }
      }
   }
}

struct SearchBarPreview: PreviewProvider
{
   static var previews: some View
   {
      SearchBar( text: .constant( "" ) )
   }
}
