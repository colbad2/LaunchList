import UIKit

/**
 Singleton for fetching images from URLs and holding them for future use.

 Dictionaries in Swift are not thread safe, so the queues serialize requests from them.

 - TODO: clear the cache entirely, or images that are past a certain lifetime
 */
class RemoteImageCache
{
   /** Singleton of this class. */
   static let shared = RemoteImageCache()

   /** List of cached images, indexed by URL string. */
   private var cachedImages: [ String: UIImage ]

   /** Active tasks downloading images, indexed by the URL string they are fetching. */
   private var imagesDownloadTasks: [ String: URLSessionDataTask ]

   // A serial queue to be able to write the non-thread-safe image dictionary
   private let serialQueueForImages = DispatchQueue( label: "images.queue", attributes: .concurrent )

   // A serial queue to be able to write the non-thread-safe task dictionary
   private let serialQueueForDataTasks = DispatchQueue( label: "dataTasks.queue", attributes: .concurrent )

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

    - Parameter url: source URL to fetch image from
    - Returns: image for URL, if cached, nil otherwise
    */
   private func getCachedImageFrom( url: String ) -> UIImage?
   {
      serialQueueForImages.sync { return cachedImages[ url ] }
   }

   /**
    Saves an image in our cache, indexed by source URL, thread-safe

    - Parameter url: source URL for the image
    - Parameter image: image to store
    */
   private func storeImage( url: String, image: UIImage? ) -> Void
   {
      serialQueueForImages.sync( flags: .barrier ) { cachedImages[ url ] = image }
   }

   /**
    Removes a cahched image from the cache.

    - Parameter url: image to clear
    */
   private func removeImageFromList( url: String ) -> Void
   {
      _ = serialQueueForImages.sync( flags: .barrier ) { cachedImages.removeValue( forKey: url ) }
   }

   /**
    Gets image fetch task by fetch URL, thread-safe.

    - Parameter url: 
    - Returns: task for the given URL
    */
   private func getDataTaskFrom( url: String ) -> URLSessionTask?
   {
      serialQueueForDataTasks.sync { return imagesDownloadTasks[ url ] }
   }

   /**
    Adds a task to the task list, thread-safe.

    - Parameter url: URL the task is fetching
    - Parameter task; image fetching task for URL
    */
   private func addTaskToList( url: String, task: URLSessionDataTask ) -> Void
   {
      serialQueueForDataTasks.sync( flags: .barrier ) { imagesDownloadTasks[ url ] = task }
   }

   /**
    Clears out a finished task from download tasks container by fetch URL, thread-safe.

    - Parameter url: task to clear
    */
   private func removeTaskFromList( url: String ) -> Void
   {
      serialQueueForDataTasks.sync( flags: .barrier )
      {
         let removedTask: URLSessionDataTask = imagesDownloadTasks.removeValue( forKey: url )! as URLSessionDataTask
         removedTask.cancel()
      }
   }

   /**
    Clears the cache of a single image, by source URL.

    - Parameter url: image/task to clear
    */
   public func clearURL( url: String ) -> Void
   {
      removeTaskFromList( url: url )
      removeImageFromList( url: url )
   }

   /**
    Download an image from the given URL, and cache it.

    To be called from the main thread.

    - Parameter urlString: {String?} URL to fetch
    - Parameter completionHandler: {( UIImage?, Bool ) -> Void} callback when image loading has stopped (good or bad)
    */
   func downloadImage( with urlString: String?,
                       completionHandler: @escaping ( UIImage?, Bool ) -> Void  )
   {
      // return n il if the URL was nil
      if urlString == nil
      {
         completionHandler( nil, true )
         // TODO log
         return
      }

      // return the image if it had been cached
      if let image = getCachedImageFrom( url: urlString! )
      {
         completionHandler( image, true )
         return
      }

      // return nil if the URL cannot be parsed
      guard let url = URL( string: urlString! ) else
      {
         completionHandler( nil, true )
         // TODO log
         return
      }

      // return if there is a fetch task for the URL and the fetch task is still operating
      if getDataTaskFrom( url: urlString! ) != nil
      {
         return
      }

      // create the image fetch task, returns some image on the main thread
      let task = URLSession.shared.dataTask( with: url )
      {
         ( data, response, error ) in

         if data == nil { return }
         if error != nil
         {
            DispatchQueue.main.async { completionHandler( nil, true ) }
            // TODO log
            return
         }

         let image = UIImage( data: data! )
         self.storeImage( url: urlString!, image: image )
         self.removeTaskFromList( url: urlString! )
         DispatchQueue.main.async { completionHandler( image, false ) }
      }

      addTaskToList( url: urlString!, task: task )
      task.resume()
   }
}
