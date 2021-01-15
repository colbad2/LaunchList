// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct ProgramLinks: View
{
   var programs: NSSet?

   var body: some View
   {
      if let programs = programs
      {
         if programs.count > 0
         {
            Divider()
            HStack
            {
               Text( "Programs" )
                  .font( .headline )
                  .foregroundColor( .secondary )
               Spacer()
            }
            ForEach( getProgramsArray( programs: programs ), id: \.self )
            {
               program in
               ProgramLink( programID: program.id )
            }
         }
      }
   }
}

struct ProgramLink: View
{
   var programID: Int64?

   var body: some View
   {
      let context = PersistenceController.shared.container.viewContext
      if let programID = programID,
         let program = getProgram( by: programID, context: context ),
         let name = program.name
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

func getProgramsArray( programs: NSSet ) -> [Program]
{
   var eventPrograms = Array( programs as Set ) as? [Program] ?? []
   eventPrograms.sort( by: { ($0 as Program).name! < ($1 as Program).name! } )
   return eventPrograms
}
