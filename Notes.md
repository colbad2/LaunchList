# LaunchList App

Front-end for the SpaceDevs launch API (https://ll.thespacedevs.com/2.1.0/swagger).


## Questions


## TODO

- Don't insert duplicate entites, link them
- Can we collapse RocketJSON and ConfigurationJSON?
- Can we store list fetch requests?
- Load launches from API
- Load db regularly
- All API loads
- check indents, spaces, comments
- use specialized views
- Program/Agency logos if not provided by the API
- Alternative internal logos for slow loading ones (ISS)
- app icon, tab icons, db section icons
- Any JSON with a mirror list of containers should have a nav link to that list (pad link to list of launches on that pad for example)
- response when throttled: {
"detail": "Request was throttled. Expected available in 2429 seconds."
} HTTP error code 429
- test in the sim that the bad UTF chars are fixed in all places
- Roll status into launch entity
- load all JSON files into db when db is empty for that entity type
- Programmatically go to databse details pages from links in the newxt launch home page
- switch tab tags to enum values
- do all the stored JSON files
- remove "import Foundation" all over the place
- merge various TypeJSON and StatusJSON structs since they all have the same JSON structure, even if their values might be different. Use an enum for each type.

## Xcode TODO
- remove big headers from new file template
- get app that clears devicedata, removes elements form coredata files, locates template files
