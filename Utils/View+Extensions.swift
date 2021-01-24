// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

extension View
{
   func debugAction( _ closure: () -> Void ) -> Self
   {
      #if DEBUG
      closure()
      #endif

      return self
   }

   func debugPrint( _ value: Any ) -> Self
   {
      debugAction { print( value ) }
   }
}

extension View
{
   func debugModifier< T: View >( _ modifier: ( Self ) -> T ) -> some View
   {
      #if DEBUG
      return modifier(self)
      #else
      return self
      #endif
   }

   func debugBorder( _ color: Color = .red, width: CGFloat = 1 ) -> some View
   {
      debugModifier
      {
         $0.border(color, width: width)
      }
   }

   func debugBackground( _ color: Color = .red ) -> some View
   {
      debugModifier
      {
         $0.background( color )
      }
   }
}

/*
 Button( action: { self.indexPathToSetVisible = IndexPath( row: 0, section: 0 ) },
 label: { Image( systemName: "arrow.up.to.line" ) } )

 becomes

 Button( iconName: "arrow.up.to.line" ) { self.indexPathToSetVisible = IndexPath( row: 0, section: 0 ) }
 */
extension Button where Label == Image
{
   init( iconName: String, action: @escaping () -> Void )
   {
      self.init( action: action )
      {
         Image( systemName: iconName )
      }
   }
}
