import SwiftUI
import CoreData
import MapKit

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
               TitleField( s: pad.name )
               if let countryCode = pad.location?.countryCode
               {
                  Spacer()
                  Text( flags( for: countryCode )! )
               }
            }
            LeftField( s: pad.location?.name )
            Button( action: { openInMaps( name: pad.location?.name, lat: pad.latitude, lon: pad.longitude ) } )
            {
               LeftField( s: "\(pad.latitude!), \(pad.longitude!)" )
            }
            AgencyLink( agencyID: pad.agencyID )
            IconView( withURL: pad.mapImage )
            LinkBarView( infoURL: pad.infoURL, wikiURL: pad.wikiURL, mapURL: pad.mapURL )
            LaunchLinks( launches: pad.launches )
         }
         .padding()
      }
      .navigationBarTitle( "Pad", displayMode: .inline )
   }
}

func openInMaps( name: String?, lat: String?, lon: String? )
{
   if lat == nil || lon == nil { return }

   let latitude = Double( lat! )
   let longitude = Double( lon! )
   if latitude == nil || longitude == nil { return }

   let coordinate = CLLocationCoordinate2D( latitude: latitude!, longitude: longitude! )
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
      PadDetail( pad: getSamplePadEntity() )
   }
}
#endif
