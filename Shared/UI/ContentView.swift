import SwiftUI
import CoreData

struct ContentView: View
{
   @Environment( \.managedObjectContext ) private var viewContext

   @FetchRequest( entity: Launch.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Launch.windowStart, ascending: true ) ],
                  animation: .default )
   private var launches: FetchedResults< Launch >

   var body: some View
   {
      NavigationView
      {
         List( launches )
         {
            ( launch: Launch ) in
            NavigationLink( destination: LaunchDetail( launch: launch ) )
            {
               LaunchRow( launch: launch )
            }
         }
         .navigationTitle( "Launches" )
      }
   }
}

struct LaunchDetail: View
{
   var launch: Launch

   var body: some View
   {
      VStack(alignment: .leading)
      {
         Text( "\(missionName(launch))" )
            .font( .title )
            .foregroundColor( .primary )

         HStack {
            Text( "\(launch.serviceProvider?.name ?? "")" )
            Spacer()
            Text( "\(launch.rocket?.configuration?.name ?? launch.name!)" )
         }
         .font( .subheadline )
         .foregroundColor( .secondary )

         Divider()

         Text( "\(launch.mission?.missionDescription ?? "")" )

         IconView( withURL: launch.image! )
            .frame( width: 40, height: 40 )
         IconView( withURL: launch.infographic! )
            .frame( width: 40, height: 40 )
         
      }
      .padding()

      Spacer()
   }
}

struct LaunchRow: View
{
   var launch: Launch

   var body: some View
   {
      HStack( alignment: .top, spacing: 2 )
      {
         IconView( withURL: launch.image! )
            .frame( width: 40, height: 40 )
         Spacer()
            .frame( width: 15 )
         VStack( alignment: .leading )
         {
            Text( "\(missionName(launch))" )
               .font(.headline)
               .lineLimit( 2 )
            HStack
            {
               Text( "\(launch.serviceProvider?.name ?? "")" )
                  .font(.subheadline)
                  .lineLimit( 2 )
               Spacer()
               Text( "\(launch.rocket?.configuration?.name ?? launch.name!)" )
                  .font(.subheadline)
                  .lineLimit( 2 )
            }
            Text( "\(launch.windowStart!, formatter: Self.taskDateFormat)" )
               .font(.subheadline)
               .foregroundColor(.gray)
         }
      }
   }

   static let taskDateFormat: DateFormatter =
   {
       let formatter = DateFormatter()
       formatter.dateFormat = "ddMMMyy HH:mm z"

       return formatter
   }()
}

func missionName( _ launch: Launch ) -> String
{
   if let missionName = launch.mission?.name { return missionName }

   return launch.name?
            .components( separatedBy: "|" )[ 1 ]
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? launch.name ?? "mission"
}

//struct LaunchRow_Previews: PreviewProvider
//{
//   static var previews: some View
//   {
//      LaunchRow( landmark: landmarks[ 0 ] )
//   }
//}

class ImageLoader: ObservableObject
{
   @Published var image: UIImage?

    init( urlString: String )
    {
      RemoteImageCache.shared.downloadImage( with: urlString,
                                             completionHandler:
                                                {
                                                   (fetchedImage, done) in

                                                   self.image = fetchedImage
                                                })
    }
}

struct IconView: View
{
    @ObservedObject var imageLoader: ImageLoader

    init( withURL url: String )
    {
        imageLoader = ImageLoader(urlString:url)
    }

    var body: some View
    {
      Image( uiImage: imageLoader.image ?? UIImage() )
         .resizable()
         .aspectRatio( contentMode: .fill )
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
    }
}
