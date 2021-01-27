// Copyright © 2021 Bradford Holcombe. All rights reserved.

import MapKit
import SwiftUI

struct PadDetail: View
{
   var pad: Pad

   var body: some View
   {
      VStack
      {
         ScrollView
         {
            HStack( alignment: .top )
            {
               TitleField( text: pad.name )
               if let countryCode: String = pad.location?.countryCode
               {
                  Spacer()
                  Text( flags( for: countryCode ) ?? "" )
               }
            }
            LeftField( text: pad.location?.name )
            Button( action: { openInMaps( name: pad.location?.name, lat: pad.latitude, lon: pad.longitude ) },
                    label: { LeftField( text: "\(pad.latitude ?? "?"), \(pad.longitude ?? "?")" ) } )
            AgencyLink( agencyID: pad.agencyID )
            LoadedImageView( withURL: pad.mapImage )
            LinkBarView( links: [ "Info": pad.infoURL ?? "", "Wiki": pad.wikiURL ?? "", "Map": pad.mapURL ?? "" ] )
            LaunchLinks( launches: pad.launchSet )
         }
         .padding()
      }
      .navigationTitle( "Pad" )
      .navigationBarTitleDisplayMode( .inline )
   }
}

func openInMaps( name: String?, lat: String?, lon: String? )
{
   guard let lat = lat, let lon = lon else { return }

   let latitude: Double = Double( lat ) ?? 0.0
   let longitude: Double = Double( lon ) ?? 0.0
   let coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D( latitude: latitude, longitude: longitude )
   let placemark: MKPlacemark = MKPlacemark( coordinate: coordinate )
   let source: MKMapItem = MKMapItem( placemark: placemark )
   if name != nil { source.name = name }

   MKMapItem.openMaps( with: [source] )
}

#if DEBUG
struct PadPreview: PreviewProvider
{
   static var previews: some View
   {
      if let pad: Pad = getSamplePadEntity()
      {
         PadDetail( pad: pad )
      }
   }
}
#endif
