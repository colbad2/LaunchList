# LaunchList App

Front-end for the SpaceDevs launch API (https://ll.thespacedevs.com/2.1.0/swagger).


## App TODOs
### Core Data/JSON
- Don't insert duplicate entities, link them
- Can we collapse RocketJSON and ConfigurationJSON?
- Can we store list fetch requests?
- Roll status into launch entity
- load all JSON files into db when db is empty for that entity type
- merge various TypeJSON and StatusJSON structs since they all have the same JSON structure, even if their values might be different. Use an enum for each type.
### API loading
- Load db regularly
- All API loads
- response when throttled: {"detail": "Request was throttled. Expected available in 2429 seconds."} HTTP error code 429
- do we have to load locations.json/programs.json because the data are already in other structures?
- db download scheduler
- import dbs after app start, not before UI shown
### Redundency
- Program/Agency logos if not provided by the API
- Alternative internal logos for slow loading ones (ISS)
### Performance/efficiency
- save loaded images in db? pre-fill image cache with images from db?
### Beauty
- app icon, tab icons, db section icons
- TabView tab icons
- use a common date format
- logo, db list row icons
### navigation
- Any JSON with a mirror list of containers should have a nav link to that list (pad link to list of launches on that pad for example)
- Programmatically go to databse details pages from links in the next launch home page
- tap on tab icon should return nav to home
### Code
- switch tab tags to enum values
- use SwiftUI scrollTo proxy when it works in List
- fix console messages
-- error: regular expression substitution string doesn't start with 's': '‘s/(.+)/expr'
-- nw_protocol_get_quic_image_block_invoke dlopen libquic failed
- any code TODOs
- remove any unnneeded wrappers around strings in Text views: Text( "\(string)" )
### UI Features
- do all the stored JSON files as elements in the dataset list
- Timeline tab with merged launches/events/dockings etc
- settings (notifications, update schedule, force update)
- today buttons in all dated list item lists
- search tab/search element in lists/filter lists (filter by dates, countries, company, etc)
- remember scroll positions in lists during run/beteween runs
- instead of scrolling to today in list, scroll to date given in a sheet /date picker
- notification of launches
- widget with upcoming launch/event
- pad with number names need more info in their title
- launch flags
- generic wikipedia/google search
- limit large flag lists
- agency list flag smash titles
- top justify agency list items
- click on flag list in details views to get a detail view with flags and country names
- add flag lists to everything associated with an agency
### Bugs
- some images aren't updating in rows when they finally load from cache
- JSON can't be parsed with \" sequence in description strings"


## Xcode TODOs
- remove big headers from new file template
- write app that clears devicedata, removes elements form coredata files, locates template files
- remove "import Foundation" from templates


## Test/Profile/Analyse
- check that all previews work
- test in the sim that the bad UTF chars are fixed in all places
- unit test all JSON parsers
- code coverage testing
- run in profiler
- run analyze
- better handling of test data (gather test strings/files)


## Other TODOs
- GitHub project
- docs
- other online dbs?
- watch SwiftUI WWDC vids
- research GitHUb licenses
- macOS UI
- watch widget WWDCs
- better name?
- contact SpaceDevs?


## Articles that address issues
- https://lostmoa.com/blog/ScrollListToRowInSwiftUI/
- https://github.com/LostMoa/SwiftUI-Code-Examples/blob/main/ScrollListToRowInSwiftUI/SolutionForHierarchyWithMultipleLists/ScrollListToRowWhenThereAreMultipleLists.swift
- https://www.simpleswiftguide.com/how-to-present-new-sheet-view-from-navigationbaritems-button-in-swiftui/
- https://www.simpleswiftguide.com/swiftui-datepicker-tutorial-how-to-create-and-use-datepicker-in-swiftui/
- https://www.raywenderlich.com/5824937-swiftui-tutorial-navigation#toc-anchor-006
- https://nalexn.github.io/swiftui-deep-linking/
- https://fluffy.es/store-image-coredata/
- https://www.i18nqa.com/debug/utf8-debug.html


## To Read
- https://www.simpleswiftguide.com
- https://www.hackingwithswift.com/100/swiftui
- https://www.hackingwithswift.com/quick-start/swiftui


## Maintenence Checks
- remove "import Foundation" where not needed
- copyrights on each file
- comment blocks everywhere
- proper parameter/returns markup
- exmaples of use in comments
- example data for all data objects
- check indents, spaces
- public/private keywords
- code line length
