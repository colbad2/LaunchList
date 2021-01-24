// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct RowImage: View
{
   var image: UIImage?
   var imageURL: String?
   var defaultImage: UIImage?
   var drawSpace: Bool = true
   var imageWidth: CGFloat?
   var imageHeight: CGFloat?

   var body: some View
   {
      if let image: UIImage = image
      {
         BundleImageView( image: image )
            .frame( width: imageWidth ?? 50, height: imageHeight ?? 60 )
            .clipped()
            .cornerRadius( 8 )
         Spacer()
            .frame( width: 15 )
      }
      else if let url: String = imageURL
      {
         LoadedImageView( withURL: url )
            .frame( width: imageWidth ?? 50, height: imageHeight ?? 60 )
            .clipped()
            .cornerRadius( 8 )
         Spacer()
            .frame( width: 15 )
      }
      else
      {
         Image( uiImage: defaultImage ?? UIImage() )
            .resizable()
            .aspectRatio( contentMode: .fill )
            .frame( width: imageWidth ?? 50, height: imageHeight ?? 60 )
            .cornerRadius( 8 )
         Spacer()
            .frame( width: 15 )
      }
   }
}

#if DEBUG
struct RowImagePreview: PreviewProvider
{
   static var previews: some View
   {
      let url1: String = "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/soyuz2520sta_image_20191210133244.jpg"
      let url2: String = "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg"

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
