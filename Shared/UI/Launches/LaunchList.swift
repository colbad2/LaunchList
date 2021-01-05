import SwiftUI
import CoreData

struct LaunchList: View
{
   @FetchRequest( entity: Launch.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Launch.windowStart,
                                                       ascending: false ) ],
                  animation: .default )
   private var launches: FetchedResults< Launch >

   @State private var indexPathToSetVisible: IndexPath?

   var body: some View
   {
      ScrollViewReader
      {
         proxy in

         List( launches )
         {
            ( launch: Launch ) in

            NavigationLink( destination: LaunchDetail( launch: launch ) )
            {
               LaunchRow( launch: launch )
            }
         }
         .overlay(
             ScrollManagerView(indexPathToSetVisible: $indexPathToSetVisible)
                 .allowsHitTesting(false).frame(width: 0, height: 0)
         )
         .navigationBarTitle( "Launches", displayMode: .inline )
         .navigationBarItems( trailing:
                                 HStack
                                 {
                                    Button( action:
                                    {
                                       self.indexPathToSetVisible = IndexPath( row: 0, section: 0 )
                                    })
                                    {
                                       Image( systemName: "arrow.up.to.line" )
                                    }
                                    Button( action:
                                    {
                                          var i = 0
                                          for launch in launches
                                          {
                                             if launch.windowEnd! < Date()
                                             {
                                                i -= 1
                                                if i < 0 { i = 0 }
                                                break
                                             }
                                             i += 1
                                          }
                                          self.indexPathToSetVisible = IndexPath( row: i, section: 0 )
                                    })
                                    {
                                       Image( systemName: "calendar" )
                                    }
                                    Button( action:
                                    {
                                       self.indexPathToSetVisible = IndexPath( row: launches.count - 1, section: 0 )
                                    })
                                    {
                                       Image( systemName: "arrow.down.to.line" )
                                    }
                                 }
         )
      }
   }
}


struct LaunchRow: View
{
   var launch: Launch

   var body: some View
   {
      RowImage( imageURL: launch.image )

      VStack( alignment: .leading )
      {
         Text( "\(missionName( launch ))" )
            .font( .headline )
            .lineLimit( 2 )
         HStack
         {
            let providerName = launch.getProviderName()
            Text( "\(providerName)" )
               .font( .subheadline )
               .lineLimit( 2 )
            Spacer()
            Text( "\(launch.rocket?.name ?? launch.name!)" )
               .font( .subheadline )
               .lineLimit( 2 )
         }
         Text( "\(launch.windowStart!, formatter: Self.taskDateFormat)" )
            .font( .subheadline )
            .foregroundColor( .secondary )
            .textCase( /*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/ )
      }
   }

   static let taskDateFormat: DateFormatter =
   {
       let formatter = DateFormatter()
       formatter.dateFormat = "ddMMMyy HH:mm z"

       return formatter
   }()
}

#if DEBUG
struct ContentView_Previews: PreviewProvider
{
   static var previews: some View
   {
      //      NavigationView
      //      {
      LaunchList()
         .environment( \.managedObjectContext,
                       PersistenceController.preview.container.viewContext )
      //      }
   }
}
#endif
