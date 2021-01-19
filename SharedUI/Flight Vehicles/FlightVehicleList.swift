// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct FlightVehicleList: View
{
   @FetchRequest( entity: FlightVehicle.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \FlightVehicle.missionEnd,
                                                       ascending: false ) ],
                  animation: .default )
   private var flightVehicles: FetchedResults< FlightVehicle >

   var body: some View
   {
      List( flightVehicles )
      {
         ( flightVehicle: FlightVehicle ) in

         if flightVehicleShowable( flightVehicle: flightVehicle ) // DATABASE CORRECTION
         {
            NavigationLink( destination: FlightVehicleDetail( flightVehicle: flightVehicle ) )
            {
               FlightVehicleRow( flightVehicle: flightVehicle )
            }
         }
      }
      .navigationBarTitle( "Flight Vehicles", displayMode: .inline )
   }
}

func flightVehicleShowable( flightVehicle: FlightVehicle ) -> Bool
{
   guard let name = flightVehicle.spacecraft?.name?.trim() else { return false }
   return !name.isEmpty
}

struct FlightVehicleRow: View
{
   var flightVehicle: FlightVehicle

   var body: some View
   {
      RowImage( imageURL: flightVehicle.spacecraft?.spacecraftConfig?.imageURL )

      VStack( alignment: .leading )
      {
         TitleField( text: "\(flightVehicle.spacecraft?.name ?? "") to \(flightVehicle.destination ?? "")" )
         HStack
         {
            if let missionEnd: String = flightVehicle.missionEnd
            {
               Text( dateString( parseISODate( isoDate: missionEnd ) ) )
                  .font( .subheadline )
            }
         }
      }
   }
}

#if DEBUG
struct FlightVehiclePreviews: PreviewProvider
{
   static var previews: some View
   {
      //      NavigationView
      //      {
      FlightVehicleList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
      //      }
   }
}
#endif
