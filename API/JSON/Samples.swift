// Copyright © 2021 Bradford Holcombe. All rights reserved.

import CoreData

// swiftlint:disable line_length
// swiftlint:disable file_length
// swiftlint:disable force_unwrapping

private let getLaunchListJSON =
"""
{
"count": 170,
"next": "https://ll.thespacedevs.com/2.1.0/launch/upcoming/?hide_recent_previous=false&include_suborbital=true&is_crewed=false&limit=10&offset=10&related=false",
"previous": null,
"results": [
{
"id": "f213a5df-579a-4682-8143-df228e463049",
"url": "https://ll.thespacedevs.com/2.1.0/launch/f213a5df-579a-4682-8143-df228e463049/",
"launch_library_id": 1965,
"slug": "falcon-9-block-5-transporter-1-dedicated-sso-rides",
"name": "Falcon 9 Block 5 | Transporter 1 (Dedicated SSO Rideshare)",
"status": {
"id": 1,
"name": "Go for Launch",
"abbrev": "Go",
"description": "Current T-0 confirmed by official or reliable sources."
},
"net": "2021-01-24T15:00:00Z",
"window_end": "2021-01-24T15:22:00Z",
"window_start": "2021-01-24T15:00:00Z",
"inhold": false,
"tbdtime": false,
"tbddate": false,
"probability": 70,
"holdreason": "",
"failreason": "",
"hashtag": null,
"launch_service_provider": {
"id": 121,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/121/",
"name": "SpaceX",
"type": "Commercial"
},
"rocket": {
"id": 2518,
"configuration": {
"id": 164,
"launch_library_id": 188,
"url": "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
"name": "Falcon 9 Block 5",
"family": "Falcon",
"full_name": "Falcon 9 Block 5",
"variant": "Block 5"
}
},
"mission": {
"id": 1223,
"launch_library_id": null,
"name": "Transporter 1 (Dedicated SSO Rideshare)",
"description": "Transporter 1 mission is a dedicated rideshare flight to a sun-synchronous orbit with dozens of small microsatellites and nanosatellites for commercial and government customers.",
"launch_designator": null,
"type": "Dedicated Rideshare",
"orbit": {
"id": 17,
"name": "Sun-Synchronous Orbit",
"abbrev": "SSO"
}
},
"pad": {
"id": 80,
"url": "https://ll.thespacedevs.com/2.1.0/pad/80/",
"agency_id": 121,
"name": "Space Launch Complex 40",
"info_url": null,
"wiki_url": "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_40",
"map_url": "http://maps.google.com/maps?q=28.56194122,-80.57735736",
"latitude": "28.56194122",
"longitude": "-80.57735736",
"location": {
"id": 12,
"url": "https://ll.thespacedevs.com/2.1.0/location/12/",
"name": "Cape Canaveral, FL, USA",
"country_code": "USA",
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
"total_launch_count": 209,
"total_landing_count": 20
},
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_80_20200803143323.jpg",
"total_launch_count": 64
},
"webcast_live": false,
"image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/falcon2520925_image_20210122224307.jpeg",
"infographic": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/falcon2520925_infographic_20210122005810.jpeg",
"program": []
},
{
"id": "44670393-85da-4504-99f3-e5b95d71cbb6",
"url": "https://ll.thespacedevs.com/2.1.0/launch/44670393-85da-4504-99f3-e5b95d71cbb6/",
"launch_library_id": null,
"slug": "starship-sn9-10-km-flight",
"name": "Starship SN9 | 10 km Flight",
"status": {
"id": 8,
"name": "To Be Confirmed",
"abbrev": "TBC",
"description": "Awaiting official confirmation - current date is known with some certainty."
},
"net": "2021-01-25T14:00:00Z",
"window_end": "2021-01-25T23:59:00Z",
"window_start": "2021-01-25T14:00:00Z",
"inhold": false,
"tbdtime": false,
"tbddate": false,
"probability": null,
"holdreason": "",
"failreason": "",
"hashtag": null,
"launch_service_provider": {
"id": 121,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/121/",
"name": "SpaceX",
"type": "Commercial"
},
"rocket": {
"id": 2815,
"configuration": {
"id": 207,
"launch_library_id": null,
"url": "https://ll.thespacedevs.com/2.1.0/config/launcher/207/",
"name": "Starship Prototype",
"family": "Starship",
"full_name": "Starship Prototype",
"variant": "Prototype"
}
},
"mission": {
"id": 1224,
"launch_library_id": null,
"name": "10 km Flight",
"description": "The SN9 Starship prototype will attempt a first flight similar to the one performed by SN8. It consists of a powered ascent to an altitude of 10 km or 32,800 ft, followed by a belly flop maneuver, controlled descent, landing flip maneuver and landing.",
"launch_designator": null,
"type": "Test Flight",
"orbit": {
"id": 15,
"name": "Suborbital",
"abbrev": "Sub"
}
},
"pad": {
"id": 187,
"url": "https://ll.thespacedevs.com/2.1.0/pad/187/",
"agency_id": null,
"name": "Launch Pad B",
"info_url": null,
"wiki_url": "https://en.wikipedia.org/wiki/SpaceX_South_Texas_Launch_Site",
"map_url": "https://www.google.com/maps?q=25.997116+N,+97.15503099856647+W",
"latitude": "25.997116",
"longitude": "-97.15503099856647",
"location": {
"id": 143,
"url": "https://ll.thespacedevs.com/2.1.0/location/143/",
"name": "SpaceX Space Launch Facility, TX, USA",
"country_code": "USA",
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_143_20200803142438.jpg",
"total_launch_count": 5,
"total_landing_count": 5
},
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_launch_pad_b_20201211004226.jpg",
"total_launch_count": 0
},
"webcast_live": false,
"image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/starship2520sn_image_20210107083733.jpeg",
"infographic": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/starship2520sn_infographic_20210122053825.png",
"program": [
{
"id": 1,
"url": "https://ll.thespacedevs.com/2.1.0/program/1/",
"name": "SpaceX Starship",
"description": "The SpaceX Starship is a fully reusable super heavy-lift launch vehicle under development by SpaceX since 2012, as a self-funded private spaceflight project.  The second stage of the Starship — is designed as a long-duration cargo and passenger-carrying spacecraft. It is expected to be initially used without any booster stage at all, as part of an extensive development program to prove out launch-and-landing and iterate on a variety of design details, particularly with respect to the vehicle's atmospheric reentry.",
"agencies": [
{
"id": 121,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/121/",
"name": "SpaceX",
"type": "Commercial"
}
],
"image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/spacex2520star_program_20201129204513.png",
"start_date": "2019-03-01T05:00:00Z",
"end_date": null,
"info_url": "https://www.spacex.com/vehicles/starship/",
"wiki_url": "https://en.wikipedia.org/wiki/SpaceX_Starship"
}
]
},
{
"id": "dfd4f0e0-0ab4-494d-bd88-1b93b934b269",
"url": "https://ll.thespacedevs.com/2.1.0/launch/dfd4f0e0-0ab4-494d-bd88-1b93b934b269/",
"launch_library_id": null,
"slug": "falcon-9-block-5-starlink-17",
"name": "Falcon 9 Block 5 | Starlink 17",
"status": {
"id": 2,
"name": "To Be Determined",
"abbrev": "TBD",
"description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources."
},
"net": "2021-01-29T12:30:00Z",
"window_end": "2021-01-29T12:30:00Z",
"window_start": "2021-01-29T12:30:00Z",
"inhold": false,
"tbdtime": false,
"tbddate": false,
"probability": null,
"holdreason": "",
"failreason": "",
"hashtag": null,
"launch_service_provider": {
"id": 121,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/121/",
"name": "SpaceX",
"type": "Commercial"
},
"rocket": {
"id": 2820,
"configuration": {
"id": 164,
"launch_library_id": 188,
"url": "https://ll.thespacedevs.com/2.1.0/config/launcher/164/",
"name": "Falcon 9 Block 5",
"family": "Falcon",
"full_name": "Falcon 9 Block 5",
"variant": "Block 5"
}
},
"mission": {
"id": 1229,
"launch_library_id": null,
"name": "Starlink 17",
"description": "A batch of 60 satellites for Starlink mega-constellation - SpaceX's project for space-based Internet communication system.",
"launch_designator": null,
"type": "Communications",
"orbit": {
"id": 8,
"name": "Low Earth Orbit",
"abbrev": "LEO"
}
},
"pad": {
"id": 87,
"url": "https://ll.thespacedevs.com/2.1.0/pad/87/",
"agency_id": null,
"name": "Launch Complex 39A",
"info_url": null,
"wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A",
"map_url": "http://maps.google.com/maps?q=28.608+N,+80.604+W",
"latitude": "28.60822681",
"longitude": "-80.60428186",
"location": {
"id": 27,
"url": "https://ll.thespacedevs.com/2.1.0/location/27/",
"name": "Kennedy Space Center, FL, USA",
"country_code": "USA",
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
"total_launch_count": 183,
"total_landing_count": 0
},
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_87_20200803143537.jpg",
"total_launch_count": 126
},
"webcast_live": false,
"image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/falcon2520925_image_20210121062346.png",
"infographic": null,
"program": []
},
{
"id": "30412a48-cb4d-43d6-a304-6ae5f062504f",
"url": "https://ll.thespacedevs.com/2.1.0/launch/30412a48-cb4d-43d6-a304-6ae5f062504f/",
"launch_library_id": 2098,
"slug": "kuaizhou-1a-jilin-1-02d",
"name": "Kuaizhou-1A | Jilin-1-02D",
"status": {
"id": 2,
"name": "To Be Determined",
"abbrev": "TBD",
"description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources."
},
"net": "2021-01-31T00:00:00Z",
"window_end": "2021-01-31T00:00:00Z",
"window_start": "2021-01-31T00:00:00Z",
"inhold": false,
"tbdtime": true,
"tbddate": true,
"probability": -1,
"holdreason": "",
"failreason": "",
"hashtag": null,
"launch_service_provider": {
"id": 184,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/184/",
"name": "China Aerospace Science and Industry Corporation",
"type": "Government"
},
"rocket": {
"id": 2758,
"configuration": {
"id": 135,
"launch_library_id": 155,
"url": "https://ll.thespacedevs.com/2.1.0/config/launcher/135/",
"name": "Kuaizhou",
"family": "Kuaizhou",
"full_name": "Kuaizhou-1A",
"variant": "1A"
}
},
"mission": {
"id": 1156,
"launch_library_id": 1346,
"name": "Jilin-1-02D",
"description": "Jilin-1 is a series of Chinese commercial remote sensing satellites.",
"launch_designator": null,
"type": "Earth Science",
"orbit": null
},
"pad": {
"id": 71,
"url": "https://ll.thespacedevs.com/2.1.0/pad/71/",
"agency_id": null,
"name": "Unknown Pad",
"info_url": null,
"wiki_url": "",
"map_url": "",
"latitude": "40.958",
"longitude": "100.291",
"location": {
"id": 17,
"url": "https://ll.thespacedevs.com/2.1.0/location/17/",
"name": "Jiuquan, People's Republic of China",
"country_code": "CHN",
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_17_20200803142429.jpg",
"total_launch_count": 97,
"total_landing_count": 0
},
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_71_20200803143610.jpg",
"total_launch_count": 25
},
"webcast_live": false,
"image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/kuaizhou_image_20191027094423.jpeg",
"infographic": null,
"program": []
},
{
"id": "708c2b85-50d6-4baa-bd3e-fdfb0257ea50",
"url": "https://ll.thespacedevs.com/2.1.0/launch/708c2b85-50d6-4baa-bd3e-fdfb0257ea50/",
"launch_library_id": 2099,
"slug": "kuaizhou-1a-jilin-1-02f",
"name": "Kuaizhou-1A | Jilin-1-02F",
"status": {
"id": 2,
"name": "To Be Determined",
"abbrev": "TBD",
"description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources."
},
"net": "2021-01-31T00:00:00Z",
"window_end": "2021-01-31T00:00:00Z",
"window_start": "2021-01-31T00:00:00Z",
"inhold": false,
"tbdtime": true,
"tbddate": true,
"probability": -1,
"holdreason": "",
"failreason": "",
"hashtag": null,
"launch_service_provider": {
"id": 184,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/184/",
"name": "China Aerospace Science and Industry Corporation",
"type": "Government"
},
"rocket": {
"id": 2759,
"configuration": {
"id": 135,
"launch_library_id": 155,
"url": "https://ll.thespacedevs.com/2.1.0/config/launcher/135/",
"name": "Kuaizhou",
"family": "Kuaizhou",
"full_name": "Kuaizhou-1A",
"variant": "1A"
}
},
"mission": {
"id": 1157,
"launch_library_id": 1347,
"name": "Jilin-1-02F",
"description": "Jilin-1 is a series of Chinese commercial remote sensing satellites.",
"launch_designator": null,
"type": "Earth Science",
"orbit": null
},
"pad": {
"id": 71,
"url": "https://ll.thespacedevs.com/2.1.0/pad/71/",
"agency_id": null,
"name": "Unknown Pad",
"info_url": null,
"wiki_url": "",
"map_url": "",
"latitude": "40.958",
"longitude": "100.291",
"location": {
"id": 17,
"url": "https://ll.thespacedevs.com/2.1.0/location/17/",
"name": "Jiuquan, People's Republic of China",
"country_code": "CHN",
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_17_20200803142429.jpg",
"total_launch_count": 97,
"total_landing_count": 0
},
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_71_20200803143610.jpg",
"total_launch_count": 25
},
"webcast_live": false,
"image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/kuaizhou_image_20191027094423.jpeg",
"infographic": null,
"program": []
},
{
"id": "c179a24e-416b-4077-af8a-4670dfdb880a",
"url": "https://ll.thespacedevs.com/2.1.0/launch/c179a24e-416b-4077-af8a-4670dfdb880a/",
"launch_library_id": 1595,
"slug": "soyuz-21a-bars-m-no-3",
"name": "Soyuz 2.1a | Bars-M No. 3",
"status": {
"id": 2,
"name": "To Be Determined",
"abbrev": "TBD",
"description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources."
},
"net": "2021-01-31T00:00:00Z",
"window_end": "2021-01-31T00:00:00Z",
"window_start": "2021-01-31T00:00:00Z",
"inhold": false,
"tbdtime": true,
"tbddate": true,
"probability": -1,
"holdreason": "",
"failreason": "",
"hashtag": null,
"launch_service_provider": {
"id": 193,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/193/",
"name": "Russian Space Forces",
"type": "Government"
},
"rocket": {
"id": 78,
"configuration": {
"id": 24,
"launch_library_id": 49,
"url": "https://ll.thespacedevs.com/2.1.0/config/launcher/24/",
"name": "Soyuz 2.1A",
"family": "Soyuz",
"full_name": "Soyuz 2.1A",
"variant": "2.1A"
}
},
"mission": {
"id": 836,
"launch_library_id": 842,
"name": "Bars-M No. 3",
"description": "Bars-M is the second incarnation of the Bars project, which was started in the mid 1990ies to develop a successor for the Komtea class of area surveillance satellites. The original Bars project was halted in the early 2000s. In 2007, TsSKB-Progress was contracted for Bars-M, for which reportedly the Yantar-based service module was replaced by a new developed advanced service module.\n\nThe Bars-M satellites feature an electro-optical camera system called Karat, which is developed and built by the Leningrad Optical Mechanical Association (LOMO), and a dual laser altimeter instrument to deliver topographic imagery, stereo images, altimeter data and high-resolution images with a ground resolution around 1 meter.",
"launch_designator": null,
"type": "Government/Top Secret",
"orbit": {
"id": 17,
"name": "Sun-Synchronous Orbit",
"abbrev": "SSO"
}
},
"pad": {
"id": 85,
"url": "https://ll.thespacedevs.com/2.1.0/pad/85/",
"agency_id": 163,
"name": "43/4 (43R)",
"info_url": null,
"wiki_url": "",
"map_url": "http://maps.google.com/maps?q=62.929+N,+40.457+E",
"latitude": "62.92883",
"longitude": "40.457098",
"location": {
"id": 6,
"url": "https://ll.thespacedevs.com/2.1.0/location/6/",
"name": "Plesetsk Cosmodrome, Russian Federation",
"country_code": "RUS",
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_6_20200803142434.jpg",
"total_launch_count": 71,
"total_landing_count": 0
},
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_85_20200803143554.jpg",
"total_launch_count": 37
},
"webcast_live": false,
"image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/soyuz_2.1a_image_20201013143850.jpg",
"infographic": null,
"program": []
},
{
"id": "19407719-d66c-492d-9288-e5e6ddbadbd6",
"url": "https://ll.thespacedevs.com/2.1.0/launch/19407719-d66c-492d-9288-e5e6ddbadbd6/",
"launch_library_id": 2026,
"slug": "soyuz-21a-progress-ms-16-77p",
"name": "Soyuz 2.1a | Progress MS-16 (77P)",
"status": {
"id": 8,
"name": "To Be Confirmed",
"abbrev": "TBC",
"description": "Awaiting official confirmation - current date is known with some certainty."
},
"net": "2021-02-15T04:45:00Z",
"window_end": "2021-02-15T04:45:00Z",
"window_start": "2021-02-15T04:45:00Z",
"inhold": false,
"tbdtime": true,
"tbddate": true,
"probability": -1,
"holdreason": "",
"failreason": "",
"hashtag": null,
"launch_service_provider": {
"id": 63,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/63/",
"name": "Russian Federal Space Agency (ROSCOSMOS)",
"type": "Government"
},
"rocket": {
"id": 2613,
"configuration": {
"id": 24,
"launch_library_id": 49,
"url": "https://ll.thespacedevs.com/2.1.0/config/launcher/24/",
"name": "Soyuz 2.1A",
"family": "Soyuz",
"full_name": "Soyuz 2.1A",
"variant": "2.1A"
}
},
"mission": {
"id": 1213,
"launch_library_id": null,
"name": "Progress MS-16",
"description": "The Progress MS-16 Spacecraft will resupply the International Space Station.",
"launch_designator": null,
"type": "Resupply",
"orbit": {
"id": 8,
"name": "Low Earth Orbit",
"abbrev": "LEO"
}
},
"pad": {
"id": 20,
"url": "https://ll.thespacedevs.com/2.1.0/pad/20/",
"agency_id": null,
"name": "31/6",
"info_url": null,
"wiki_url": "",
"map_url": "http://maps.google.com/maps?q=45.996+N,+63.564+E",
"latitude": "45.996034",
"longitude": "63.564003",
"location": {
"id": 15,
"url": "https://ll.thespacedevs.com/2.1.0/location/15/",
"name": "Baikonur Cosmodrome, Republic of Kazakhstan",
"country_code": "KAZ",
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_15_20200803142517.jpg",
"total_launch_count": 465,
"total_landing_count": 0
},
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_20_20200803143516.jpg",
"total_launch_count": 75
},
"webcast_live": false,
"image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/soyuz_2.1a_image_20201013143850.jpg",
"infographic": null,
"program": [
{
"id": 17,
"url": "https://ll.thespacedevs.com/2.1.0/program/17/",
"name": "International Space Station",
"description": "The International Space Station programme is tied together by a complex set of legal, political and financial agreements between the sixteen nations involved in the project, governing ownership of the various components, rights to crewing and utilization, and responsibilities for crew rotation and resupply of the International Space Station. It was conceived in 1984 by President Ronald Reagan, during the Space Station Freedom project as it was originally called.",
"agencies": [
{
"id": 16,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/16/",
"name": "Canadian Space Agency",
"type": "Government"
},
{
"id": 27,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/27/",
"name": "European Space Agency",
"type": "Multinational"
},
{
"id": 37,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/37/",
"name": "Japan Aerospace Exploration Agency",
"type": "Government"
},
{
"id": 44,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/44/",
"name": "National Aeronautics and Space Administration",
"type": "Government"
},
{
"id": 63,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/63/",
"name": "Russian Federal Space Agency (ROSCOSMOS)",
"type": "Government"
}
],
"image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/international2_program_20201129184745.png",
"start_date": "1998-11-20T06:40:00Z",
"end_date": null,
"info_url": "https://www.nasa.gov/mission_pages/station/main/index.html",
"wiki_url": "https://en.wikipedia.org/wiki/International_Space_Station_programme"
}
]
},
{
"id": "f1a8d62e-709d-4e89-ade9-a8779492c7a9",
"url": "https://ll.thespacedevs.com/2.1.0/launch/f1a8d62e-709d-4e89-ade9-a8779492c7a9/",
"launch_library_id": 2044,
"slug": "antares-230-cygnus-crs-2-ng-15",
"name": "Antares 230+ | Cygnus CRS-2 NG-15",
"status": {
"id": 8,
"name": "To Be Confirmed",
"abbrev": "TBC",
"description": "Awaiting official confirmation - current date is known with some certainty."
},
"net": "2021-02-20T17:36:00Z",
"window_end": "2021-02-20T17:36:00Z",
"window_start": "2021-02-20T17:36:00Z",
"inhold": false,
"tbdtime": true,
"tbddate": true,
"probability": -1,
"holdreason": "",
"failreason": "",
"hashtag": null,
"launch_service_provider": {
"id": 257,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/257/",
"name": "Northrop Grumman Innovation Systems",
"type": "Commercial"
},
"rocket": {
"id": 2677,
"configuration": {
"id": 210,
"launch_library_id": 241,
"url": "https://ll.thespacedevs.com/2.1.0/config/launcher/210/",
"name": "Antares 230+",
"family": "Antares",
"full_name": "Antares 230+",
"variant": "230+"
}
},
"mission": null,
"pad": {
"id": 76,
"url": "https://ll.thespacedevs.com/2.1.0/pad/76/",
"agency_id": 44,
"name": "Launch Area 0 A",
"info_url": null,
"wiki_url": "",
"map_url": "http://maps.google.com/maps?q=37.8337+N,+75.4881+W",
"latitude": "37.8337",
"longitude": "-75.4881",
"location": {
"id": 21,
"url": "https://ll.thespacedevs.com/2.1.0/location/21/",
"name": "Wallops Island, Virginia, USA",
"country_code": "USA",
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_21_20200803142423.jpg",
"total_launch_count": 20,
"total_landing_count": 0
},
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_76_20200803143538.jpg",
"total_launch_count": 13
},
"webcast_live": false,
"image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/antares2520230252b_image_20191102024633.jpeg",
"infographic": null,
"program": [
{
"id": 11,
"url": "https://ll.thespacedevs.com/2.1.0/program/11/",
"name": "Commercial Resupply Services",
"description": "Commercial Resupply Services (CRS) are a series of flights awarded by NASA for the delivery of cargo and supplies to the International Space Station.The first CRS contracts were signed in 2008 and awarded $1.6 billion to SpaceX for twelve cargo Dragon and $1.9 billion to Orbital Sciences for eight Cygnus flights, covering deliveries to 2016. The Falcon 9 and Antares rockets were also developed under the CRS program to deliver cargo spacecraft to the ISS.",
"agencies": [
{
"id": 44,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/44/",
"name": "National Aeronautics and Space Administration",
"type": "Government"
},
{
"id": 257,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/257/",
"name": "Northrop Grumman Innovation Systems",
"type": "Commercial"
},
{
"id": 1020,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/1020/",
"name": "Sierra Nevada Corporation",
"type": "Commercial"
},
{
"id": 121,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/121/",
"name": "SpaceX",
"type": "Commercial"
}
],
"image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/commercial2520_program_20201129212219.png",
"start_date": "2008-12-23T00:00:00Z",
"end_date": null,
"info_url": null,
"wiki_url": "https://en.wikipedia.org/wiki/Commercial_Resupply_Services#Commercial_Resupply_Services"
}
]
},
{
"id": "6bd4d3d9-d76d-4348-99d3-fad749b6b863",
"url": "https://ll.thespacedevs.com/2.1.0/launch/6bd4d3d9-d76d-4348-99d3-fad749b6b863/",
"launch_library_id": 1945,
"slug": "soyuz-21bfregat-m-oneweb-5",
"name": "Soyuz 2.1b/Fregat-M | OneWeb 5",
"status": {
"id": 2,
"name": "To Be Determined",
"abbrev": "TBD",
"description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources."
},
"net": "2021-02-25T00:00:00Z",
"window_end": "2021-02-25T00:00:00Z",
"window_start": "2021-02-25T00:00:00Z",
"inhold": false,
"tbdtime": true,
"tbddate": true,
"probability": -1,
"holdreason": "",
"failreason": "",
"hashtag": null,
"launch_service_provider": {
"id": 115,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/115/",
"name": "Arianespace",
"type": "Commercial"
},
"rocket": {
"id": 2601,
"configuration": {
"id": 134,
"launch_library_id": 153,
"url": "https://ll.thespacedevs.com/2.1.0/config/launcher/134/",
"name": "Soyuz 2.1B",
"family": "Soyuz",
"full_name": "Soyuz 2.1B Fregat-M",
"variant": "Fregat-M"
}
},
"mission": null,
"pad": {
"id": 83,
"url": "https://ll.thespacedevs.com/2.1.0/pad/83/",
"agency_id": 63,
"name": "Cosmodrome Site 1S",
"info_url": null,
"wiki_url": "https://en.wikipedia.org/wiki/Vostochny_Cosmodrome",
"map_url": "https://www.google.ee/maps/place/51Â°53'03.8\"N+128Â°20'02.2\"E/",
"latitude": "51.884395",
"longitude": "128.333932",
"location": {
"id": 18,
"url": "https://ll.thespacedevs.com/2.1.0/location/18/",
"name": "Vostochny Cosmodrome, Siberia, Russian Federation",
"country_code": "RUS",
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_18_20200803142401.jpg",
"total_launch_count": 6,
"total_landing_count": 0
},
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_83_20200803143544.jpg",
"total_launch_count": 6
},
"webcast_live": false,
"image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/soyuz25202.1b_image_20190520165337.jpg",
"infographic": null,
"program": []
},
{
"id": "495fe114-753d-48b1-9d23-eb9adaa3fb23",
"url": "https://ll.thespacedevs.com/2.1.0/launch/495fe114-753d-48b1-9d23-eb9adaa3fb23/",
"launch_library_id": 1347,
"slug": "atlas-v-551-stp-3",
"name": "Atlas V 551 | STP-3",
"status": {
"id": 2,
"name": "To Be Determined",
"abbrev": "TBD",
"description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources."
},
"net": "2021-02-26T00:00:00Z",
"window_end": "2021-02-26T00:00:00Z",
"window_start": "2021-02-26T00:00:00Z",
"inhold": false,
"tbdtime": true,
"tbddate": false,
"probability": -1,
"holdreason": "",
"failreason": "",
"hashtag": null,
"launch_service_provider": {
"id": 124,
"url": "https://ll.thespacedevs.com/2.1.0/agencies/124/",
"name": "United Launch Alliance",
"type": "Commercial"
},
"rocket": {
"id": 111,
"configuration": {
"id": 27,
"launch_library_id": 37,
"url": "https://ll.thespacedevs.com/2.1.0/config/launcher/27/",
"name": "Atlas V 551",
"family": "Atlas",
"full_name": "Atlas V 551",
"variant": "551"
}
},
"mission": null,
"pad": {
"id": 29,
"url": "https://ll.thespacedevs.com/2.1.0/pad/29/",
"agency_id": null,
"name": "Space Launch Complex 41",
"info_url": null,
"wiki_url": "https://en.wikipedia.org/wiki/Cape_Canaveral_Air_Force_Station_Space_Launch_Complex_41",
"map_url": "http://maps.google.com/maps?q=28.58341025,-80.58303644",
"latitude": "28.58341025",
"longitude": "-80.58303644",
"location": {
"id": 12,
"url": "https://ll.thespacedevs.com/2.1.0/location/12/",
"name": "Cape Canaveral, FL, USA",
"country_code": "USA",
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_12_20200803142519.jpg",
"total_launch_count": 209,
"total_landing_count": 20
},
"map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_29_20200803143528.jpg",
"total_launch_count": 71
},
"webcast_live": false,
"image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/atlas2520v2520551_image_20190224012316.jpeg",
"infographic": null,
"program": []
}
]
}
"""

/**
 Gets an example `AgencyJSON` struct for previews.

 - returns: `AgencyJSON` struct suitable for previewing
 */
public func getSampleAgency() -> AgencyJSON
{
   AgencyJSON( parseJSON( jsonString: sampleAgencyJSON ) )!
}

private let sampleAgencyJSON =
   """
{
   "id": 63,
   "url": "https://ll.thespacedevs.com/2.1.0/agencies/63/",
   "name": "Russian Federal Space Agency (ROSCOSMOS)",
   "featured": true,
   "type": "Government",
   "country_code": "RUS",
   "abbrev": "RFSA",
   "description": "The Roscosmos State Corporation for Space Activities, commonly known as Roscosmos, is the governmental body responsible for the space science program of the Russian Federation and general aerospace research. Soyuz has many launch locations the Russian sites are Baikonur, Plesetsk and Vostochny however Ariane also purchases the vehicle and launches it from French Guiana.",
   "administrator": "Administrator: Dmitry Rogozin",
   "founding_year": "1992",
   "launchers": "Soyuz",
   "spacecraft": "Soyuz",
   "parent": null,
   "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/agency_images/russian2520federal2520space2520agency25202528roscosmos2529_image_20190207032459.jpeg"
}
"""

/**
 Gets an example `AstronautJSON` struct for previews.

 - returns: `AstronautJSON` struct suitable for previewing
 */
public func getSampleAstronaut() -> AstronautJSON
{
   AstronautJSON( parseJSON( jsonString: sampleAstronautJSON ) )!
}

private let sampleAstronautJSON =
   """
 {
   "id": 276,
   "url": "https://ll.thespacedevs.com/2.1.0/astronaut/276/",
   "name": "Franz Viehböck",
   "status": {
     "id": 2,
     "name": "Retired"
   },
   "type": {
     "id": 2,
     "name": "Government"
   },
   "date_of_birth": "1960-08-24",
   "date_of_death": null,
   "nationality": "Austrian",
   "bio": "Franz Artur Viehböck (born August 24, 1960 in Vienna) is an Austrian electrical engineer, and was Austria's first cosmonaut. He was titulated „Austronaut“ by his country's media. He visited the Mir space station in 1991 aboard Soyuz TM-13, returning aboard Soyuz TM-12 after spending just over a week in space.",
   "twitter": null,
   "instagram": null,
   "wiki": "https://en.wikipedia.org/wiki/Franz_Viehb%C3%B6ck",
   "agency": {
     "id": 8,
     "url": "https://ll.thespacedevs.com/2.1.0/agencies/8/",
     "name": "Austrian Space Agency",
     "featured": false,
     "type": "Government",
     "country_code": "AUT",
     "abbrev": "ALR",
     "description": "The Austrian Space Agency was founded in 1972 and joined the ESA as a member in 1987. In 2005, control of the ALR was transferred to the Austrian Agency for Aerospace. They coordinated the first flight of an Austrian in space with a Soyuz launch in 1990.",
     "administrator": "Andreas Geisler",
     "founding_year": "1972",
     "launchers": "",
     "spacecraft": "Spacelab | GALILEO",
     "parent": null,
     "image_url": null
   },
   "profile_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/astronaut_images/franz2520viehb25c325b6ck_image_20181201223901.jpg",
   "profile_image_thumbnail": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/default/cache/54/57/5457ce75acb7b188196eb442e3f17b64.jpg",
   "last_flight": "1991-10-02T05:59:38Z",
   "first_flight": "1991-10-02T05:59:38Z"
 }
"""

/**
 Gets an example `DockingJSON` struct for previews.

 - returns: `DockingJSON` struct suitable for previewing
 */
public func getSampleDocking() -> DockingJSON
{
   DockingJSON( parseJSON( jsonString: sampleDockingJSON ) )!
}

private let sampleDockingJSON =
   """
 {
   "id": 100,
   "url": "https://ll.thespacedevs.com/2.1.0/docking_event/100/",
   "launch_id": "349eb56f-50e8-4858-9977-e4b7121c40f5",
   "docking": "2009-10-02T08:35:00Z",
   "departure": "2010-03-18T08:03:00Z",
   "flight_vehicle": {
     "id": 220,
     "url": "https://ll.thespacedevs.com/2.1.0/spacecraft/flight/220/",
     "destination": "International Space Station",
     "mission_end": "2010-03-18T11:24:00Z",
     "spacecraft": {
       "id": 77,
       "url": "https://ll.thespacedevs.com/2.1.0/spacecraft/77/",
       "name": "Soyuz TMA-16",
       "serial_number": "Soyuz TMA 11F732A17 #226",
       "status": {
         "id": 4,
         "name": "Single Use"
       },
       "description": "Soyuz TMA-16 was a Soyuz spacecraft which launched on September 30 2009 07:14 UTC. It transported two members of the Expedition 21 crew and one participant to the International Space Station. The Expedition 21 crew consisted of Maksim Surayev and Jeffrey Williams. The spaceflight participant was tourist Guy Laliberté.",
       "spacecraft_config": {
         "id": 1,
         "url": "https://ll.thespacedevs.com/2.1.0/config/spacecraft/1/",
         "name": "Soyuz",
         "type": {
           "id": 1,
           "name": "Unknown"
         },
         "agency": {
           "id": 63,
           "url": "https://ll.thespacedevs.com/2.1.0/agencies/63/",
           "name": "Russian Federal Space Agency (ROSCOSMOS)",
           "type": "Government"
         },
         "in_use": true,
         "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/soyuz_image_20201015191152.jpg"
       }
     }
   },
   "docking_location": {
     "id": 2,
     "name": "Zvezda aft"
   }
 }
"""

/**
 Gets an example `EventJSON` struct for previews.

 - returns: `EventJSON` struct suitable for previewing
 */
public func getSampleEvent() -> EventJSON
{
   EventJSON( parseJSON( jsonString: sampleEventJSON ) )!
}

private let sampleEventJSON =
   """
  {
    "id": 206,
    "url": "https://ll.thespacedevs.com/2.1.0/event/206/",
    "slug": "starship-sn9-cryoproof-test",
    "name": "Starship SN9 Cryoproof Test",
    "type": {
      "id": 21,
      "name": "Cryoproof Test"
    },
    "description": "SpaceX will likely conduct a cryoproof test on Starship SN9. This is the first cryo test performed on the vehicle.",
    "location": "Boca Chica, Texas",
    "news_url": null,
    "video_url": "https://www.youtube.com/watch?v=Ky5l9ZxsG9M",
    "feature_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/event_images/starship_sn9_te_image_20201229002608.png",
    "date": "2020-12-29T23:00:00Z",
    "launches": [],
    "expeditions": [],
    "spacestations": [],
    "program": [
      {
        "id": 1,
        "url": "https://ll.thespacedevs.com/2.1.0/program/1/",
        "name": "SpaceX Starship",
        "description": "The SpaceX Starship is a fully reusable super heavy-lift launch vehicle under development by SpaceX since 2012, as a self-funded private spaceflight project.  The second stage of the Starship — is designed as a long-duration cargo and passenger-carrying spacecraft. It is expected to be initially used without any booster stage at all, as part of an extensive development program to prove out launch-and-landing and iterate on a variety of design details, particularly with respect to the vehicle's atmospheric reentry.",
        "agencies": [
          {
            "id": 121,
            "url": "https://ll.thespacedevs.com/2.1.0/agencies/121/",
            "name": "SpaceX",
            "type": "Commercial"
          }
        ],
        "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/spacex2520star_program_20201129204513.png",
        "start_date": "2019-03-01T05:00:00Z",
        "end_date": null,
        "info_url": "https://www.spacex.com/vehicles/starship/",
        "wiki_url": "https://en.wikipedia.org/wiki/SpaceX_Starship"
      }
    ]
  }
"""

/**
 Gets an example `ExpeditionJSON` struct for previews.

 - returns: `ExpeditionJSON` struct suitable for previewing
 */
public func getSampleExpedition() -> ExpeditionJSON
{
   ExpeditionJSON( parseJSON( jsonString: sampleExpeditionJSON ) )!
}

private let sampleExpeditionJSON =
"""
{
   "id": 81,
   "url": "https://ll.thespacedevs.com/2.1.0/expedition/81/",
   "name": "Expedition 47",
   "start": "2016-03-02T01:02:00Z",
   "end": "2016-06-18T05:52:00Z",
   "spacestation": {
     "id": 4,
     "url": "https://ll.thespacedevs.com/2.1.0/spacestation/4/",
     "name": "International Space Station",
     "status": {
       "id": 1,
       "name": "Active"
     },
     "orbit": "Low Earth Orbit",
     "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/spacestation_images/international2520space2520station_image_20190220215716.jpeg"
   }
}
"""

/**
 Gets an example `FlightVehicleJSON` struct for previews.

 - returns: `FlightVehicleJSON` struct suitable for previewing
 */
public func getSampleFlightVehicle() -> FlightVehicleJSON
{
   FlightVehicleJSON( parseJSON( jsonString: sampleFlightVehicleJSON ) )!
}

private let sampleFlightVehicleJSON =
"""
{
  "id": 220,
  "url": "https://ll.thespacedevs.com/2.1.0/spacecraft/flight/220/",
  "destination": "International Space Station",
  "mission_end": "2010-03-18T11:24:00Z",
  "spacecraft": {
    "id": 77,
    "url": "https://ll.thespacedevs.com/2.1.0/spacecraft/77/",
    "name": "Soyuz TMA-16",
    "serial_number": "Soyuz TMA 11F732A17 #226",
    "status": {
      "id": 4,
      "name": "Single Use"
    },
    "description": "Soyuz TMA-16 was a Soyuz spacecraft which launched on September 30 2009 07:14 UTC. It transported two members of the Expedition 21 crew and one participant to the International Space Station. The Expedition 21 crew consisted of Maksim Surayev and Jeffrey Williams. The spaceflight participant was tourist Guy Laliberté.",
    "spacecraft_config": {
      "id": 1,
      "url": "https://ll.thespacedevs.com/2.1.0/config/spacecraft/1/",
      "name": "Soyuz",
      "type": {
        "id": 1,
        "name": "Unknown"
      },
      "agency": {
        "id": 63,
        "url": "https://ll.thespacedevs.com/2.1.0/agencies/63/",
        "name": "Russian Federal Space Agency (ROSCOSMOS)",
        "type": "Government"
      },
      "in_use": true,
      "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/soyuz_image_20201015191152.jpg"
    }
  }
}
"""

/**
 Gets an example `LauncherConfigJSON` struct for previews.

 - returns: `LauncherConfigJSON` struct suitable for previewing
 */
public func getSampleLauncherConfig() -> LauncherConfigJSON
{
   LauncherConfigJSON( parseJSON( jsonString: sampleLauncherConfigJSON ) )!
}

private let sampleLauncherConfigJSON =
   """
 {
     "id": 169,
     "launch_library_id": 90,
     "url": "https://ll.thespacedevs.com/2.1.0/config/launcherConfig/169/",
     "name": "Falcon 9 v1.0",
     "family": "Falcon",
     "full_name": "Falcon 9 v1.0",
     "variant": "v1.0"
   }
"""

/**
 Gets an example `LauncherJSON` struct for previews.

 - returns: `LauncherJSON` struct suitable for previewing
 */
public func getSampleLauncher() -> LauncherJSON
{
   LauncherJSON( parseJSON( jsonString: sampleLauncherJSON ) )!
}

private let sampleLauncherJSON =
   """
 {
   "id": 8,
   "url": "https://ll.thespacedevs.com/2.1.0/launcher/8/",
   "flight_proven": false,
   "serial_number": "B0003",
   "status": "expended",
   "details": "Core expended on flight, no recovery effort. First flight of Falcon 9",
   "launcher_config": {
     "id": 169,
     "launch_library_id": 90,
     "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/169/",
     "name": "Falcon 9 v1.0",
     "family": "Falcon",
     "full_name": "Falcon 9 v1.0",
     "variant": "v1.0"
   },
   "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_core_images/8_image_20191115082425.jpg",
   "flights": 1,
   "last_launch_date": "2010-06-04T18:45:00Z",
   "first_launch_date": "2010-06-04T18:45:00Z"
 }
"""

/**
 Gets an example `LaunchJSON` struct for previews.

 - returns: `LaunchJSON` struct suitable for previewing
 */
public func getSampleLaunch() -> LaunchJSON
{
   LaunchJSON( parseJSON( jsonString: sampleLaunchJSON ) )!
}

private let sampleLaunchJSON =
   """
{
  "id": "724dd8ce-78ec-4dad-b17c-ff66c257fab7",
  "url": "https://ll.thespacedevs.com/2.1.0/launch/724dd8ce-78ec-4dad-b17c-ff66c257fab7/",
  "launch_library_id": 1943,
  "slug": "sls-block-1b-artemis-7",
  "name": "SLS Block 1B | Artemis-7",
  "status": {
    "id": 2,
    "name": "To Be Determined",
    "abbrev": "TBD",
    "description": "Current date is a 'No Earlier Than' estimation based on unreliable or interpreted sources."
  },
  "net": "2028-01-01T00:00:00Z",
  "window_end": "2028-01-01T00:00:00Z",
  "window_start": "2028-01-01T00:00:00Z",
  "inhold": false,
  "tbdtime": false,
  "tbddate": false,
  "probability": -1,
  "holdreason": null,
  "failreason": null,
  "hashtag": null,
  "launch_service_provider": {
    "id": 44,
    "url": "https://ll.thespacedevs.com/2.1.0/agencies/44/",
    "name": "National Aeronautics and Space Administration",
    "type": "Government"
  },
  "rocket": {
    "id": 2548,
    "configuration": {
      "id": 205,
      "launch_library_id": 236,
      "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/205/",
      "name": "SLS Block 1B",
      "family": "",
      "full_name": "SLS Block 1B",
      "variant": ""
    }
  },
  "mission": null,
  "pad": {
    "id": 4,
    "url": "https://ll.thespacedevs.com/2.1.0/pad/4/",
    "agency_id": 44,
    "name": "Launch Complex 39B",
    "info_url": null,
    "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39B",
    "map_url": "http://maps.google.com/maps?q=28.627+N,+80.621+W",
    "latitude": "28.62711233",
    "longitude": "-80.62101503",
    "location": {
      "id": 27,
      "url": "https://ll.thespacedevs.com/2.1.0/location/27/",
      "name": "Kennedy Space Center, FL, USA",
      "country_code": "USA",
      "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
      "total_launch_count": 182,
      "total_landing_count": 0
    },
    "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_4_20200803143518.jpg",
    "total_launch_count": 57
  },
  "webcast_live": false,
  "image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launcher_images/sls_block_1b_image_20200905100013.jpeg",
  "infographic": null,
  "program": [
    {
      "id": 15,
      "url": "https://ll.thespacedevs.com/2.1.0/program/15/",
      "name": "Artemis",
      "description": "The Artemis program is a US government-funded crewed spaceflight program that has the goal of landing \\"the first woman and the next man\\" on the Moon, specifically at the lunar south pole region by 2024.",
      "agencies": [
        {
          "id": 44,
          "url": "https://ll.thespacedevs.com/2.1.0/agencies/44/",
          "name": "National Aeronautics and Space Administration",
          "type": "Government"
        }
      ],
      "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/artemis_program_20200821091844.png",
      "start_date": "2017-12-11T00:00:00Z",
      "end_date": null,
      "info_url": "https://www.nasa.gov/specials/artemis/",
      "wiki_url": "https://en.wikipedia.org/wiki/Artemis_program"
    }
  ]
}
"""

/**
 Gets an example `LiveStreamJSON` struct for previews.

 - returns: `LiveStreamJSON` struct suitable for previewing
 */
public func getSampleLiveStream() -> LiveStreamJSON
{
   LiveStreamJSON( parseJSON( jsonString: sampleLiveStreamJSON ) )!
}

private let sampleLiveStreamJSON =
"""
 {
   "title": "LabPadre 24/7 Livestream",
   "description": "LabPadre is a free 24/7 live stream of the SpaceX Starship construction and testing site in Boca Chica, Texas. Multi camera views placed in several locations capture every moment of the Starship's construction and testing. LabPadre is devoted to supporting and growing the amazing community surrounding SpaceX and their fascinating developments.",
   "image": "https://i.ytimg.com/vi/5QbM7Vsz3kg/maxresdefault_live.jpg",
   "url": "https://www.youtube.com/watch?v=Ky5l9ZxsG9M"
 }
"""

/**
 Gets an example `LocationJSON` struct for previews.

 - returns: `LocationJSON` struct suitable for previewing
 */
public func getSampleLocation() -> LocationJSON
{
   LocationJSON( parseJSON( jsonString: sampleLocationJSON ) )!
}

private let sampleLocationJSON =
   """
{
  "id": 10,
  "url": "https://ll.thespacedevs.com/2.1.0/location/10/",
  "name": "Onenui Station, Mahia Peninsula, New Zealand",
  "country_code": "NZL",
  "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_10_20200803142509.jpg",
  "total_launch_count": 17,
  "total_landing_count": 1
}
"""

/**
 Gets an example `MissionJSON` struct for previews.

 - returns: `MissionJSON` struct suitable for previewing
 */
func getSampleMission() -> MissionJSON
{
   MissionJSON( parseJSON( jsonString: sampleMissionJSON ) )!
}

private let sampleMissionJSON =
   """
{
  "id": 1087,
  "launch_library_id": 1284,
  "name": "Europa Clipper",
  "description": "Europa Clipper is the first dedicated mission to study Jupiter's moon Europa. Mission is developed by NASA and comprises of an orbiter spacecraft, which, while in orbit around Jupiter, will perform numerous flybys over Europa. Europa Clipper payload suit included high-resolution cameras and spectrometers for imaging Europa's surface and thin atmosphere, an ice-penetrating radar to search for subsurface water, and a magnetometer and gravity measurements to measure the moon's magnetic field and unlock clues about its ocean and deep interior.",
  "launch_designator": null,
  "type": "Planetary Science",
  "orbit": {
    "id": 6,
    "name": "Heliocentric N/A",
    "abbrev": "Helio-N/A"
  }
}
"""

/**
 Gets an example `PadJSON` struct for previews.

 - returns: `PadJSON` struct suitable for previewing
 */
public func getSamplePad() -> PadJSON
{
   PadJSON( parseJSON( jsonString: samplePadJSON ) )!
}

private let samplePadJSON =
   """
{
   "id": 87,
   "url": "https://ll.thespacedevs.com/2.1.0/pad/87/",
   "agency_id": null,
   "name": "Launch Complex 39A",
   "info_url": null,
   "wiki_url": "https://en.wikipedia.org/wiki/Kennedy_Space_Center_Launch_Complex_39#Launch_Pad_39A",
   "map_url": "http://maps.google.com/maps?q=28.608+N,+80.604+W",
   "latitude": "28.60822681",
   "longitude": "-80.60428186",
   "location": {
     "id": 27,
     "url": "https://ll.thespacedevs.com/2.1.0/location/27/",
     "name": "Kennedy Space Center, FL, USA",
     "country_code": "USA",
     "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/location_27_20200803142447.jpg",
     "total_launch_count": 182,
     "total_landing_count": 0
   },
   "map_image": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/launch_images/pad_87_20200803143537.jpg",
   "total_launch_count": 125
}
"""

/**
 Returns a [ProgramJSON] to use in generating UI previews.

 - returns: Fixed program data
 */
public func getSampleProgram() -> ProgramJSON
{
   ProgramJSON( parseJSON( jsonString: sampleProgramJSON ) )!
}

/**
 Returns a second [ProgramJSON] to use in generating UI previews.

 - returns: Fixed program data
 */
public func getSampleProgram2() -> ProgramJSON
{
   ProgramJSON( parseJSON( jsonString: sampleProgramJSON2 ) )!
}

private let sampleProgramJSON =
   """
 {
   "id": 17,
   "url": "https://ll.thespacedevs.com/2.1.0/program/17/",
   "name": "International Space Station",
   "description": "The International Space Station programme is tied together by a complex set of legal, political and financial agreements between the sixteen nations involved in the project, governing ownership of the various components, rights to crewing and utilization, and responsibilities for crew rotation and resupply of the International Space Station. It was conceived in 1984 by President Ronald Reagan, during the Space Station Freedom project as it was originally called.",
   "agencies": [
     {
       "id": 16,
       "url": "https://ll.thespacedevs.com/2.1.0/agencies/16/",
       "name": "Canadian Space Agency",
       "type": "Government"
     },
     {
       "id": 27,
       "url": "https://ll.thespacedevs.com/2.1.0/agencies/27/",
       "name": "European Space Agency",
       "type": "Multinational"
     },
     {
       "id": 37,
       "url": "https://ll.thespacedevs.com/2.1.0/agencies/37/",
       "name": "Japan Aerospace Exploration Agency",
       "type": "Government"
     },
     {
       "id": 44,
       "url": "https://ll.thespacedevs.com/2.1.0/agencies/44/",
       "name": "National Aeronautics and Space Administration",
       "type": "Government"
     },
     {
       "id": 63,
       "url": "https://ll.thespacedevs.com/2.1.0/agencies/63/",
       "name": "Russian Federal Space Agency (ROSCOSMOS)",
       "type": "Government"
     }
   ],
   "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/international2_program_20201129184745.png",
   "start_date": "1998-11-20T06:40:00Z",
   "end_date": null,
   "info_url": "https://www.nasa.gov/mission_pages/station/main/index.html",
   "wiki_url": "https://en.wikipedia.org/wiki/International_Space_Station_programme"
 }
"""

private let sampleProgramJSON2 =
"""
{
      "id": 15,
      "url": "https://ll.thespacedevs.com/2.1.0/program/15/",
      "name": "Artemis",
      "description": "The Artemis program is a US government-funded crewed spaceflight program that has the goal of landing \"the first woman and the next man\" on the Moon, specifically at the lunar south pole region by 2024.",
      "agencies": [
        {
          "id": 44,
          "url": "https://ll.thespacedevs.com/2.1.0/agencies/44/",
          "name": "National Aeronautics and Space Administration",
          "type": "Government"
        }
      ],
      "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/program_images/artemis_program_20200821091844.png",
      "start_date": "2017-12-11T00:00:00Z",
      "end_date": null,
      "info_url": "https://www.nasa.gov/specials/artemis/",
      "wiki_url": "https://en.wikipedia.org/wiki/Artemis_program"
    }
"""

/**
 Gets an example `RocketJSON` struct for previews.

 - returns: `RocketJSON` struct suitable for previewing
 */
public func getSampleRocket() -> RocketJSON
{
   RocketJSON( parseJSON( jsonString: sampleRocketJSON ) )!
}

private let sampleRocketJSON =
   """
{
  "id": 2663,
  "configuration": {
    "id": 143,
    "launch_library_id": 144,
    "url": "https://ll.thespacedevs.com/2.1.0/config/launcher/143/",
    "name": "Space Launch System (SLS)",
    "family": "SLS",
    "full_name": "Space Launch System (SLS)",
    "variant": ""
  }
}
"""

/**
 Gets an example `SpacecraftConfigJSON` struct for previews.

 - returns: `SpacecraftConfigJSON` struct suitable for previewing
 */
public func getSampleSpacecraftConfig() -> SpacecraftConfigJSON
{
   SpacecraftConfigJSON( parseJSON( jsonString: sampleSpacecraftConfigJSON ) )!
}

private let sampleSpacecraftConfigJSON =
   """
 {
   "id": 1,
   "url": "https://ll.thespacedevs.com/2.1.0/config/spacecraft/1/",
   "name": "Soyuz",
   "type": {
     "id": 1,
     "name": "Unknown"
   },
   "agency": {
     "id": 63,
     "url": "https://ll.thespacedevs.com/2.1.0/agencies/63/",
     "name": "Russian Federal Space Agency (ROSCOSMOS)",
     "type": "Government"
   },
   "in_use": true,
   "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/soyuz_image_20201015191152.jpg"
 }
"""

/**
 Gets an example `SpacecraftJSON` struct for previews.

 - returns: `SpacecraftJSON` struct suitable for previewing
 */
public func getSampleSpacecraft() -> SpacecraftJSON
{
   SpacecraftJSON( parseJSON( jsonString: sampleSpacecraftJSON ) )!
}

private let sampleSpacecraftJSON =
"""
{
 "id": 77,
 "url": "https://ll.thespacedevs.com/2.1.0/spacecraft/77/",
 "name": "Soyuz TMA-16",
 "serial_number": "Soyuz TMA 11F732A17 #226",
 "status": {
   "id": 4,
   "name": "Single Use"
 },
 "description": "Soyuz TMA-16 was a Soyuz spacecraft which launched on September 30 2009 07:14 UTC. It transported two members of the Expedition 21 crew and one participant to the International Space Station. The Expedition 21 crew consisted of Maksim Surayev and Jeffrey Williams. The spaceflight participant was tourist Guy Laliberté.",
 "spacecraft_config": {
   "id": 1,
   "url": "https://ll.thespacedevs.com/2.1.0/config/spacecraft/1/",
   "name": "Soyuz",
   "type": {
     "id": 1,
     "name": "Unknown"
   },
   "agency": {
     "id": 63,
     "url": "https://ll.thespacedevs.com/2.1.0/agencies/63/",
     "name": "Russian Federal Space Agency (ROSCOSMOS)",
     "type": "Government"
   },
   "in_use": true,
   "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/orbiter_images/soyuz_image_20201015191152.jpg"
 }
}
"""

/**
 Gets an example `SpaceStationJSON` struct for previews.

 - returns: `SpaceStationJSON` struct suitable for previewing
 */
public func getSampleSpaceStation() -> SpaceStationJSON
{
   SpaceStationJSON( parseJSON( jsonString: sampleSpaceStationJSON ) )!
}

private let sampleSpaceStationJSON =
   """
{
  "id": 4,
  "url": "https://ll.thespacedevs.com/2.1.0/spacestation/4/",
  "name": "International Space Station",
  "status": {
    "id": 1,
    "name": "Active"
  },
  "orbit": "Low Earth Orbit",
  "image_url": "https://spacelaunchnow-prod-east.nyc3.digitaloceanspaces.com/media/spacestation_images/international2520space2520station_image_20190220215716.jpeg"
}
"""
