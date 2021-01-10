import SwiftUI
import UIKit

class ImageLoader: ObservableObject
{
   @Published var image: UIImage?

   init( urlString: String? )
   {
      guard let url = urlString else { return }

      RemoteImageCache.shared.downloadImage( with: url )
      {
         (fetchedImage, done) in

         self.image = fetchedImage
      }
   }
}
