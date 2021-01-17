// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

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
      List( astronauts.filter { filterAstronaut( astronaut: $0, searchText: searchText ) } )
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

 - parameter astronaut: `Astronaut` astronaut to check against the criteria
 - parameter searchText: `String?` criteria to check the astornaut against
 - returns: `Bool` true if the astronaut met the cirteria
*/
func filterAstronaut( astronaut: Astronaut, searchText: String? ) -> Bool
{
   guard let text: String = searchText else { return true }
   if text.trim().isEmpty { return true }

   var accept: Bool = true
   let fields: [String.SubSequence] = text.split( separator: "," )
   for field in fields
   {
      let searchTerm: String = String( field ).trim().lowercased()
      if searchTerm.hasPrefix( statusSearchKey ) && astronaut.status != nil
      {
         // active, retired, deceased
         let status: String = searchTerm.removePrefix( statusSearchKey ).trim()
         if let astronautStatus: String = astronaut.status
         {
            accept = accept && astronautStatus.lowercased().contains( status )
         }
      }
      else if searchTerm.hasPrefix( agencySearchKey ) && astronaut.agency != nil
      {
         // NASA, Aeronautics
         if let agency: Agency = astronaut.agency
         {
            let agencyTerm: String = searchTerm.removePrefix( agencySearchKey ).trim()
            let nameContainsAgency: Bool = agency.name?.lowercased().contains( agencyTerm ) ?? false
            let abbreviationContainsAgency: Bool = agency.abbreviation?.lowercased().contains( agencyTerm ) ?? false
            accept = accept && ( nameContainsAgency || abbreviationContainsAgency )
         }
      }
      else if searchTerm.hasPrefix( nationalitySearchKey ) && astronaut.nationality != nil
      {
         // American, Chinese
         let nationality: String = searchTerm.removePrefix( nationalitySearchKey ).trim()
         if let astronautNationality: String = astronaut.nationality
         {
            accept = accept && astronautNationality.lowercased().contains( nationality )
         }
      }
      else if searchTerm.hasPrefix( bioSearchKey ) && astronaut.bio != nil
      {
         let bio: String = searchTerm.removePrefix( bioSearchKey ).trim()
         if let astronautBio: String = astronaut.bio
         {
            accept = accept && astronautBio.lowercased().contains( bio )
         }
      }
      else if astronaut.name != nil // use this for no prefix too
      {
         let name: String = searchTerm.hasPrefix( nameSearchKey ) ? searchTerm.removePrefix( nameSearchKey ).trim() : searchTerm
         if let astronautName: String = astronaut.name
         {
            accept = accept && astronautName.lowercased().contains( name )
         }
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
         TitleField( text: astronaut.name )
         LeftField( text: astronaut.nationality )
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
