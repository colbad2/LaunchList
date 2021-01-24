// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData
import SwiftUI

struct TimelineView: View
{
   @Binding var tabSelection: AppTab

   @FetchRequest( entity: TimelineEntry.entity(),
                  sortDescriptors: [ NSSortDescriptor( keyPath: \TimelineEntry.sortingDate,
                                                       ascending: false ) ],
                  animation: .default )
   private var timelineEntities: FetchedResults< TimelineEntry >

   @State private var indexPathToSetVisible: IndexPath?

   var body: some View
   {
      List( timelineEntities, id: \.self )
      {
         ( listItem: TimelineEntry ) -> AnyView in

         let nextTimelineEntry: TimelineEntry? = getNextTimelineEvent( context: PersistenceController.shared.container.viewContext )

         var nextLaunchID: String? // getNextLaunch( context: PersistenceController.shared.container.viewContext )?.id
         var nextEventID: Int64?
         var nextDockingID: Int64?
         if let nextEntry: TimelineEntry = nextTimelineEntry
         {
            if nextEntry.isKind( of: Launch.self ) { nextLaunchID = (nextTimelineEntry as! Launch).id }
            if nextEntry.isKind( of: Event.self ) { nextEventID = (nextTimelineEntry as! Event).id }
            if nextEntry.isKind( of: Docking.self ) { nextDockingID = (nextTimelineEntry as! Docking).id }
         }

         var entryView: AnyView = AnyView( Text( "any" ) )
         if listItem.isKind( of: Launch.self )
         {
            entryView = AnyView( TimelineLaunchItem( launchEntry: listItem, nextLaunchID: nextLaunchID ) )
         }
         else if listItem.isKind( of: Event.self )
         {
            entryView = AnyView( TimelineEventItem( eventEntry: listItem, nextEventID: nextEventID ) )
         }
         else if listItem.isKind( of: Docking.self )
         {
            entryView = AnyView( TimelineDockingItem( dockingEntry: listItem, nextDockingID: nextDockingID ) )
         }

         return entryView
      }
      .navigationBarTitleDisplayMode( .inline )
      .overlay(
         ScrollManagerView( indexPathToSetVisible: $indexPathToSetVisible )
            .allowsHitTesting( false ).frame( width: 0, height: 0 )
      )
      .toolbar
      {
         ToolbarItem( placement: .navigationBarLeading ) { Text( "Timeline" ).font( .title ).bold() }
         ToolbarItem( placement: .navigationBarTrailing )
         {
            HStack
            {
               Button( iconName: "arrow.up.to.line" ) { self.indexPathToSetVisible = IndexPath( row: 0, section: 0 ) }
               Button( iconName: "calendar" ) { self.indexPathToSetVisible = IndexPath( row: getNowIndex( launches: timelineEntities ), section: 0 ) }
               Button( iconName: "arrow.down.to.line" ) { self.indexPathToSetVisible = IndexPath( row: timelineEntities.count - 1, section: 0 ) }
//               Button( action: { self.indexPathToSetVisible = IndexPath( row: 0, section: 0 ) },
//                       label: { Image( systemName: "arrow.up.to.line" ) } )
//               Button( action: { self.indexPathToSetVisible = IndexPath( row: getNowIndex( launches: timelineEntities ), section: 0 ) },
//                       label: { Image( systemName: "calendar" ) } )
//               Button( action: { self.indexPathToSetVisible = IndexPath( row: timelineEntities.count - 1, section: 0 ) },
//                       label: { Image( systemName: "arrow.down.to.line" ) } )
            }
         }
      }
   }
}

private func getNowIndex( launches: FetchedResults< TimelineEntry > ) -> Int
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

struct TimelineLaunchItem: View
{
   var launchEntry: TimelineEntry
   var nextLaunchID: String?

   var body: some View
   {
      if let launch: Launch = launchEntry as? Launch
      {
         NavigationLink( destination: LaunchDetail( launch: launch ) )
         {
            LaunchRow( launch: launch, nextLaunchID: nextLaunchID )
         }
      }
   }
}

struct TimelineEventItem: View
{
   var eventEntry: TimelineEntry
   var nextEventID: Int64?

   var body: some View
   {
      if let event: Event = eventEntry as? Event
      {
         NavigationLink( destination: EventDetail( event: event ) )
         {
            EventRow( event: event, nextEventID: nextEventID )
         }
      }
   }
}

struct TimelineDockingItem: View
{
   var dockingEntry: TimelineEntry
   var nextDockingID: Int64?

   var body: some View
   {
      if let docking: Docking = dockingEntry as? Docking
      {
         NavigationLink( destination: DockingDetail( docking: docking ) )
         {
            DockingRow( docking: docking, nextDockingID: nextDockingID )
         }
      }
   }
}
