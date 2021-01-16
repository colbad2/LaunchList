// Copyright © 2021 Bradford Holcombe. All rights reserved.

import Intents
import SwiftUI
import WidgetKit

struct Provider: IntentTimelineProvider
{
   func placeholder(in context: Context) -> SimpleEntry
   {
      SimpleEntry( date: Date(), configuration: ConfigurationIntent() )
   }

   func getSnapshot( for configuration: ConfigurationIntent,
                     in context: Context,
                     completion: @escaping (SimpleEntry) -> Void )
   {
      let entry: SimpleEntry = SimpleEntry( date: Date(), configuration: configuration )
      completion( entry )
   }

   func getTimeline( for configuration: ConfigurationIntent,
                     in context: Context,
                     completion: @escaping (Timeline<Entry>) -> Void )
   {
      var entries: [SimpleEntry] = []

      // Generate a timeline consisting of five entries an hour apart, starting from the current date.
      let currentDate: Date = Date()
      for hourOffset in 0 ..< 5
      {
         if let entryDate: Date = Calendar.current.date( byAdding: .hour, value: hourOffset, to: currentDate )
         {
            let entry: SimpleEntry = SimpleEntry( date: entryDate, configuration: configuration )
            entries.append( entry )
         }
      }

      let timeline: Timeline = Timeline( entries: entries, policy: .atEnd )
      completion( timeline )
   }
}

struct SimpleEntry: TimelineEntry
{
   let date: Date
   let configuration: ConfigurationIntent
}

struct LaunchListWidgetEntryView: View
{
   var entry: Provider.Entry

   var body: some View
   {
      Text( entry.date, style: .time )
   }
}

@main
struct LaunchListWidget: Widget
{
   let kind: String = "LaunchListWidget"

   var body: some WidgetConfiguration
   {
      IntentConfiguration( kind: kind, intent: ConfigurationIntent.self, provider: Provider() )
      {
         entry in
         LaunchListWidgetEntryView( entry: entry )
      }
      .configurationDisplayName( "My Widget" )
      .description( "This is an example widget." )
   }
}

struct LaunchListWidget_Previews: PreviewProvider
{
   static var previews: some View
   {
      let entry: SimpleEntry = SimpleEntry( date: Date(), configuration: ConfigurationIntent() )
      LaunchListWidgetEntryView( entry: entry )
         .previewContext(WidgetPreviewContext( family: .systemSmall ) )
   }
}
