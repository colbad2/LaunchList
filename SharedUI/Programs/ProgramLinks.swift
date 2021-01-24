// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct ProgramLinks: View
{
   var programs: Set< Program >

   var body: some View
   {
      if !programs.isEmpty
      {
         Divider()
         GrayHeadlineText( text: "Programs" )
         ForEach( sortProgramsByName( programArray: Array( programs ) ) )
         {
            program in
            ProgramLink( programID: program.id )
         }
      }
   }
}

struct ProgramLink: View
{
   var programID: Int64?

   var body: some View
   {
      let context: NSManagedObjectContext = PersistenceController.shared.container.viewContext
      if let programID: Int64 = programID,
         let program: Program = getProgram( by: programID, context: context ),
         let name: String = program.name
      {
         NavigationLink( destination: ProgramDetail( program: program ) )
         {
            BlackSubheadlineText( text: name )
            Spacer()
         }
         .padding( 4 )
      }
   }
}
