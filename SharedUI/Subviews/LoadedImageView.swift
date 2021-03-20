// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct LoadedImageView: View
{
   @ObservedObject var imageLoader: ImageLoader
   private var url: String?

   var body: some View
   {
      if url != nil
      {
         Image( uiImage: imageLoader.image ?? UIImage() )
            .resizable()
            .aspectRatio( contentMode: .fill )
      }
   }

   init( withURL url: String? )
   {
      self.url = url
      imageLoader = ImageLoader( urlString: url )
   }
}

struct BundleImageView: View
{
   var image: UIImage?

   var body: some View
   {
      if let image: UIImage = image
      {
         Image( uiImage: image )
            .resizable()
            .aspectRatio( contentMode: .fill )
      }
   }

   init( image: UIImage? )
   {
      self.image = image
   }
}

#if DEBUG
struct IconViewPreview: PreviewProvider
{
   static var previews: some View
   {
      let url1: String = "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/soyuz2520sta_image_20191210133244.jpg"
      let url2: String = "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg"

      Group
      {
         LoadedImageView( withURL: url1 )
         LoadedImageView( withURL: url2 )
      }
   }
}
#endif
