// Copyright © 2021 Bradford Holcombe. All rights reserved.

import Foundation

extension NSRegularExpression
{
   /**
    Constructor for internal searches that will be fixed at compile time, if the search string is bad. Use
    the normal constructor if the pattern is being entered at runtime. Lets you make a regex without wrapping
    it in a try!.

    - Parameter pattern: regex patten
    */
   convenience init( _ pattern: String )
   {
      do
      {
         try self.init( pattern: pattern )
      }
      catch
      {
         preconditionFailure( "Illegal regular expression: \(pattern)." )
      }
   }

   /**
    Returns true if the whole input string matched the pattern somewhere.

    - Parameter string: string to search using the regex pattern
    - Returns: true if the string matched the pattern
    */
   func matches( _ string: String ) -> Bool
   {
       let range = NSRange( location: 0, length: string.utf16.count )
       return firstMatch( in: string, options: [], range: range ) != nil
   }
}

extension String
{
   /**
    Runs a search of lhs using the pattern on the rhs.

        "Hello, world!" ~= "[HJ]ello"

    would return true.

    - Parameter lhs: string to search
    - Parameter rhs: regex pattern
    */
   static func ~= ( lhs: String, rhs: String ) -> Bool
   {
      return NSRegularExpression( rhs ).matches( lhs )
   }
}
