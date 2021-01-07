import CoreData
import SwiftUI

struct AgencyDetail: View
{
   var agency: Agency

   var body: some View
   {
      ScrollView
      {
         HStack( alignment: .top )
         {
            TitleField( s: agency.name )
            if let countryCodes = agency.countryCodes
            {
               Spacer()
               Text( flagsFromCodeArray( countryCodes ) ?? "" )
            }
         }
         IconView( withURL: agency.imageURL )

         VStack
         {
            TwoFields( leftString: agency.type,
                       rightPrefix: "Founded ", rightString: agency.foundingYear )

            LeftField( prefix: "Admin: ", s: agency.administrator )

            if let launchers = agency.launchers
            {
               HStack( alignment: .top )
               {
                  Text( "Launchers:" )
                     .font( .subheadline )
                     .foregroundColor( .secondary )
                  Text( launchers )
                     .font( .subheadline )
                     .foregroundColor( .secondary )
                  Spacer()
               }
            }

            if let spacecraft = agency.spacecraft
            {
               HStack( alignment: .top )
               {
                  Text( "Spacecraft:" )
                     .font( .subheadline )
                     .foregroundColor( .secondary )
                  Text( spacecraft )
                     .font( .subheadline )
                     .foregroundColor( .secondary )
                  Spacer()
               }
            }

            LeftField( prefix: "Parent: ", s: agency.parent )
         }


            // TODO long list of countries
//            if let countryCode = agency.countryCode
//            {
//               Text( "\(countryCode)" )
//            }

//            if let abbreviation = agency.abbreviation
//            {
//               Text( "\(abbreviation)" )
//            }

         DescriptionView( desc: agency.agencyDescription )
      }
      .padding()
      .navigationBarTitle( "Agency", displayMode: .inline ) // TODO sometimes, the title is "Program" or something else
   }
}

#if DEBUG
struct AgencyPreview: PreviewProvider
{
   static var previews: some View
   {
      let context = PersistenceController.preview.container.viewContext
      let agency = getEntityByID( id: 63,
                                  context: context,
                                  entityName: "Agency" ) as? Agency
      AgencyDetail( agency: agency! )
   }
}
#endif
