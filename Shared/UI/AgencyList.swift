import Foundation
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
      NavigationView
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
         .navigationTitle( "Agencies" )
      }
   }
}


struct AgencyListPreviews: PreviewProvider
{
    static var previews: some View
    {
      AgencyList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
    }
}
