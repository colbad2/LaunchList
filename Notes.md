# LaunchList App

Front-end for the SpaceDevs launch API (https://ll.thespacedevs.com/2.1.0/swagger).


## Questions

- Don't insert duplicate entites, link them
- What is the launch_library_id in some of the JSON objects? It differs from the API id. If useless, don't add them to CD entities.
- What are the URLs in some JSON objects for? Are they just URIs? They don't go anywhere. If useless, don't add them to CD entities.
- Can we collapse RocketJSON and ConfigurationJSON?
- Can we collapse OrbitJSON into MissionJSON?
- Can we store list fetch requests?


## TODO

- Update Core Data entities on a JSON parse
- Load launches from API
- Load db regularly
- All API loads
- check indents, spaces, comments
- Program/Agency logos if not provided by the API
- Don't put API URLs, or launchLibraryIDs,  in Core Data entities
- Alternative internal logos for slow loading ones (ISS)
- Any JSON with a mirror list of containers should have a nav link to that list (pad link to list of launches on that pad for example)
- response when throttled: {
"detail": "Request was throttled. Expected available in 2429 seconds."
} HTTP error code 429
