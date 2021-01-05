import SwiftUI

struct IconView: View
{
   @ObservedObject var imageLoader: ImageLoader
   private var url: String? = nil

   init( withURL url: String? )
   {
      self.url = url
      imageLoader = ImageLoader( urlString: url ?? "" )
   }

   var body: some View
   {
      if self.url != nil
      {
         Image( uiImage: imageLoader.image ?? UIImage() )
            .resizable()
            .aspectRatio( contentMode: .fill )
      }
   }
}

#if DEBUG
struct IconViewPreview: PreviewProvider
{
   static var previews: some View
   {
      let url1 = "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/soyuz2520sta_image_20191210133244.jpg"
      let url2 = "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg"

      Group
      {
         IconView( withURL: url1 )
         IconView( withURL: url2 )
      }
   }
}
#endif
