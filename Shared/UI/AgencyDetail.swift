import Foundation
import CoreData
import SwiftUI

struct AgencyDetail: View
{
   var agency: Agency?

   var body: some View
   {
      ScrollView
      {
         if let agencyName = agency?.name
         {
            Text( "\(agencyName)" )
               .font( .title )
               .foregroundColor( .primary )
               .padding()
               .lineLimit( 3 )
         }

         if let agencyImage = agency?.imageURL
         {
            IconView( withURL: agencyImage )
               .padding()
         }

         VStack
         {
            HStack
            {
               if let type = agency?.type
               {
                  Text( "\(type)" )
                     .foregroundColor( .secondary )
               }

               Spacer()

               if let foundingYear = agency?.foundingYear
               {
                  Text( "Founded \(foundingYear)" )
                     .foregroundColor( .secondary )
               }
            }

            if let administrator = agency?.administrator
            {
               HStack
               {
                  Text( "Admin: \(administrator)" )
                  .foregroundColor( .secondary )
                  Spacer()
               }
            }

            if let launchers = agency?.launchers
            {
               HStack( alignment: .top )
               {
                  Text( "Launchers:" )
                  .foregroundColor( .secondary )
                  Text( "\(launchers)" )
                     .foregroundColor( .secondary )
                  Spacer()
               }
            }

            if let spacecraft = agency?.spacecraft
            {
               HStack( alignment: .top )
               {
                  Text( "Spacecraft:" )
                  .foregroundColor( .secondary )
                  Text( "\(spacecraft)" )
                     .foregroundColor( .secondary )
                  Spacer()
               }
            }

            if let parent = agency?.parent
            {
               Text( "Parent: \(parent)" )
                  .foregroundColor( .secondary )
            }
         }


            // TODO long list of countries
//            if let countryCode = agency?.countryCode
//            {
//               Text( "\(countryCode)" )
//            }

//            if let abbreviation = agency?.abbreviation
//            {
//               Text( "\(abbreviation)" )
//            }

         if let agencyDescription = agency?.agencyDescription
         {
            Divider()
            
            Text( "\(agencyDescription)" )
               .lineLimit( 50 )
         }

         Spacer()
      }
      .padding()
   }
}

struct AgencyPreview: PreviewProvider
{
   static var previews: some View
   {
      let agency = getFirstEntity( context: PersistenceController.preview.container.viewContext,
                                     entityName: "Agency") as? Agency
      AgencyDetail( agency: agency )
   }
}
