// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

/**
 List of launches.
 */
struct LaunchList: View
{
   @FetchRequest( entity: Launch.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \Launch.windowStart,
                                                       ascending: false ) ],
                  animation: .default )
   private var launches: FetchedResults< Launch >

   @State private var indexPathToSetVisible: IndexPath?
   @State var searchText: String = ""

   var body: some View
   {
      ScrollViewReader
      {
         _ in // proxy

         let nextLaunchID: String? = getNextLaunch( context: PersistenceController.shared.container.viewContext )?.id
         SearchBar( prompt: "launch name", text: $searchText )
            .padding( .top, 10 )
         List( launches.filter { filterLaunch( launch: $0, searchText: searchText ) } )
         {
            ( launch: Launch ) in

            NavigationLink( destination: LaunchDetail( launch: launch ) )
            {
               LaunchRow( launch: launch, nextLaunchID: nextLaunchID )
            }
         }
         .overlay(
             ScrollManagerView( indexPathToSetVisible: $indexPathToSetVisible )
                 .allowsHitTesting( false ).frame( width: 0, height: 0 )
         )
         .navigationBarTitle( "Launches", displayMode: .inline )
         .toolbar
         {
            ToolbarItem( placement: .navigationBarTrailing )
            {
               HStack
               {
                  Button( action: { self.indexPathToSetVisible = IndexPath( row: 0, section: 0 ) },
                          label: { Image( systemName: "arrow.up.to.line" ) } )

                  Button( action:
                           {
                              self.indexPathToSetVisible = IndexPath( row: getNowIndex( launches: launches ), section: 0 )
                           },
                          label: { Image( systemName: "calendar" ) } )
                  Button( action: { self.indexPathToSetVisible = IndexPath( row: launches.count - 1, section: 0 ) },
                          label: { Image( systemName: "arrow.down.to.line" ) } )
               }
            }
         }
      }
   }
}

private func getNowIndex( launches: FetchedResults< Launch > ) -> Int
{
   var entityIndex: Int = 0
   for entity in launches
   {
      guard let sortingDate = entity.sortingDate else { continue }
      if sortingDate < Date()
      {
         entityIndex -= 1
         if entityIndex < 0 { entityIndex = 0 }
         break
      }
      entityIndex += 1
   }

   return entityIndex
}

func filterLaunch( launch: Launch, searchText: String? ) -> Bool
{
   guard let text = searchText else { return true }
   if text.trim().isEmpty { return true }
   guard let name = launch.name else { return true }
   return name.contains( text )
}

struct LaunchRow: View
{
   var launch: Launch
   var nextLaunchID: String?

   var body: some View
   {
      RowImage( imageURL: launch.image, defaultImage: UIImage( named: "LaunchB&W" ) )

      VStack( alignment: .leading )
      {
         HStack( alignment: .top )
         {
            BlackHeadlineText( text: missionName( launch ) )
            if launch.id == nextLaunchID
            {
               Spacer()
               NextCapsule()
            }
         }
         HStack
         {
            let providerName: String = launch.getProviderName()
            BlackSubheadlineText( text: providerName )
            Spacer()
            BlackSubheadlineText( text: launch.rocket?.name ?? launch.name ?? "" )
         }
         BlackSubheadlineText( text: tightDateString( launch.windowStart ).uppercased() )
      }
   }
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
