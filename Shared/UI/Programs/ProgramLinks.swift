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
         HStack
         {
            Text( "Programs" )
               .font( .headline )
               .foregroundColor( .secondary )
            Spacer()
         }
         ForEach( sortProgramsByName( programArray: Array( programs ) ), id: \.self )
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
            Text( name )
               .font( .subheadline )
            Spacer()
         }
         .padding( 4 )
      }
   }
}
