// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct FlightVehicleDetail: View
{
   var flightVehicle: FlightVehicle

   var body: some View
   {
//      VStack
//      {
         ScrollView
         {
            HStack( alignment: .top )
            {
               RowImage( imageURL: flightVehicle.spacecraft?.spacecraftConfig?.imageURL, drawSpace: false, imageWidth: 100, imageHeight: 120 )

               VStack
               {
                  TitleField( text: "\(flightVehicle.spacecraft?.name ?? "") to \(flightVehicle.destination ?? "")" )
            // LeftField( prefix: "serial number: ", text: flightVehicle.spacecraft?.serialNumber )
            LeftField( prefix: "until: ", text: dateString( parseISODate( isoDate: flightVehicle.missionEnd ) ) )
            /*

             "description": "Soyuz TMA-16 was a Soyuz spacecraft which launched on September 30 
             "spacecraft_config": { … }
             */

            /*
config
             "name": "Soyuz",
             "type": { … },
             "agency": { … },
             "in_use": true,
             "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/soyuz_image_20201015191152.jpg"
             */

//            NavigationLink( destination: SpacecraftDetail( spacecraft: flightVehicle.spacecraft ) )
//            {
               SpacecraftRow( spacecraft: flightVehicle.spacecraft )
//            }
               }
            }
         }
         .padding()
//      }
      .navigationTitle( "FlightVehicle" )
   }
}

#if DEBUG
struct FlightVehiclePreview: PreviewProvider
{
   static var previews: some View
   {
      if let flightVehicle: FlightVehicle = getSampleFlightVehicleEntity()
      {
         FlightVehicleDetail( flightVehicle: flightVehicle )
      }
   }
}
#endif
