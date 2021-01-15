// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI
import CoreData

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

         var entryView: AnyView = AnyView( Text( "any" ) )
         if listItem.isKind( of: Launch.self )
         {
            entryView = AnyView( TimelineLaunchItem( launchEntry: listItem ) )
         }
         else if listItem.isKind( of: Event.self )
         {
            entryView = AnyView( TimelineEventItem( eventEntry: listItem ) )
         }
         else if listItem.isKind( of: Docking.self )
         {
            entryView = AnyView( TimelineDockingItem( dockingEntry: listItem ) )
         }

         return entryView
      }
      .navigationBarTitleDisplayMode( .inline )
      .toolbar( content:
      {
         ToolbarItem( placement: .navigationBarLeading, content: { Text( "Timeline" ).font( .title ).bold() } )
         ToolbarItem( placement: .navigationBarTrailing, content:
                        {
                           HStack
                           {
                              Button( action: { self.indexPathToSetVisible = IndexPath( row: 0, section: 0 ) },
                                      label: { Image( systemName: "arrow.up.to.line" ) } )
                              Button( action:
                                       {
                                          var entityIndex = 0
                                          for entity in timelineEntities
                                          {
                                             if entity.sortingDate! < Date()
                                             {
                                                entityIndex -= 1
                                                if entityIndex < 0 { entityIndex = 0 }
                                                break
                                             }
                                             entityIndex += 1
                                          }
                                          self.indexPathToSetVisible = IndexPath( row: entityIndex, section: 0 )
                                       },
                                      label:
                                       {
                                          Image( systemName: "calendar" )
                                       } )
                              Button( action: { self.indexPathToSetVisible =
                                                   IndexPath( row: timelineEntities.count - 1, section: 0 ) },
                                      label: { Image( systemName: "arrow.down.to.line" ) } )
                           }
                        })
      } )
      .overlay(
          ScrollManagerView( indexPathToSetVisible: $indexPathToSetVisible )
              .allowsHitTesting( false ).frame( width: 0, height: 0 )
      )
   }
}

struct TimelineLaunchItem: View
{
   var launchEntry: TimelineEntry

   var body: some View
   {
      if let launch = launchEntry as? Launch
      {
         NavigationLink( destination: LaunchDetail( launch: launch ) )
         {
            // TODO find id of launch with "Next" capsule
            LaunchRow( launch: launch, nextLaunchID: nil )
         }
      }
   }
}

struct TimelineEventItem: View
{
   var eventEntry: TimelineEntry

   var body: some View
   {
      if let event = eventEntry as? Event
      {
         NavigationLink( destination: EventDetail( event: event ) )
         {
            // TODO find id of event with "Next" capsule
            EventRow( event: event )
         }
      }
   }
}

struct TimelineDockingItem: View
{
   var dockingEntry: TimelineEntry

   var body: some View
   {
      if let docking = dockingEntry as? Docking
      {
         NavigationLink( destination: DockingDetail( docking: docking ) )
         {
            // TODO find id of docking with "Next" capsule
            DockingRow( docking: docking )
         }
      }
   }
}
