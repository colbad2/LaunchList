import Foundation

func parseISODate( isoDate: String? ) -> Date?
{
   guard let isoDate = isoDate else { return nil }
   
   let dateFormatter = DateFormatter() // TODO don't make these every time
   dateFormatter.locale = Locale( identifier: "en_US_POSIX" ) // set locale to reliable US_POSIX
   dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
   return dateFormatter.date( from: isoDate )
}

func dateString( _ d: Date? ) -> String?
{
   guard let d = d else { return nil }

   let dateFormatter = DateFormatter() // TODO don't make these every time
   dateFormatter.locale = Locale( identifier: "en_US_POSIX" ) // set locale to reliable US_POSIX
   dateFormatter.dateFormat = "yyyy-MM-dd"
   return dateFormatter.string( from: d )
}

func wrapURL( _ url: String? ) -> URL?
{
   if url == nil || url!.trimmingCharacters( in: .whitespacesAndNewlines ) == "" { return nil }
   return URL( string: url! )
}

func parseJSONFile<T: Decodable>( filename: String ) -> T?
{
   let decoder = JSONDecoder()
   decoder.keyDecodingStrategy = .convertFromSnakeCase

   do
   {
      let jsonData = readBundleJSONFile( forName: filename )!
      return try decoder.decode( T.self, from: jsonData )
   }
   catch DecodingError.dataCorrupted( let context ) { print( context ) }
   catch DecodingError.keyNotFound( let key, let context )
   {
       print( "Key '\(key)' not found:", context.debugDescription )
       print( "codingPath:", context.codingPath )
   }
   catch DecodingError.valueNotFound( let value, let context )
   {
       print( "Value '\(value)' not found:", context.debugDescription )
       print( "codingPath:", context.codingPath )
   }
   catch DecodingError.typeMismatch(let type, let context )
   {
       print( "Type '\(type)' mismatch:", context.debugDescription )
       print( "codingPath:", context.codingPath )
   }
   catch { print( "error: ", error ) }

   return nil
}

func parseJSONString<T: Decodable>( json: String ) -> T?
{
   let decoder = JSONDecoder()
   decoder.keyDecodingStrategy = .convertFromSnakeCase

   do
   {
      let jsonData = json.data( using: .utf8 )!
      return try decoder.decode( T.self, from: jsonData )
   }
   catch DecodingError.dataCorrupted( let context ) { print( context ) }
   catch DecodingError.keyNotFound( let key, let context )
   {
       print( "Key '\(key)' not found:", context.debugDescription )
       print( "codingPath:", context.codingPath )
   }
   catch DecodingError.valueNotFound( let value, let context )
   {
       print( "Value '\(value)' not found:", context.debugDescription )
       print( "codingPath:", context.codingPath )
   }
   catch DecodingError.typeMismatch(let type, let context )
   {
       print( "Type '\(type)' mismatch:", context.debugDescription )
       print( "codingPath:", context.codingPath )
   }
   catch { print( "error: ", error ) }

   return nil
}
