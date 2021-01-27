// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct AgencyList: View
{
   @FetchRequest( entity: Agency.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Agency.sortableName, ascending: true ) ],
                  animation: .default )
   private var agencies: FetchedResults< Agency >

   var body: some View
   {
      List( agencies )
      {
         ( agency: Agency ) in

         if let logoName: String = agency.logoName,
            let logo: UIImage = UIImage( named: logoName )
         {
            RowImage( image: logo, imageWidth: 50, imageHeight: 50 )
         }

         NavigationLink( destination: AgencyDetail( agency: agency ) )
         {
            AgencyRow( agency: agency )
         }
      }
      .navigationTitle( "Agencies" )
   }
}

struct AgencyRow: View
{
   var agency: Agency

   var body: some View
   {
      if let name: String = agency.name
      {
         HStack( alignment: .top )
         {
            BlackHeadlineText( text: name )
            if let codes: [String] = agency.countryCodes
            {
               Spacer()
               Text( flagsFromCodeArray( codes ) ?? "" )
            }
         }
      }
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
