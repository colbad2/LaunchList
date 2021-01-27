// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
#if !os(macOS)
import UIKit
#endif

/**
 Singleton for fetching images from URLs and holding them for future use.

 Dictionaries in Swift are not thread safe, so the queues serialize requests from them.
 */
class RemoteImageCache
{
   /** Singleton of this class. */
   static let shared: RemoteImageCache = RemoteImageCache()

   /** List of cached images, indexed by URL string. */
   private var cachedImages: [ String: UIImage ]

   /** Active tasks downloading images, indexed by the URL string they are fetching. */
   private var imagesDownloadTasks: [ String: URLSessionDataTask ]

   // A serial queue to be able to write the non-thread-safe image dictionary
   private let serialQueueForImages: DispatchQueue = DispatchQueue( label: "images.queue", attributes: .concurrent )

   // A serial queue to be able to write the non-thread-safe task dictionary
   private let serialQueueForDataTasks: DispatchQueue = DispatchQueue( label: "dataTasks.queue", attributes: .concurrent )

   /**
    Private constructor.
    */
   private init()
   {
      cachedImages = [:]
      imagesDownloadTasks = [:]
   }

   /**
    Gets a cached image by source URL, thread-safe.

    - parameter url: `String` source URL to fetch image from
    - returns:       `UIImage?` image for URL, if cached, nil otherwise
    */
   private func getCachedImageFrom( url: String ) -> UIImage?
   {
      serialQueueForImages.sync { return cachedImages[ url ] }
   }

   /**
    Saves an image in our cache, indexed by source URL, thread-safe

    - parameter url: `String` source URL for the image
    - parameter image: `UIImage?` image to store
    */
   private func storeImage( url: String, image: UIImage? )
   {
      serialQueueForImages.sync( flags: .barrier ) { cachedImages[ url ] = image }
   }

   /**
    Removes a cahched image from the cache.

    - parameter url: `String` image to clear
    */
   private func removeImageFromList( url: String )
   {
      _ = serialQueueForImages.sync( flags: .barrier ) { cachedImages.removeValue( forKey: url ) }
   }

   /**
    Gets image fetch task by fetch URL, thread-safe.

    - parameter url: `String`
    - returns: `URLSessionTask?` task for the given URL
    */
   private func getDataTaskFrom( url: String ) -> URLSessionTask?
   {
      serialQueueForDataTasks.sync { return imagesDownloadTasks[ url ] }
   }

   /**
    Adds a task to the task list, thread-safe.

    - parameter url: `String` URL the task is fetching
    - parameter task: `URLSessionDataTask` image fetching task for URL
    */
   private func addTaskToList( url: String, task: URLSessionDataTask )
   {
      serialQueueForDataTasks.sync( flags: .barrier ) { imagesDownloadTasks[ url ] = task }
   }

   /**
    Clears out a finished task from download tasks container by fetch URL, thread-safe.

    - parameter url: `String` task to clear
    */
   private func removeTaskFromList( url: String )
   {
      serialQueueForDataTasks.sync( flags: .barrier )
      {
         let removedTask: URLSessionDataTask? = imagesDownloadTasks.removeValue( forKey: url ) as URLSessionDataTask?
         if let task: URLSessionDataTask = removedTask
         {
            task.cancel()
         }
      }
   }

   /**
    Clears the cache of a single image, by source URL.

    - parameter url: `String` image/task to clear
    */
   func clearURL( url: String )
   {
      removeTaskFromList( url: url )
      removeImageFromList( url: url )
   }

   /**
    Download an image from the given URL, and cache it.

    To be called from the main thread.

    - parameter imageURLString: `String?` URL to fetch
    - parameter completionHandler: `( String?, UIImage?, Bool ) -> Void` callback when image loading has stopped (good or bad)
    */
   func downloadImage( with imageURLString: String?,
                       completionHandler: @escaping ( String?, UIImage?, Bool ) -> Void  )
   {
      guard let urlString: String = imageURLString else
      {
         print( "Couldn't load nil URL" )
         completionHandler( imageURLString, nil, true )
         return
      }

      // return nil if the URL was nil or empty
      if urlString.isEmpty
      {
         print( "Couldn't load empty URL" )
         completionHandler( imageURLString, nil, true )
         return
      }

      // return the image if it had been cached
      if let image: UIImage = getCachedImageFrom( url: urlString )
      {
         completionHandler( imageURLString, image, true )
         return
      }

      if let image: UIImage = getStoredImage( for: urlString, context: PersistenceController.shared.container.viewContext )
      {
         completionHandler( imageURLString, image, true )
         return
      }

      // return nil if the URL cannot be parsed
      guard let url = URL( string: urlString ) else
      {
         print( "cannot parse image URL: \"\(urlString)\"" )
         completionHandler( imageURLString, nil, true )
         return
      }

      // return if there is a fetch task for the URL and the fetch task is still operating
      if getDataTaskFrom( url: urlString ) != nil
      {
         return
      }

      // create the image fetch task, returns some image on the main thread
      let task: URLSessionDataTask = URLSession.shared.dataTask( with: url )
      {
         fetchedData, _, fetchError in

         guard let data = fetchedData else { return }

         if let error: Error = fetchError
         {
            DispatchQueue.main.async { completionHandler( imageURLString, nil, true ) }
            print( "load image URL fail: \(error)" )
            return
         }

         guard let image: UIImage = UIImage( data: data ) else
         {
            completionHandler( imageURLString, nil, true )
            print( "cannot parse image URL: \"\(urlString)\"" )
            return
         }

         self.storeImage( url: urlString, image: image )
         self.removeTaskFromList( url: urlString )
         DispatchQueue.main.async
         {
            saveToCoreData( url: urlString, image: image )
            completionHandler( imageURLString, image, false )
         }
      }

      addTaskToList( url: urlString, task: task )
      task.resume()
   }
}

/**
 Fetches any image stored in the context under the given URL.

 - parameter url: `String?` where the image will come from
 - parameter context: `NSManagedObejctContext` context where to search for the image
 - returns: `UIImage?` any image found with the given URL, or nil if not found
 */
func getStoredImage( for imageURL: String?, context: NSManagedObjectContext ) -> UIImage?
{
   guard let url = imageURL else { return nil }

   do
   {
      let request: NSFetchRequest<ImageData> = ImageData.fetchRequest()
      request.predicate = NSPredicate( format: "url = %@", url )
      let entities: [ImageData] = try context.fetch( request )
      if let data: Data = entities.first?.data
      {
         return UIImage( data: data )
      }
   }
   catch
   {
      let nsError: NSError = error as NSError
      fatalError( "Failed to fetch image: \(url) \(error), \(nsError.userInfo)" )
   }

   return nil
}

/*
func getNextLaunches( count: Int, context: NSManagedObjectContext ) -> [Launch]
{
 
   do
   {
 let request: NSFetchRequest<Launch> = Launch.fetchRequest()
      request.predicate = NSPredicate( format: "windowEnd > %@", NSDate() )
      request.sortDescriptors = [ NSSortDescriptor( key: "windowStart", ascending: true ) ]
      request.fetchLimit = count
      let entities: [Launch] = try context.fetch( request )
      if entities.count > 0 { return entities }
   }
   catch
   {
      let nsError = error as NSError
      fatalError( "Failed to fetch next launch: \(error), \(nsError.userInfo)" )
   }

   return []
}
 */

/**
 Save the image's data to the object store, identified by the URL where it was fetched from.

 - parameter url: `String` where the image came from
 - parameter image: `UIImage` fetched image
 */
func saveToCoreData( url: String, image: UIImage )
{
   let imageData: Data? = image.pngData()
   let context: NSManagedObjectContext = PersistenceController.shared.container.viewContext

   guard let imageDataEntity = NSEntityDescription.insertNewObject( forEntityName: "ImageData",
                                                                    into: context ) as? ImageData else { return }

   imageDataEntity.url = url
   imageDataEntity.data = imageData
   saveContext( context )
}
