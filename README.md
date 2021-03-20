LaunchList
==========

Front-end for the [SpaceDevs launch API](https://ll.thespacedevs.com/2.1.0/swagger).

This was a project to teach myself SwiftUI, but I became fond of it, and decided to give it the attention it deserved.

Currently, the data is fixed in the various JSON files provided in the project. Loading the whole database by API is a big effort, and
cannot be accomplished in a short time span without running up against the API's throttle limits. I fully intend to build an online fetch, but that is
a complicated effort, and I don't want to anger the API providers before I get it right. So, I will get to that after I am
happy with the UI.


## App TODOs
Things that need to happen for a good app 

### Core Data/JSON
- prefilled Core Data default data store (data only? images loaded separately)
- can we include the external file dir alongside the default data db files?
- reduce image sizes on import if storing in the db
- some duplicate Pads/ unknown pads with no info/ lat longs with extra zeros (west texas)/pads with no launches, no countries
### API loading
- Load db regularly
- All API loads
- response when throttled: {"detail": "Request was throttled. Expected available in 2429 seconds."} HTTP error code 429
- do we have to load locations.json/programs.json because the data are already in other structures?
- db download scheduler
- import dbs after app start, not before the UI is shown
- check Swagger for API parts that I may have missed. I am sure some sub-objects miss everything the API has
- Remove unused old JSON parsing code, including API response JSON structs
### Redundancy
- Program/Agency logos if not provided by the API
- Alternative internal logos for slow loading ones (ISS)
### Performance/efficiency
- pre-fill image cache with images from the db?
### Beauty
- tab icons
- use a common date format
- launch screen
### navigation
- Any JSON with a mirror list of containers should have a nav link to that list (pad link to list of launches on that pad for example)
- tap on home/timeline icons should return nav to home, just like datasets
### Code
- fix console messages
-- error: regular expression substitution string doesn't start with 's': '‘s/(.+)/expr'
-- nw_protocol_get_quic_image_block_invoke dlopen libquic failed
-- displayModeButtonItem is internally managed and not exposed for DoubleColumn style. Returning an empty, disconnected UIBarButtonItem to fulfill the non-null contract.
- mark any change from the API data with // DATABASE CHANGE, and gather those changes to a single class
### UI Features
- use timeline event list for home screen, not just launches.
- some images need a detailed image view (astronaut portraits, etc.)
- pare down the dataset lists to useful stuff only
- settings (notifications, update schedule, force update)
- today buttons in all dated list item lists, there may be more than one on a given day
- search tab/search element in lists/filter lists (filter by dates, countries, company, etc)
- instead of scrolling to today in list, scroll to date given in a sheet/date picker
- notification of launches
- widget with upcoming launch/event
- pad with number names need more info in their title
- launch flags
- generic wikipedia/google search
- add flag lists to everything associated with an agency
- better zoomable images
- flag list tap to see all countries listed in sheet
- settings with the data set/core data stats to help with default database inclusion, image fetch vs. db hits
- search for all datasets
- search keys for all searches
- info sheet for each search field with search keys, examples, etc.
- shortcuts for search keys ( agency: -> a: )
- search builder sheet
- searches between dates ( start:1998, end:2010 )
- the Roci/Bowman
- setting tools: clear memory image cache, clear CoreData images
- periodically re-fetch images, in case they have changed, or been updated
- previews for every view, working
- add launchers to the dataset list
- settings button to clear the image cache entirely, or images that are past a certain lifetime
- home page stuff deep links to datasets (can't be done yet in SwiftUI)
- I18N, translation?
- API fetch log in settings
### Bugs
- some images aren't updating in rows when they finally load from cache
- JSON can't be parsed with \" sequence in description strings"
- navigationLInk hit area seems too tall to match string

// TODO Pad at Guam International Airport has a map URL like "https://www.google.com/maps/place/35Â°03'34.0"N+118Â°09'06.0"W/"
// I fix it to "https://www.google.com/maps/place/35°03'34.0"N+118°09'06.0"W/", which works in a browser, but URL() fails
// to convert it to a URL. So, the pad doesn't have a map link it could have. Try to fix the link so that it works.
// A number of other map links have the issue


## Xcode TODOs
Things that Xcode does that need changing

- remove big headers from new file template
- write an app that clears devicedata, removes elements from coredata files, locates template files
- remove "import Foundation" from templates


## Waiting on SwiftUI
Things that Apple might improve on in the future

- search bar
- text area placeholders for search fields
- use SwiftUI scrollTo proxy when it works in List
- Programmatically go to database details pages from links in the next launch home page (not possible yet with SwiftUI)


## Test/Profile/Analyse
Things that would make the app perform better, more robustly

- check that all previews work
- test in the sim that the bad UTF chars are fixed in all places
- unit test all JSON parsers
- code coverage testing
- run in profiler
- run analyze
- better handling of test data (gather test strings/files)
- make sure the previews have access to full data


## Other TODOs
Things that need addressing that aren't the app itself.

- project license/copyrights
- docs/code-generated docs
- other online dbs?
- watch SwiftUI WWDC videos
- research GitHUb licenses
- macOS UI/iPad UI
- watch widget WWDCs
- better name?
- contact SpaceDevs?
- send data corrections to SpaceDevs (country code formats, missing country codes, bad chars in descriptions, …)
- see if https://go4liftoff.com/launches has any additional info we can use


## Articles that address issues
Articles that address particular features/problems that I haven't dealt with yet.

- https://lostmoa.com/blog/ScrollListToRowInSwiftUI/
- https://github.com/LostMoa/SwiftUI-Code-Examples/blob/main/ScrollListToRowInSwiftUI/SolutionForHierarchyWithMultipleLists/ScrollListToRowWhenThereAreMultipleLists.swift
- https://www.simpleswiftguide.com/how-to-present-new-sheet-view-from-navigationbaritems-button-in-swiftui/
- https://www.simpleswiftguide.com/swiftui-datepicker-tutorial-how-to-create-and-use-datepicker-in-swiftui/
- https://www.raywenderlich.com/5824937-swiftui-tutorial-navigation#toc-anchor-006
- https://nalexn.github.io/swiftui-deep-linking/
- https://fluffy.es/store-image-coredata/
- https://www.i18nqa.com/debug/utf8-debug.html
- https://stackoverflow.com/questions/60690933/swiftui-pop-to-root-view-when-selected-tab-is-tapped-again/60691250#60691250
- https://www.appcoda.com/core-data-preload-sqlite-database/
- https://developer.apple.com/library/archive/technotes/tn2350/_index.html
- https://developer.apple.com/forums/thread/61745
- https://developer.apple.com/forums/thread/117655
- https://fuckingswiftui.com/#tabview
- https://developer.apple.com/tutorials/swiftui/building-lists-and-navigation
- https://developer.apple.com/videos/play/wwdc2020/10037
- https://developer.apple.com/forums/thread/658828
- https://useyourloaf.com/blog/sharing-data-with-a-widget/
- https://www.raywenderlich.com/14958063-modern-efficient-core-data
- https://stackoverflow.com/questions/63759921/progressview-in-swiftui-2-0-how-to-display-the-progressview-during-an-operation
- https://www.answertopia.com/swiftui/working-with-gesture-recognizers-in-swiftui/
- https://www.raywenderlich.com/5824937-swiftui-tutorial-navigation#toc-anchor-006
- https://developer.apple.com/documentation/combine/receiving-and-handling-events-with-combine
- https://realm.github.io/SwiftLint/pattern_matching_keywords.html
- https://www.i18nqa.com/debug/utf8-debug.html
- https://github.com/joemasilotti/UI-Testing-Cheat-Sheet
- https://www.raywenderlich.com/14958063-modern-efficient-core-data
- https://www.raywenderlich.com/501-sourcery-tutorial-generating-swift-code-for-ios
- https://www.google.com/search?client=safari&rls=en&q=core+data+default+store&ie=UTF-8&oe=UTF-8
- https://www.vadimbulavin.com/network-connectivity-on-ios-with-swift/
- https://www.google.com/search?client=safari&rls=en&q=swift+load+json+from+URL&ie=UTF-8&oe=UTF-8
- https://programmingwithswift.com/parse-json-from-file-and-url-with-swift/
- https://developer.apple.com/library/archive/technotes/tn2350/_index.html
- https://www.google.com/search?client=safari&rls=en&q=xcode+default+database&ie=UTF-8&oe=UTF-8


## Data sources
- https://en.wikipedia.org/wiki/List_of_government_space_agencies
- https://www.spacelaunchschedule.com/agency/aeronautics-and-space-research-and-diffusion-center/
- https://github.com/r-spacex/SpaceX-API/tree/master/docs/v4
- https://flightclub.io/live


## To Read
Good sites that I just found, but haven't explored

- https://www.simpleswiftguide.com
- https://www.hackingwithswift.com/100/swiftui
- https://www.hackingwithswift.com/quick-start/swiftui
- https://nshipster.com


## Maintenance Checks
These have been completed, but tend to creep back in if we are not vigilant

- remove "import Foundation" where not needed
- copyrights on each file
- comment blocks everywhere
- proper parameter/returns markup
- examples of use in comments
- example data for all data objects
- check indents, spaces
- public/private keywords
- code line length

## External Tools

- [swift-code-metrics]{https://github.com/matsoftware/swift-code-metrics}
- [swiftlint]{}
- [Carthage]{}
- [Hippolyte]{https://github.com/JanGorman/Hippolyte} HTTP stub generator
- [Sourcery]{}
