// Copyright © 2021 Bradford Holcombe. All rights reserved.

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
            TitleField( text: agency.name )
            if let countryCodes: [String] = agency.countryCodes
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

            LeftField( prefix: "Admin: ", text: agency.administrator )

            if let launchers: String = agency.launchers
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

            if let spacecraft: String = agency.spacecraft
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

            LeftField( prefix: "Parent: ", text: agency.parent )
         }

            // TODO long list of countries
//            if let countryCode = agency.countryCode
//            {
//               Text( countryCode )
//            }

//            if let abbreviation = agency.abbreviation
//            {
//               Text( abbreviation )
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
      let context: NSManagedObjectContext = PersistenceController.preview.container.viewContext
      if let agency: Agency = getEntityByID( entityID: 63,
                                             context: context,
                                             entityName: "Agency" ) as? Agency
      {
         AgencyDetail( agency: agency )
      }
   }
}
#endif
