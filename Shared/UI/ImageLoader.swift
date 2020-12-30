import Foundation
import SwiftUI
import UIKit

class ImageLoader: ObservableObject
{
   @Published var image: UIImage?

   init( urlString: String )
   {
      RemoteImageCache.shared.downloadImage( with: urlString )
      {
         (fetchedImage, done) in

         self.image = fetchedImage
      }
   }
}
