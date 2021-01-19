// Copyright © 2021 Bradford Holcombe. All rights reserved.

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
         _, fetchedImage, _ in

         self.image = fetchedImage
      }
   }
}
