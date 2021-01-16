// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

struct ImageViewer: View
{
   @State var currentScale: CGFloat = 1.0
   @State var previousScale: CGFloat = 1.0

   @State var currentOffset: CGSize = CGSize.zero
   @State var previousOffset: CGSize = CGSize.zero

   @ObservedObject var imageLoader: ImageLoader

   private var url: String?

   var body: some View
   {
      ZStack
      {
         GeometryReader
         {
            geometry in

            let image: UIImage = imageLoader.image ?? UIImage()
            Image( uiImage: image )
               .resizable()
               .aspectRatio( contentMode: .fill )
               .position( x: geometry.size.width / 2.0, y: geometry.size.height / 2.0 ) // center the image initially
               .offset( x: self.currentOffset.width, y: self.currentOffset.height ) // apply the offset
               .scaleEffect( max( self.currentScale, 0.2 ) )
               .gesture( DragGesture()
                           .onChanged
                           {
                              value in

                              let deltaX: CGFloat = value.translation.width - self.previousOffset.width
                              let deltaY: CGFloat = value.translation.height - self.previousOffset.height
                              self.previousOffset.width = value.translation.width
                              self.previousOffset.height = value.translation.height

                              let newOffsetWidth: CGFloat = self.currentOffset.width + deltaX / self.currentScale
                              if abs( newOffsetWidth ) <=
                                    ( image.size.width - geometry.size.width ) / ( 2.0 * self.currentScale  )
                              {
                                 self.currentOffset.width = newOffsetWidth
                              }

                              let newOffsetHeight: CGFloat = self.currentOffset.height + deltaY / self.currentScale
                              if abs( newOffsetHeight ) <=
                                    ( image.size.height - geometry.size.height ) / ( 2.0 * self.currentScale )
                              {
                                 self.currentOffset.height = newOffsetHeight
                              }
                           }
                           .onEnded { _ in self.previousOffset = CGSize.zero }
               )

               .gesture( MagnificationGesture()
                           .onChanged
                           {
                              value in
                              let delta: CGFloat = value / self.previousScale
                              self.previousScale = value
                              self.currentScale *= delta
                           }
                           .onEnded { _ in self.previousScale = 1.0 }
               )
         }
      }
   }

   init( withURL url: String? )
   {
      self.url = url
      imageLoader = ImageLoader( urlString: url ?? "" )
   }
}

#if DEBUG
struct ImageViewPreview: PreviewProvider
{
   static var previews: some View
   {
      let url1: String = "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/soyuz2520sta_image_20191210133244.jpg"
      let url2: String = "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/falcon25209_image_20190224025007.jpeg"

      Group
      {
         ImageViewer( withURL: url1 )
         ImageViewer( withURL: url2 )
      }
   }
}
#endif
