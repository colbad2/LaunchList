// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI
import CoreData

struct AstronautList: View
{
   @FetchRequest( entity: Astronaut.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Astronaut.sortingName,
                                                       ascending: true ) ],
                  animation: .default )
   private var astronauts: FetchedResults< Astronaut >

   @State var searchText: String = ""

   var body: some View
   {
      SearchBar( prompt: "name,agency:NASA,status:active,nationality:american,bio:NASA", text: $searchText)
         .padding( .top, 10 )
      List( astronauts.filter( { filterAstronaut( astronaut: $0, searchText: searchText ) } ) )
      {
         ( astronaut: Astronaut ) in

         NavigationLink( destination: AstronautDetail( astronaut: astronaut ) )
         {
            AstronautRow( astronaut: astronaut )
         }
      }
      .navigationBarTitle( "Astronauts", displayMode: .inline )
   }
}

// Keys for astronaut search constraint fields
let statusSearchKey = "status:"
let agencySearchKey = "agency:"
let nationalitySearchKey = "nationality:"
let nameSearchKey = "name:"
let bioSearchKey = "bio:"

/**
 Returns true if the astronaut conforms to the search text.

 - Parameter {Astronaut} astronaut to check against the cirteria
 - Parameter {String?} criteria to check the astornaut against
 - Returns: true if the astronaut met the cirteria
*/
func filterAstronaut( astronaut: Astronaut, searchText: String? ) -> Bool
{
   guard let text = searchText else { return true }
   if text.trim().count == 0 { return true }

   var accept = true
   let fields = text.split( separator: "," )
   for field in fields
   {
      let searchTerm = String( field ).trim().lowercased()
      if searchTerm.hasPrefix( statusSearchKey ) && astronaut.status != nil
      {
         // active, retired, deceased
         let status = searchTerm.removePrefix( statusSearchKey ).trim()
         accept = accept && astronaut.status!.lowercased().contains( status )
      }
      else if searchTerm.hasPrefix( agencySearchKey ) && astronaut.agency != nil
      {
         // TODO NASA doesn't seem to work
         // NASA, Aeronautics
         let agency = astronaut.agency!
         let agencyTerm = searchTerm.removePrefix( agencySearchKey ).trim()
         let nameContainsAgency = agency.name?.lowercased().contains( agencyTerm ) ?? false
         let abbreviationContainsAgency = agency.abbreviation?.lowercased().contains( agencyTerm ) ?? false
         accept = accept && ( nameContainsAgency || abbreviationContainsAgency )
      }
      else if searchTerm.hasPrefix( nationalitySearchKey ) && astronaut.nationality != nil
      {
         // American, Chinese
         let nationality = searchTerm.removePrefix( nationalitySearchKey ).trim()
         accept = accept && astronaut.nationality!.lowercased().contains( nationality )
      }
      else if searchTerm.hasPrefix( bioSearchKey ) && astronaut.bio != nil
      {
         let bio = searchTerm.removePrefix( bioSearchKey ).trim()
         accept = accept && astronaut.bio!.lowercased().contains( bio )
      }
      else if astronaut.name != nil // use this for no prefix too
      {
         let name = searchTerm.hasPrefix( nameSearchKey ) ? searchTerm.removePrefix( nameSearchKey ).trim() : searchTerm
         accept = accept && astronaut.name!.lowercased().contains( name )
      }
   }

   return accept
}

struct AstronautRow: View
{
   var astronaut: Astronaut

   var body: some View
   {
      RowImage( imageURL: astronaut.profileImageThumbnail, defaultImage: UIImage( named: "AstronautB&W" ) )

      VStack( alignment: .leading )
      {
         TitleField( text: astronaut.name! )
         LeftField( text: astronaut.nationality! )
      }
   }
}

#if DEBUG
struct AstronautPreviews: PreviewProvider
{
   static var previews: some View
   {
      Group
      {
         // light view
         NavigationView
         {
            AstronautList()
            .environment( \.managedObjectContext,
                          PersistenceController.preview.container.viewContext )
         }
         .environment( \.colorScheme, .light )

         // dark view
         NavigationView
         {
            AstronautList()
            .environment( \.managedObjectContext,
                          PersistenceController.preview.container.viewContext )
         }
         .environment( \.colorScheme, .dark )

         // Assitive text large
         NavigationView
         {
            AstronautList()
            .environment( \.managedObjectContext,
                          PersistenceController.preview.container.viewContext )
         }
         .environment( \.sizeCategory, .accessibilityExtraExtraExtraLarge )
      }
   }
}
#endif
