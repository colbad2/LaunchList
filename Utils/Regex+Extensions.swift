// Copyright © 2021 Bradford Holcombe. All rights reserved.

import Foundation

extension NSRegularExpression
{
   /**
    Constructor for internal searches that will be fixed at compile time, if the search string is bad. Use
    the normal constructor if the pattern is being entered at runtime. Lets you make a regex without wrapping
    it in a try!.

    - parameter pattern: `String` regex patten
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

    - parameter string: `String` string to search using the regex pattern
    - returns: `Bool` true if the string matched the pattern
    */
   func matches( _ string: String ) -> Bool
   {
      let range: NSRange = NSRange( location: 0, length: string.utf16.count )
      return firstMatch( in: string, options: [], range: range ) != nil
   }
}

extension String
{
   /**
    Runs a search of lhs using the pattern on the rhs.

    ### Example
         let match: Bool = "Hello, world!" ~= "[HJ]ello" // returns true

    - parameter lhs: `String` string to search
    - parameter rhs: `String` regex pattern
    - returns: `Bool` true if the regex matched the string
    */
   static func ~= ( lhs: String, rhs: String ) -> Bool
   {
      NSRegularExpression( rhs ).matches( lhs )
   }
}
