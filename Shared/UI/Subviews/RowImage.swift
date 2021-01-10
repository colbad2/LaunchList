// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct RowImage: View
{
   var imageURL: String?
   var defaultImage: UIImage? = nil
   var drawSpace: Bool = true
   var w: CGFloat?
   var h: CGFloat?

   var body: some View
   {
      if let url = imageURL
      {
         IconView( withURL: url )
            .frame( width: w ?? 50, height: h ?? 60 )
            .clipped()
         Spacer()
            .frame( width: 15 )
      }
      else
      {
         if drawSpace
         {
            // TODO remove?
         }
            Image( uiImage: defaultImage ?? UIImage() )
               .resizable()
               .aspectRatio( contentMode: .fill )
               .frame( width: w ?? 50, height: h ?? 60 )
            Spacer()
               .frame( width: 15 )
//         }
      }
   }
}

#if DEBUG
struct RowImagePreview: PreviewProvider
{
   static var previews: some View
   {
      let url1 = "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/soyuz2520sta_image_20191210133244.jpg"
      let url2 = "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg"
      HStack
      {
         RowImage(imageURL: url1, drawSpace: true )
//            .border(Color.black)
         
         RowImage(imageURL: url2, drawSpace: true )
//            .border(Color.black)
      }
      .environment( \.colorScheme, .light )
   }
}
#endif
