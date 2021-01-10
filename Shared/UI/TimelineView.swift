// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI
import CoreData

struct TimelineView: View
{
   @Binding var tabSelection: Int

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

         var v: AnyView = AnyView( Text( "any" ) )
         if listItem.isKind( of: Launch.self )
         {
            v = AnyView( TimelineLaunchItem( l: listItem as! Launch ) )
         }
         else if listItem.isKind( of: Event.self )
         {
            v = AnyView( TimelineEventItem( e: listItem as! Event ) )
         }
         else if listItem.isKind( of: Docking.self )
         {
            v = AnyView( TimelineDockingItem( d: listItem as! Docking ) )
         }

         return v
      }
      .navigationBarTitleDisplayMode( .inline )
      .toolbar( content:
      {
         ToolbarItem( placement: .navigationBarLeading, content: { Text( "Timeline" ).font( .title ) } )
         ToolbarItem( placement: .navigationBarTrailing, content:
                        {
                           HStack
                           {
                              Button( action: { self.indexPathToSetVisible = IndexPath( row: 0, section: 0 ) } )
                              {
                                 Image( systemName: "arrow.up.to.line" )
                              }
                              Button( action:
                                       {
                                          var i = 0
                                          for entity in timelineEntities
                                          {
                                             if entity.sortingDate! < Date()
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
                              Button( action: { self.indexPathToSetVisible = IndexPath( row: timelineEntities.count - 1, section: 0 ) })
                              {
                                 Image( systemName: "arrow.down.to.line" )
                              }
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
   var l: TimelineEntry

   var body: some View
   {
      let launch = l as! Launch
      NavigationLink( destination: LaunchDetail( launch: launch ) )
      {
         // TODO find id of launch with "Next" capsule
         LaunchRow( launch: launch, nextLaunchID: nil )
      }
   }
}

struct TimelineEventItem: View
{
   var e: TimelineEntry

   var body: some View
   {
      let event = e as! Event
      NavigationLink( destination: EventDetail( event: event ) )
      {
         // TODO find id of event with "Next" capsule
         EventRow( event: event )
      }
   }
}

struct TimelineDockingItem: View
{
   var d: TimelineEntry

   var body: some View
   {
      let docking = d as! Docking
      NavigationLink( destination: DockingDetail( docking: docking ) )
      {
         // TODO find id of docking with "Next" capsule
         DockingRow( docking: docking )
      }
   }
}
