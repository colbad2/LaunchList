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
      SearchBar( text: $searchText )
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
let StatusSearchKey = "status:"
let AgencySearchKey = "agency:"
let NationalitySearchKey = "nationality:"
let NameSearchKey = "name:"
let BioSearchKey = "bio:"

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
      let f = String( field ).trim().lowercased()
      if f.hasPrefix( StatusSearchKey ) && astronaut.status != nil
      {
         // active, retired, deceased
         let status = f.removePrefix( StatusSearchKey ).trim()
         accept = accept && astronaut.status!.lowercased().contains( status )
      }
      else if f.hasPrefix( AgencySearchKey ) && astronaut.agency != nil
      {
         // TODO NASA doesn't seem to work
         // NASA, Aeronautics
         let agency = astronaut.agency!
         let a = f.removePrefix( AgencySearchKey ).trim()
         let nameContainsAgency = agency.name?.lowercased().contains( a ) ?? false
         let abbreviationContainsAgency = agency.abbreviation?.lowercased().contains( a ) ?? false
         accept = accept && ( nameContainsAgency || abbreviationContainsAgency )
      }
      else if f.hasPrefix( NationalitySearchKey ) && astronaut.nationality != nil
      {
         // American, Chinese
         let n = f.removePrefix( NationalitySearchKey ).trim()
         accept = accept && astronaut.nationality!.lowercased().contains( n )
      }
      else if f.hasPrefix( BioSearchKey ) && astronaut.bio != nil
      {
         let n = f.removePrefix( BioSearchKey ).trim()
         accept = accept && astronaut.bio!.lowercased().contains( n )
      }
      else if astronaut.name != nil // use this for no prefix too
      {
         let n = f.hasPrefix( NameSearchKey ) ? f.removePrefix( NameSearchKey ).trim() : f
         accept = accept && astronaut.name!.lowercased().contains( n )
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
         TitleField( s: astronaut.name! )
         LeftField( s: astronaut.nationality! )
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
