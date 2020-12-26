import Foundation

func parseISODate( isoDate: String? ) -> Date?
{
   if isoDate == nil { return nil }
   
   let dateFormatter = DateFormatter()
   dateFormatter.locale = Locale( identifier: "en_US_POSIX" ) // set locale to reliable US_POSIX
   dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
   return dateFormatter.date( from: isoDate! )
}