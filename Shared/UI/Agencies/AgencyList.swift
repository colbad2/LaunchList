import SwiftUI
import CoreData

struct AgencyList: View
{
   @FetchRequest( entity: Agency.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Agency.name,
                                                       ascending: true ) ],
                  animation: .default )
   private var agencies: FetchedResults< Agency >

   var body: some View
   {
      List( agencies )
      {
         ( agency: Agency ) in

         if isBasic( agency: agency )
         {
            BasicAgencyRow( agency: agency )
         }
         else
         {
            NavigationLink( destination: AgencyDetail( agency: agency ) )
            {
               AgencyRow( agency: agency )
            }
         }
      }
      .navigationBarTitle( "Agencies", displayMode: .inline )
   }
}

struct AgencyRow: View
{
   var agency: Agency

   var body: some View
   {
      Text( "\(agency.name ?? "")" )
         .font( .headline )
         .lineLimit( 2 )
   }
}

struct BasicAgencyRow: View
{
   var agency: Agency

   var body: some View
   {
      Text( "\(agency.name ?? "")" )
         .font( .headline )
         .lineLimit( 2 )
   }
}

#if DEBUG
struct AgencyListPreviews: PreviewProvider
{
    static var previews: some View
    {
      AgencyList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
    }
}
#endif
