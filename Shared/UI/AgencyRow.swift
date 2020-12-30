import Foundation
import SwiftUI

struct AgencyRow: View
{
   var agency: Agency

   var body: some View
   {
      HStack( alignment: .top, spacing: 2 )
      {
         Text( "\(agency.name ?? "")" )
               .font( .headline )
               .lineLimit( 2 )
      }
   }
}

struct BasicAgencyRow: View
{
   var agency: Agency

   var body: some View
   {
      HStack( alignment: .top, spacing: 2 )
      {
         Text( "\(agency.name ?? "")" )
               .font( .headline )
               .lineLimit( 2 )
         Spacer()
         if let infoURL = agency.url
         {
            Link( "Info", destination: wrapURL( infoURL )! )
               .font( .subheadline )
               .padding()
         }
      }
   }
}
