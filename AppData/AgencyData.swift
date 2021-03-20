// Copyright © 2021 Bradford Holcombe. All rights reserved.

import SwiftUI

// swiftlint:disable line_length

struct AgencyData
{
   static let shared: AgencyData = AgencyData()

   func getWebsite( _ serviceProvider: Agency ) -> String?
   {
      websites[ serviceProvider.id ]
   }

   func getWiki( _ serviceProvider: Agency ) -> String?
   {
      wiki[ serviceProvider.id ]
   }

   func getTwitter( _ serviceProvider: Agency ) -> String?
   {
      twitter[ serviceProvider.id ]
   }

   func getDescription( _ serviceProvider: Agency ) -> String?
   {
      descriptions[ serviceProvider.id ]
   }

   func getYouTube( _ serviceProvider: Agency ) -> String?
   {
      youTube[ serviceProvider.id ]
   }

   func getLogo( _ serviceProvider: Agency ) -> String?
   {
      logos[ serviceProvider.id ]
   }

   func getFlags( _ serviceProvider: Agency ) -> String?
   {
      flags[ serviceProvider.id ]
   }
}

let descriptions: [ Int64: String ] =
   [:
   ]

let youTube: [ Int64: String ] =
   [:
   ]

let websites: [ Int64: String ] =
   [
      //      1: "", // Belarus Space Agency,BLR No website
      //      2: "", // Aeronautics and Space Research and Diffusion Center,URY
      3: "https://www.gob.mx/aem", // Mexican Space Agency,MEX
      4: "https://asal.dz", // Algerian Space Agency,DZA
      //      5: "", // Asia Pacific Multilateral Cooperation in Space Technology and Applications,"CHN,PAK,THA"
      //      6: "", // Asia-Pacific Regional Space Agency Forum,"AUS,BGD,BRN,BTN,CAN,KHM,CHN,FRA,DEU,IND,IDN,JPN,LAO,MYS,MNG,MMR,NPL,NZL,PAK,PHL,RUS,SGP,KOR,LKA,THA,USA,VNM",
      7: "http://www.apsco.int", // Asia-Pacific Space Cooperation Organization,"BGD,CHN,IDN,IRNMNG,PAK,PER,THA,TUR"
      8: "https://www.ffg.at/ffg/alr", // Austrian Space Agency,AUT
      //      9: "", // Azerbaijan National Aerospace Agency,AZE
      10: "http://www.aeronomie.be", // Belgian Institute for Space Aeronomy,BEL
      11: "http://www.abae.gob.ve", // Bolivarian Agency for Space Activities,VEN
      12: "https://www.gov.br/aeb/pt-br", // Brazilian Space Agency,BRA
      13: "https://www.gov.uk/government/organisations/uk-space-agency", // UK Space Agency,GBR
      14: "https://www.abe.bo", // Bolivian Space Agency,BOL
      15: "http://www.space.bas.bg", // Bulgarian Space Agency,BGR
      16: "https://www.asc-csa.gc.ca/eng/Default.asp", // Canadian Space Agency,CAN
      17: "http://www.cnsa.gov.cn", // China National Space Administration,CHN
      18: "http://cce.gov.co", // Colombian Space Commission,COL
      19: "https://crisp.nus.edu.sg", // Centre for Remote Imaging, Sensing and Processing,SGP
      20: "https://www.csiro.au", // Commonwealth Scientific and Industrial Research Organisation,AUS
      21: "https://public.ccsds.org/default.aspx", // Consultative Committee for Space Data Systems,"ITA,GBR,CAN,FRA,CHN,DEU,BRA,JPN,USA,RUS"
      22: "https://cosparhq.cnes.fr", // Committee on Space Research,"ARG,ARM,AUS,AUT,BEL,BGR,BRA,CAN,CHN,TWN,CZE,DNK,EGY,ESP,FIN,FRA,DEU,GRC,HUN,IND,IDN,IRN,ISR,ITA,JPN,MEX,NLD,NGA,NOR,PAK,POL,PRT,ROU,RUS,SVK,ZAF,SWE,CHE,THA,TUR,UKR,GBR,USA",
      23: "https://www.facebook.com/Hrvatska-svemirska-agencija-1558938660984915", // Croatian Space Agency,HRV",
      //      24: "", // Ministry of Transport of the Czech Republic - Space Technologies and Satellite Systems Department,CZE
      25: "https://www.space.dtu.dk/english", // Danish National Space Center,DNK
      26: "https://www.space.dtu.dk/english", // Technical University of Denmark - National Space Institute,DNK, same as 25
      27: "https://www.esa.int", // European Space Agency,"AUT,BEL,CZE,DNK,FIN,FRA,DEU,GRC,IRE,ITA,LUZ,NLD,NOR,POL,PRT,ROU,ESP,SWE,CHE,GBR
      28: "https://www.gistda.or.th/main", // Geo-Informatics and Space Technology Development Agency,THA
      29: "https://www.dlr.de", // German Aerospace Center,DEU
      30: "http://hso.hu", // Hungarian Space Office,HUN
      31: "https://www.isro.gov.in", // Indian Space Research Organization, IND
      32: "https://www.astro.noa.gr", // Institute for Space Applications and Remote Sensing (ISARS), Greece
      33: "http://www.inta.es", // Instituto Nacional de Técnica Aeroespacial (INTA), Spain
      34: "https://www.isa.ir", // Iranian Space Agency", IRN
      35: "https://www.space.gov.il", // Israeli Space Agency,ISR
      36: "https://www.asi.it", // Italian Space Agency,ITA
      37: "https://global.jaxa.jp", // Japan Aerospace Exploration Agency,JPN
      38: "http://kazcosmos.gov.kz", // National Space Agency (KazCosmos),KAZ
      39: "http://kazcosmos.gov.kz", // Kazakh Space Research Institute,KAZ, same as 38
      //      40: "", // Korean Committee of Space Technology,PRK, no site
      41: "https://www.kari.re.kr/eng.do", // Korea Aerospace Research Institute,KOR
      42: "http://space-lt.eu/en/", // Lithuanian Space Association,LTU
      43: "http://www.angkasa.gov.my", // Malaysian National Space Agency,MYS
      44: "https://www.nasa.gov", // National Aeronautics and Space Administration,USA
      45: "http://www.narss.sci.eg", // National Authority for Remote Sensing and Space Sciences,EGY
      46: "https://cnes.fr/en", // National Center of Space Research (CNES),FRA
      47: "https://www.gob.pe/conida", // National Commission for Aerospace Research and Development,PER
      48: "https://www.argentina.gob.ar/ciencia/conae", // National Commission for Space Research,ARG
      49: "https://www.argentina.gob.ar/ciencia/conae", // National Space Activities Commission,ARG, same as 48
      50: "http://www.lapan.go.id", // National Institute of Aeronautics and Space (LAPAN),IDN
      51: "https://rsgis-od.blogspot.com", // National Remote Sensing Center of Mongolia,MNG
      //      52: "", // National Remote Sensing Center of Tunisia,TUN, no site
      //      53: "", // Uzbek State Space Research Agency (UzbekCosmos),UZB
      54: "https://www.nkau.gov.ua/ua/", // National Space Agency of Ukraine,UKR
      55: "https://www.nspo.narl.org.tw", // National Space Organization,TWN
      56: "https://www.nasrda.gov.ng", // National Space Research and Development Agency,NGA
      57: "https://www.sron.nl", // Netherlands Institute for Space Research,NLD
      58: "https://www.romsenter.no", // Norwegian Space Centre,NOR
      59: "http://www.suparco.gov.pk", // Pakistan Space and Upper Atmosphere Research Commission,PAK
      60: "https://ptspace.pt", // FCT Space Office,PRT
      //      61: "", // Romanian Space Agency,ROU
      //      62: "", // Royal Centre for Remote Sensing,MAR
      //      63: "", // Russian Federal Space Agency (ROSCOSMOS),RUS
      //      64: "", // Sri Lanka Space Agency,LKA
      //      65: "", // TUBITAK Space Technologies Research Institute,TUR
      //      66: "", // Soviet Space Program,RUS
      //      67: "", // Space Research and Remote Sensing Organization,BGD
      //      68: "", // Space Research Centre,POL
      //      69: "", // South African National Space Agency,ZAF
      //      70: "", // Space Research Institute of Saudi Arabia,SAU
      //      71: "", // Swiss Space Office,CHE
      //      72: "", // Turkmenistan National Space Agency,TKM
      //      73: "", // United Nations Office for Outer Space Affairs,"ALB,DZA,ARG,AUS,AUT,BEL,BEN,BOL,BRA,BGR,BFA,CMR,CAN,TDC,CHL,CHN,COL,CUB,CZE,ECU,EGY,FRA,HUN,DEU,GRC,IND,IDN,IRN,IRQ,ITA,JPN,KAZ,KEN,LBN,LBY,MYS,MEX,MNG,NLD,NIC,NER,NGA,PAK,PER,PHL,POL,PRT,KOR,ROU,RUS,SAU,SEN,SLE,SVK,ZAF,ESP,SDN,SWE,CHE,SYR,THA,TUR,GBR,USA,UKR,URY,VEN,VNM",
      //      75: "", // United Nations Committee on the Peaceful Uses of Outer Space,"ALB,DZA,ARG,AUS,AUT,BEL,BEN,BOL,BRA,BGR,BFA,CMR,CAN,TDC,CHL,CHN,COL,CUB,CZE,ECU,EGY,FRA,HUN,DEU,GRC,IND,IDN,IRN,IRQ,ITA,JPN,KAZ,KEN,LBN,LBY,MYS,MEX,MNG,NLD,NIC,NER,NGA,PAK,PER,PHL,POL,PRT,KOR,ROU,RUS,SAU,SEN,SLE,SVK,ZAF,ESP,SDN,SWE,CHE,SYR,THA,TUR,GBR,USA,UKR,URY,VEN,VNM",
      //      76: "", // Swedish National Space Board,SWE
      //      77: "", // OHB System,DEU
      //      78: "", // Thales Alenia Space,"FRA,ITA"
      //      79: "", // JSC Information Satellite Systems,RUS
      //      80: "", // Boeing,USA
      //      81: "", // Astrium Satellites,FRA,DEU,ESP,GBR
      //      82: "", // Lockheed Martin,USA
      //      83: "", // Space Systems/Loral,USA
      //      84: "", // Amsat,"USA,CAN,DEU,ITA,JPN,IND,GBR"
      //      85: "", // Astronautic Technology Sdn Bhd,MYS
      //      86: "", // Ball Aerospace & Technologies Corp.,USA
      //      87: "", // British Aerospace,GBR
      //      88: "", // China Aerospace Science and Technology Corporation,CHN
      //      89: "", // Fairchild Space and Electronics Division,USA
      //      90: "", // Fokker Space & Systems,NLD
      //      91: "", // General Electric,USA
      //      92: "", // Hawker Siddeley Dynamics,GBR
      //      93: "", // Hughes Aircraft,USA
      //      94: "", // IHI Corporation,JPN
      //      95: "", // Israel Aerospace Industries,ISR
      //      96: "", // Khrunichev State Research and Production Space Center,RUS
      //      97: "", // NPO Lavochkin,RUS
      //      98: "", // Mitsubishi Heavy Industries,JPN
      //      99: "", // Northrop Grumman Space Technology,USA
      //      100: "", // Orbital Sciences Corporation,USA
      //      101: "", // Philco Ford,USA
      //      102: "", // Rockwell International,USA
      //      103: "", // RKK Energiya,RUS
      //      104: "", // SPAR Aerospace,CAN
      //      105: "", // SpaceDev,USA
      //      106: "", // General Dynamics,USA
      //      107: "", // Surrey Satellite Technology Ltd,GBR
      //      108: "", // Swales Aerospace,USA
      //      109: "", // Turkish Aerospace Industries,TUR
      //      110: "", // TRW,USA
      //      111: "", // Progress State Research and Production Rocket Space Center,RUS
      //      112: "", // Yuzhnoye Design Bureau,"UKR
      113: "https://www.invap.com.ar", // INVAP, ARG
      //      115: "", // Arianespace,FRA
      //      116: "", // EADS Astrium Space Transportation,FRA
      //      117: "", // Eurockot Launch Services,"FRA, RUS"
      118: "https://www.ilslaunch.com", // International Launch Services, USA
      //      119: "", // ISC Kosmotras,RUS
      //      120: "", // SpaceQuest, Ltd.,USA
      //      121: "", // SpaceX,USA
      //      122: "", // Sea Launch,RUS
      //      123: "", // Starsem SA,"FRA, RUS"
      //      124: "", // United Launch Alliance,USA
      //      125: "", // A.M. Makarov Yuzhny Machine-Building Plant, UKR
      //      126: "", // Deep Space Industries,USA
      //      127: "", // Robotics Institute,USA
      //      128: "", // Planetary Resources,USA, no site
      //      129: "", // Tethers Unlimited, Inc.,USA",
      //      130: "", // RUAG Space,CHE",
      //      131: "", // Andrews Space,USA",
      //      132: "", // Kongsberg Defence & Aerospace,NOR",
      //      133: "", // Aerojet,USA",
      //      134: "", // American Rocket Company,USA",
      //      135: "", // Rocketdyne",USA",
      //      136: "", // Ad Astra Rocket Company,USA",
      //      137: "", // Reaction Engines Ltd.,GBR",
      //      138: "", // Snecma,FRA",
      //      139: "", // Armadillo Aerospace,USA",
      //      140: "", // Bigelow Aerospace,USA",
      //      141: "", // Blue Origin,USA",
      //      142: "", // Copenhagen Suborbitals,DNK",
      //      143: "", // PlanetSpace,USA",
      //      144: "", // Scaled Composites,USA",
      //      145: "", // XCOR  Aerospace,USA",
      //      146: "", // Canadian Arrow,CAN",
      //      147: "", // Rocket Lab Ltd,USA",
      //      148: "", // Scorpius Space Launch Company,USA",
      149: "https://www.interorbital.com", // Interorbital Systems
      //      150: "", // Masten Space Systems,USA",
      //      151: "", // Swedish Space Corp,SWE",
      //      152: "", // UP Aerospace,USA",
      //      153: "", // McDonnell Douglas,USA",
      //      154: "", // Production Corporation Polyot,RUS",
      //      156: "", // Alliant Techsystems,USA",
      //      157: "", // Bristol Aerospace Company,CAN",
      //      158: "", // Chrysler,USA",
      //      159: "", // Avio S.p.A,ITA",
      //      160: "", // Royal Australian Air Force,AUS",
      //      161: "", // United States Air Force,USA",
      //      162: "", // People's Liberation Army,CHN",
      //      163: "", // Russian Aerospace Defence Forces,RUS",
      //      165: "", // US Army,USA",
      //      166: "", // US Navy,USA",
      //      167: "", // Space Florida,USA",
      //      175: "", // Ministry of Defence of the Russian Federation,RUS",
      //      177: "", // China Great Wall Industry Corporation,CHN",
      //      178: "", // Airbus Defence and Space,"FRA, GER, GBR, ESP, ITA",
      //      179: "", // Orbital ATK,USA",
      //      181: "", // National Reconnaissance Office,USA",
      //      182: "", // National Space Agency of the Republic of Kazakhstan,KAZ",
      //      183: "", // Unknown,UNK",
      //      184: "", // China Aerospace Science and Industry Corporation,CHN",
      //      186: "", // Polish Space Agency,POL",
      //      187: "", // GK Launch Services JV,RUS",
      //      188: "", // Gilmour Space Technologies,AUS/SIN",
      //      189: "", // China Aerospace Corporation,CHN",
      190: "http://www.antrix.co.in/", // Antrix Corporation Limited,IND",
      //      191: "", // United Space Alliance,USA",
      //      192: "", // Lockheed Space Operations Company,USA",
      //      193: "", // Russian Space Forces,RUS",
      //      194: "", // ExPace,CHN",
      //      195: "", // Sandia National Laboratories,USA",
      //      196: "", // Land Launch,RUS",
      //      197: "", // Lockheed Martin Space Operations",USA",
      //      198: "", // Mohammed bin Rashid Space Centre,UAE",
      //      199: "", // Virgin Orbit,USA",
      //      201: "", // Vector,USA",
      202: "https://www.iridium.com", // Iridium Communications, USA
      //      203: "", // SES,LUX",
      //      204,: "", // Globalstar,USA",
      205: "https://www.inmarsat.com/en/index.html", // Inmarsat
      206: "https://www.intelsat.com", // Intelsat, LUX"
      //      207: "", // Arab Satellite Communications Organization,SAU",
      208: "https://www.telesat.com", // Telesat,CAN
      //      210: "", // National Oceanic and Atmospheric Administration,USA",
      //      211: "", // National Security Agency",USA",
      //      212: "", // Digital Globe,USA",
      //      213: "", // Missile Defense Agency,USA",
      //      214: "", // Spire Global,USA",
      //      224: "", // GeoOptics,US",
      //      225: "", // 1worldspace,USA",
      //      226: "", // PanAmSat,USA",
      //      227: "", // UK Ministry Of Defence,GBR",
      //      228: "", // National Space Development Agency of Japan,JPN",
      //      229: "", // Eutelsat,FRA",
      //      230: "", // Broadcasting Satellite System Corporation,JPN",
      //      231: "", // SKY Perfect JSAT Group,JPN",
      //      232: "", // European Organisation for the Exploitation of Meteorological Satellites,"AUT,BEL,BGR,HRV,CZE,DNK,EST,FIN,FRA,DEU,GRC,HUN,IRL,ISL,ITA,LVA,LTU,LUX,NLD,NOR,POL,PRT,ROU,SVK,SVN,ESP,SWE,CHE,TUR,GBR",
      //      233: "", // Direction générale de l'armement,FRA",
      //      234: "", // XTAR LLC",USA",
      //      235: "", // Thaicom,THA",
      //      236: "", // DirecTV,USA",
      //      237: "", // PT Telkom,IDN",
      //      238: "", // Hisdesat,ESP",
      //      239: "", // Satmex,MEX",
      //      240: "", // Optus,AUS",
      //      241: "", // WildBlue,USA",
      //      242: "", // Paradigm Secure Communications,GBR",
      //      243: "", // Hughes,USA",
      //      244: "", // Star One,BRA",
      //      245: "", // Regional African Satellite Communication Organization,MUS",
      //      246: "", // Vietnam Posts and Telecommunications Group,VNM",
      //      247: "", // Türksat,TUR",
      //      248: "", // ProtoStar,BMU",
      //      249: "", // Echostar,USA",
      //      250: "", // HispaSat,ESP",
      //      251: "", // AlYahSat,ARE",
      //      252: "", // MEASAT Satellite Systems",,"MYS",
      //      253: "", // French Armed Forces,FRA",
      //      254: "", // British Satellite Broadcasting,GBR",
      //      255: "", // Avanti Communications,GBR",
      //      256: "", // Mexican Satellite System,MEX",
      //      257: "", // Northrop Grumman Innovation Systems,USA",
      //      259: "", // LandSpace,CHN",
      //      260: "", // Planet Labs,USA",
      //      261: "", // Korean Astronaut Program,KOR",
      //      263: "", // OneSpace,CHN",
      //      265: "", // Firefly Aerospace,USA",
      //      266: "", // Relativity Space,USA",
      //      270: "", // Strategic Missile Troops,RUS",
      //      271: "", // Army Ballistic Missile Agency,USA",
      //      272: "", // Chinarocket Co., Ltd.,CHN",
      //      274: "", // iSpace,CHN",
      282: "https://www.aevumspace.com", // Aevum
      //      285: "", // Astra Space,USA",
      //      999: "", // North American Aviation
      //      1000: "", // Energia,RUS",
      //      1001: "", // EXOS Aerospace,USA",
      1002: "http://www.istellartech.com/english", // Interstellar Technologies
      //      1003: "", // Aérospatiale,FRA",
      //      1004: "", // Convair,USA",
      //      1005: "", // Royal Aircraft Establishment,GBR",
      //      1006: "", // Vought,USA",
      //      1007: "", // Space Services Inc.,USA",
      //      1008: "", // Société d'étude et de réalisation d'engins balistiques,FRA",
      1009: "https://www.isas.jaxa.jp/en/index.html", // Institute of Space and Astronautical Science, JPN
      //      1010: "", // KB Mashinostroyeniya",RUS",
      //      1011: "", // "Moscow Institute of Thermal Technology,RUS",
      //      1012: "", // Department of Aerospace Science and Technology,BRA",
      //      1013: "", // Makeyev Rocket Design Bureau,RUS",
      //      1014: "", // Martin Marietta,USA",
      //      1015: "", // European Launcher Development Organisation,EUR",
      //      1016: "", // Weapons Research Establishment,AUS",
      //      1017: "", // Science and Engineering Research Council,GBR",
      //      1018: "", // National Research Council,ITA",
      //      1019: "", // European Space Research Organisation,EUR",
      //      1020: "", // Sierra Nevada Corporation,USA",
      //      1021: "", // Galactic Energy,CHN",
      1022: "https://www.axiomspace.com" // Axiom Space,USA",
   ]

let wiki: [ Int64: String ] =
   [
      1: "https://en.wikipedia.org/wiki/Belarus_Space_Agency", // Belarus Space Agency,BLR
      //      2: "", // Aeronautics and Space Research and Diffusion Center,URY
      3: "https://en.wikipedia.org/wiki/Agencia_Espacial_Mexicana", // Mexican Space Agency,MEX
      4: "https://en.wikipedia.org/wiki/Algerian_Space_Agency", // Algerian Space Agency,DZA
      //      5: "", // Asia Pacific Multilateral Cooperation in Space Technology and Applications,"CHN,PAK,THA"
      //      6: "", // Asia-Pacific Regional Space Agency Forum,"AUS,BGD,BRN,BTN,CAN,KHM,CHN,FRA,DEU,IND,IDN,JPN,LAO,MYS,MNG,MMR,NPL,NZL,PAK,PHL,RUS,SGP,KOR,LKA,THA,USA,VNM
      7: "https://en.wikipedia.org/wiki/Asia-Pacific_Space_Cooperation_Organization", // Asia-Pacific Space Cooperation Organization,"BGD,CHN,IDN,IRNMNG,PAK,PER,THA,TUR
      8: "https://en.wikipedia.org/wiki/Austrian_Space_Agency", // Austrian Space Agency,AUT
      9: "https://en.wikipedia.org/wiki/Azerbaijan_National_Aerospace_Agency", // Azerbaijan National Aerospace Agency,AZE
      10: "https://en.wikipedia.org/wiki/Belgian_Institute_for_Space_Aeronomy", // Belgian Institute for Space Aeronomy,BEL
      //      11: "", // Bolivarian Agency for Space Activities,VEN
      12: "https://en.wikipedia.org/wiki/Brazilian_Space_Agency", // Brazilian Space Agency,BRA
      13: "https://en.wikipedia.org/wiki/UK_Space_Agency", // UK Space Agency,GBR
      14: "https://en.wikipedia.org/wiki/Bolivian_Space_Agency", // Bolivian Space Agency,BOL
      15: "https://en.wikipedia.org/wiki/Space_Research_and_Technology_Institute", // Bulgarian Space Agency,BGR
      16: "https://en.wikipedia.org/wiki/Canadian_Space_Agency", // Canadian Space Agency,CAN
      17: "https://en.wikipedia.org/wiki/China_National_Space_Administration", // China National Space Administration,CHN
      //      18: "", // Colombian Space Commission,COL",
      //      19: "", // Centre for Remote Imaging, Sensing and Processing,SGP No wiki
      20: "https://en.wikipedia.org/wiki/CSIRO", // Commonwealth Scientific and Industrial Research Organisation,AUS
      21: "https://en.wikipedia.org/wiki/Consultative_Committee_for_Space_Data_Systems", // Consultative Committee for Space Data Systems,"ITA,GBR,CAN,FRA,CHN,DEU,BRA,JPN,USA,RUS"
      22: "https://en.wikipedia.org/wiki/Committee_on_Space_Research", // Committee on Space Research,"ARG,ARM,AUS,AUT,BEL,BGR,BRA,CAN,CHN,TWN,CZE,DNK,EGY,ESP,FIN,FRA,DEU,GRC,HUN,IND,IDN,IRN,ISR,ITA,JPN,MEX,NLD,NGA,NOR,PAK,POL,PRT,ROU,RUS,SVK,ZAF,SWE,CHE,THA,TUR,UKR,GBR,USA",
      //      23: "", // Croatian Space Agency,HRV no wiki
      //      24: "", // "Ministry of Transport of the Czech Republic - Space Technologies and Satellite Systems Department,CZE
      25: "https://en.wikipedia.org/wiki/DTU_Space", // Danish National Space Center,DNK
      26: "https://en.wikipedia.org/wiki/DTU_Space", // Technical University of Denmark - National Space Institute,DNK, same as 25
      27: "https://en.wikipedia.org/wiki/European_Space_Agency", // European Space Agency,"AUT,BEL,CZE,DNK,FIN,FRA,DEU,GRC,IRE,ITA,LUZ,NLD,NOR,POL,PRT,ROU,ESP,SWE,CHE,GBR"
      28: "https://en.wikipedia.org/wiki/Geo-Informatics_and_Space_Technology_Development_Agency", // Geo-Informatics and Space Technology Development Agency,THA
      29: "https://en.wikipedia.org/wiki/German_Aerospace_Center", // German Aerospace Center,DEU
      30: "https://en.wikipedia.org/wiki/Hungarian_Space_Office", // Hungarian Space Office,HUN
      31: "https://en.wikipedia.org/wiki/Indian_Space_Research_Organisation", // Indian Space Research Organization, IND
      32: "https://en.wikipedia.org/wiki/Institute_for_Space_Applications_and_Remote_Sensing", // Institute for Space Applications and Remote Sensing (ISARS), Greece
      33: "https://en.wikipedia.org/wiki/Instituto_Nacional_de_Técnica_Aeroespacial", // Instituto Nacional de Técnica Aeroespacial (INTA), Spain
      34: "https://en.wikipedia.org/wiki/Iranian_Space_Agency", // Iranian Space Agency", IRN
      35: "https://en.wikipedia.org/wiki/Israel_Space_Agency", // Israeli Space Agency,ISR
      36: "https://en.wikipedia.org/wiki/Italian_Space_Agency", // Italian Space Agency,ITA
      37: "https://en.wikipedia.org/wiki/JAXA", // Japan Aerospace Exploration Agency,JPN
      38: "https://en.wikipedia.org/wiki/KazCosmos", // National Space Agency (KazCosmos),KAZ
      39: "https://en.wikipedia.org/wiki/KazCosmos", // Kazakh Space Research Institute,KAZ, same as 38
      40: "https://en.wikipedia.org/wiki/Korean_Committee_of_Space_Technology", // Korean Committee of Space Technology,PRK
      41: "https://en.wikipedia.org/wiki/Korea_Aerospace_Research_Institute", // Korea Aerospace Research Institute,KOR
      42: "https://en.wikipedia.org/wiki/Lithuanian_Space_Association", // Lithuanian Space Association,LTU
      43: "https://en.wikipedia.org/wiki/National_Space_Agency_(Malaysia)", // Malaysian National Space Agency,MYS
      44: "https://en.wikipedia.org/wiki/NASA", // National Aeronautics and Space Administration,USA
      45: "https://en.wikipedia.org/wiki/National_Authority_for_Remote_Sensing_and_Space_Sciences", // National Authority for Remote Sensing and Space Sciences,EGY
      46: "https://en.wikipedia.org/wiki/CNES", // National Center of Space Research (CNES),FRA
      47: "https://en.wikipedia.org/wiki/National_Commission_for_Aerospace_Research_and_Development", // National Commission for Aerospace Research and Development,PER
      48: "https://en.wikipedia.org/wiki/Comisión_Nacional_de_Actividades_Espaciales", // National Commission for Space Research (CONAE),ARG
      49: "https://en.wikipedia.org/wiki/Comisión_Nacional_de_Actividades_Espaciales", // National Space Activities Commission,ARG, same as 48
      50: "https://en.wikipedia.org/wiki/National_Institute_of_Aeronautics_and_Space", // National Institute of Aeronautics and Space (LAPAN),IDN
      //      51: "", // National Remote Sensing Center of Mongolia,MNG, no wiki
      //      52: "", // National Remote Sensing Center of Tunisia,TUN
      //      53: "", // Uzbek State Space Research Agency (UzbekCosmos),UZB
      54: "https://en.wikipedia.org/wiki/State_Space_Agency_of_Ukraine", // National Space Agency of Ukraine,UKR
      55: "https://en.wikipedia.org/wiki/National_Space_Organization", // National Space Organization,TWN
      56: "https://en.wikipedia.org/wiki/National_Space_Research_and_Development_Agency", // National Space Research and Development Agency,NGA",
      57: "https://en.wikipedia.org/wiki/Netherlands_Institute_for_Space_Research", // Netherlands Institute for Space Research,NLD",
      58: "https://en.wikipedia.org/wiki/Norwegian_Space_Agency", // Norwegian Space Centre,NOR",
      59: "https://en.wikipedia.org/wiki/Space_%26_Upper_Atmosphere_Research_Commission", // Pakistan Space and Upper Atmosphere Research Commission,PAK",
      //      60: "", // FCT Space Office,PRT", no wiki
      //      61: "", // Romanian Space Agency,ROU",
      //      62: "", // Royal Centre for Remote Sensing,MAR",
      //      63: "", // Russian Federal Space Agency (ROSCOSMOS),RUS",
      //      64: "", // Sri Lanka Space Agency,LKA",
      //      65: "", // TUBITAK Space Technologies Research Institute,TUR",
      //      66: "", // Soviet Space Program,RUS",
      //      67: "", // Space Research and Remote Sensing Organization,BGD",
      //      68: "", // Space Research Centre,POL",
      //      69: "", // South African National Space Agency,ZAF",
      //      70: "", // Space Research Institute of Saudi Arabia,SAU",
      //      71: "", // Swiss Space Office,CHE",
      //      72: "", // Turkmenistan National Space Agency,TKM",
      //      73: "", // United Nations Office for Outer Space Affairs,"ALB,DZA,ARG,AUS,AUT,BEL,BEN,BOL,BRA,BGR,BFA,CMR,CAN,TDC,CHL,CHN,COL,CUB,CZE,ECU,EGY,FRA,HUN,DEU,GRC,IND,IDN,IRN,IRQ,ITA,JPN,KAZ,KEN,LBN,LBY,MYS,MEX,MNG,NLD,NIC,NER,NGA,PAK,PER,PHL,POL,PRT,KOR,ROU,RUS,SAU,SEN,SLE,SVK,ZAF,ESP,SDN,SWE,CHE,SYR,THA,TUR,GBR,USA,UKR,URY,VEN,VNM",
      //      75: "", // United Nations Committee on the Peaceful Uses of Outer Space,"ALB,DZA,ARG,AUS,AUT,BEL,BEN,BOL,BRA,BGR,BFA,CMR,CAN,TDC,CHL,CHN,COL,CUB,CZE,ECU,EGY,FRA,HUN,DEU,GRC,IND,IDN,IRN,IRQ,ITA,JPN,KAZ,KEN,LBN,LBY,MYS,MEX,MNG,NLD,NIC,NER,NGA,PAK,PER,PHL,POL,PRT,KOR,ROU,RUS,SAU,SEN,SLE,SVK,ZAF,ESP,SDN,SWE,CHE,SYR,THA,TUR,GBR,USA,UKR,URY,VEN,VNM",
      //      76: "", // Swedish National Space Board,SWE",
      //      77: "", // OHB System",DEU",
      //      78: "", // Thales Alenia Space,"FRA,ITA",
      //      79: "", // JSC Information Satellite Systems,RUS",
      //      80: "", // Boeing,USA",
      //      81: "", // Astrium Satellites,FRA,DEU,ESP,GBR",
      //      82: "", // Lockheed Martin,USA",
      //      83: "", // Space Systems/Loral,USA",
      //      84: "", // Amsat,"USA,CAN,DEU,ITA,JPN,IND,GBR",
      //      85: "", // Astronautic Technology Sdn Bhd,MYS",
      //      86: "", // Ball Aerospace & Technologies Corp.,USA",
      //      87: "", // British Aerospace,GBR",
      //      88: "", // China Aerospace Science and Technology Corporation,CHN",
      //      89: "", // Fairchild Space and Electronics Division,USA",
      //      90: "", // Fokker Space & Systems,NLD",
      //      91: "", // General Electric,USA",
      //      92: "", // Hawker Siddeley Dynamics,GBR",
      //      93: "", // Hughes Aircraft,USA",
      //      94: "", // IHI Corporation,JPN",
      //      95: "", // Israel Aerospace Industries,ISR",
      //      96: "", // Khrunichev State Research and Production Space Center,RUS",
      //      97: "", // NPO Lavochkin,RUS",
      //      98: "", // Mitsubishi Heavy Industries,JPN",
      //      99: "", // Northrop Grumman Space Technology,USA",
      //      100: "", // Orbital Sciences Corporation,USA",
      //      101: "", // Philco Ford,USA",
      //      102: "", // Rockwell International,USA",
      //      103: "", // RKK Energiya,RUS",
      //      104: "", // SPAR Aerospace,CAN",
      //      105: "", // SpaceDev,USA",
      //      106: "", // General Dynamics,USA",
      //      107: "", // Surrey Satellite Technology Ltd,GBR",
      //      108: "", // Swales Aerospace,USA",
      //      109: "", // Turkish Aerospace Industries,TUR",
      //      110: "", // TRW,USA",
      //      111: "", // Progress State Research and Production Rocket Space Center,RUS",
      //      112: "", // Yuzhnoye Design Bureau,"UKR",
      113: "https://en.wikipedia.org/wiki/INVAP", // INVAP, ARG
      //      115: "", // Arianespace",FRA",
      //      116: "", // EADS Astrium Space Transportation,FRA",
      //      117: "", // Eurockot Launch Services,"FRA, RUS",
      118: "https://en.wikipedia.org/wiki/International_Launch_Services", // International Launch Services, USA
      //      119: "", // ISC Kosmotras,RUS",
      //      120: "", // SpaceQuest, Ltd.,USA",
      //      121: "", // SpaceX,USA",
      //      122: "", // Sea Launch,RUS",
      //      123: "", // Starsem SA,"FRA, RUS",
      //      124: "", // United Launch Alliance,"USA",
      //      125: "", // A.M. Makarov Yuzhny Machine-Building Plant, UKR",
      //      126: "", // Deep Space Industries,USA",
      //      127: "", // Robotics Institute,USA",
      128: "https://en.wikipedia.org/wiki/Planetary_Resources", // Planetary Resources,USA
      //      129: "", // Tethers Unlimited, Inc.,USA",
      //      130: "", // RUAG Space,CHE",
      //      131: "", // Andrews Space,USA",
      //      132: "", // Kongsberg Defence & Aerospace,NOR",
      //      133: "", // Aerojet,USA",
      //      134: "", // American Rocket Company,USA",
      //      135: "", // Rocketdyne",USA",
      //      136: "", // Ad Astra Rocket Company,USA",
      //      137: "", // Reaction Engines Ltd.,GBR",
      //      138: "", // Snecma,FRA",
      //      139: "", // Armadillo Aerospace,USA",
      //      140: "", // Bigelow Aerospace,USA",
      //      141: "", // Blue Origin,USA",
      //      142: "", // Copenhagen Suborbitals,DNK",
      //      143: "", // PlanetSpace,USA",
      //      144: "", // Scaled Composites,USA",
      //      145: "", // XCOR  Aerospace,USA",
      //      146: "", // Canadian Arrow,CAN",
      //      147: "", // Rocket Lab Ltd,USA",
      //      148: "", // Scorpius Space Launch Company,USA",
      149: "https://en.wikipedia.org/wiki/Interorbital_Systems", // Interorbital Systems
      //      150: "", // Masten Space Systems,USA",
      //      151: "", // Swedish Space Corp,SWE",
      //      152: "", // UP Aerospace,USA",
      //      153: "", // McDonnell Douglas,USA",
      //      154: "", // Production Corporation Polyot,RUS",
      //      156: "", // Alliant Techsystems,USA",
      //      157: "", // Bristol Aerospace Company,CAN",
      //      158: "", // Chrysler,USA",
      //      159: "", // Avio S.p.A,ITA",
      //      160: "", // Royal Australian Air Force,AUS",
      //      161: "", // United States Air Force,USA",
      //      162: "", // People's Liberation Army,CHN",
      //      163: "", // Russian Aerospace Defence Forces,RUS",
      //      165: "", // US Army,USA",
      //      166: "", // US Navy,USA",
      //      167: "", // Space Florida,USA",
      //      175: "", // Ministry of Defence of the Russian Federation,RUS",
      //      177: "", // China Great Wall Industry Corporation,CHN",
      //      178: "", // Airbus Defence and Space,"FRA, GER, GBR, ESP, ITA",
      //      179: "", // Orbital ATK,USA",
      //      181: "", // National Reconnaissance Office,USA",
      //      182: "", // National Space Agency of the Republic of Kazakhstan,KAZ",
      //      183: "", // Unknown,UNK",
      //      184: "", // China Aerospace Science and Industry Corporation,CHN",
      //      186: "", // Polish Space Agency,POL",
      //      187: "", // GK Launch Services JV,RUS",
      //      188: "", // Gilmour Space Technologies,AUS/SIN",
      //      189: "", // China Aerospace Corporation,CHN",
      190: "https://en.wikipedia.org/wiki/Antrix_Corporation", // Antrix Corporation Limited,IND",
      //      191: "", // United Space Alliance,USA",
      //      192: "", // Lockheed Space Operations Company,USA",
      //      193: "", // Russian Space Forces,RUS",
      //      194: "", // ExPace,CHN",
      //      195: "", // Sandia National Laboratories,USA",
      //      196: "", // Land Launch,RUS",
      //      197: "", // Lockheed Martin Space Operations",USA",
      //      198: "", // Mohammed bin Rashid Space Centre,UAE",
      //      199: "", // Virgin Orbit,USA",
      //      201: "", // Vector,USA",
      202: "https://en.wikipedia.org/wiki/Iridium_Communications", // Iridium Communications, USA
      //      203: "", // SES,LUX",
      //      204,: "", // Globalstar,USA",
      205: "https://en.wikipedia.org/wiki/Inmarsat", // I/Users/brad/Dev/LaunchList/LaunchList/CoreData/Extensions/Expedition+Extensions.swiftnmarsat
      206: "https://en.wikipedia.org/wiki/Intelsat", // Intelsat, LUX"
      //      207: "", // Arab Satellite Communications Organization,SAU",
      //      208: "", // Telesat,CA",
      //      210: "", // National Oceanic and Atmospheric Administration,USA",
      //      211: "", // National Security Agency",USA",
      //      212: "", // Digital Globe,USA",
      //      213: "", // Missile Defense Agency,USA",
      //      214: "", // Spire Global,USA",
      //      224: "", // GeoOptics,US",
      //      225: "", // 1worldspace,USA",
      //      226: "", // PanAmSat,USA",
      //      227: "", // UK Ministry Of Defence,GBR",
      //      228: "", // National Space Development Agency of Japan,JPN",
      //      229: "", // Eutelsat,FRA",
      //      230: "", // Broadcasting Satellite System Corporation,JPN",
      //      231: "", // SKY Perfect JSAT Group,JPN",
      //      232: "", // European Organisation for the Exploitation of Meteorological Satellites,"AUT,BEL,BGR,HRV,CZE,DNK,EST,FIN,FRA,DEU,GRC,HUN,IRL,ISL,ITA,LVA,LTU,LUX,NLD,NOR,POL,PRT,ROU,SVK,SVN,ESP,SWE,CHE,TUR,GBR",
      //      233: "", // Direction générale de l'armement,FRA",
      //      234: "", // XTAR LLC",USA",
      //      235: "", // Thaicom,THA",
      //      236: "", // DirecTV,USA",
      //      237: "", // PT Telkom,IDN",
      //      238: "", // Hisdesat,ESP",
      //      239: "", // Satmex,MEX",
      //      240: "", // Optus,AUS",
      //      241: "", // WildBlue,USA",
      //      242: "", // Paradigm Secure Communications,GBR",
      //      243: "", // Hughes,USA",
      //      244: "", // Star One,BRA",
      //      245: "", // Regional African Satellite Communication Organization,MUS",
      //      246: "", // Vietnam Posts and Telecommunications Group,VNM",
      //      247: "", // Türksat,TUR",
      //      248: "", // ProtoStar,BMU",
      //      249: "", // Echostar,USA",
      //      250: "", // HispaSat,ESP",
      //      251: "", // AlYahSat,ARE",
      //      252: "", // MEASAT Satellite Systems",,"MYS",
      //      253: "", // French Armed Forces,FRA",
      //      254: "", // British Satellite Broadcasting,GBR",
      //      255: "", // Avanti Communications,GBR",
      //      256: "", // Mexican Satellite System,MEX",
      //      257: "", // Northrop Grumman Innovation Systems,USA",
      //      259: "", // LandSpace,CHN",
      //      260: "", // Planet Labs,USA",
      //      261: "", // Korean Astronaut Program,KOR",
      //      263: "", // OneSpace,CHN",
      //      265: "", // Firefly Aerospace,USA",
      //      266: "", // Relativity Space,USA",
      //      270: "", // Strategic Missile Troops,RUS",
      //      271: "", // Army Ballistic Missile Agency,USA",
      //      272: "", // Chinarocket Co., Ltd.,CHN",
      //      274: "", // iSpace,CHN",
      // 282:  nil, // Aevum, doesn't have a Wikipedia page
      //      285: "", // Astra Space,USA",
      //      999: "", // North American Aviation
      //      1000: "", // Energia,RUS",
      //      1001: "", // EXOS Aerospace,USA",
      1002: "https://en.wikipedia.org/wiki/Interstellar_Technologies", // Interstellar Technologies
      //      1003: "", // Aérospatiale,FRA",
      //      1004: "", // Convair,USA",
      //      1005: "", // Royal Aircraft Establishment,GBR",
      //      1006: "", // Vought,USA",
      //      1007: "", // Space Services Inc.,USA",
      //      1008: "", // Société d'étude et de réalisation d'engins balistiques,FRA",
      1009: "https://en.wikipedia.org/wiki/Institute_of_Space_and_Astronautical_Science", // Institute of Space and Astronautical Science, JPN
      //      1010: "", // KB Mashinostroyeniya",RUS",
      //      1011: "", // "Moscow Institute of Thermal Technology,RUS",
      //      1012: "", // Department of Aerospace Science and Technology,BRA",
      //      1013: "", // Makeyev Rocket Design Bureau,RUS",
      //      1014: "", // Martin Marietta,USA",
      //      1015: "", // European Launcher Development Organisation,EUR",
      //      1016: "", // Weapons Research Establishment,AUS",
      //      1017: "", // Science and Engineering Research Council,GBR",
      //      1018: "", // National Research Council,ITA",
      //      1019: "", // European Space Research Organisation,EUR",
      //      1020: "", // Sierra Nevada Corporation,USA",
      //      1021: "", // Galactic Energy,CHN",
      1022: "https://en.wikipedia.org/wiki/Axiom_Space" // Axiom Space,USA",
   ]

let twitter: [ Int64: String ] =
   [
//      1: "", // Belarus Space Agency,BLR No twitter
//      2: "", // Aeronautics and Space Research and Diffusion Center,URY No twitter
      3: "https://twitter.com/aem_mx", // Mexican Space Agency,MEX
//      4: "", // Algerian Space Agency,DZA No twitter
//      5: "", // Asia Pacific Multilateral Cooperation in Space Technology and Applications,"CHN,PAK,THA", Now APSCO
//      6: "", // Asia-Pacific Regional Space Agency Forum,"AUS,BGD,BRN,BTN,CAN,KHM,CHN,FRA,DEU,IND,IDN,JPN,LAO,MYS,MNG,MMR,NPL,NZL,PAK,PHL,RUS,SGP,KOR,LKA,THA,USA,VNM" No twitter
//      7: "", // Asia-Pacific Space Cooperation Organization,"BGD,CHN,IDN,IRNMNG,PAK,PER,THA,TUR" No twitter
//      8: "", // Austrian Space Agency,AUT No twitter
//      9: "", // Azerbaijan National Aerospace Agency,AZE No twitter
      10: "https://twitter.com/bira_iasb", // Belgian Institute for Space Aeronomy,BEL
      11: "https://twitter.com/abae_ve", // Bolivarian Agency for Space Activities,VEN
      12: "https://twitter.com/espacial_aeb", // Brazilian Space Agency,BRA
      13: "https://twitter.com/spacegovuk", // UK Space Agency,GBR
      14: "https://twitter.com/abebolivia", // Bolivian Space Agency,BOL
//      15: "", // Bulgarian Space Agency,BGR No twitter
      16: "https://twitter.com/csa_asc", // Canadian Space Agency,CAN
//      17: "", // China National Space Administration,CHN No twitter
//      18: "", // Colombian Space Commission,COL No twitter
//      19: "", // Centre for Remote Imaging, Sensing and Processing,SGP No twitter
      20: "https://twitter.com/CSIRO", // Commonwealth Scientific and Industrial Research Organisation,AUS
//      21: "", // Consultative Committee for Space Data Systems,"ITA,GBR,CAN,FRA,CHN,DEU,BRA,JPN,USA,RUS No twitter
//      22: "", // Committee on Space Research,"ARG,ARM,AUS,AUT,BEL,BGR,BRA,CAN,CHN,TWN,CZE,DNK,EGY,ESP,FIN,FRA,DEU,GRC,HUN,IND,IDN,IRN,ISR,ITA,JPN,MEX,NLD,NGA,NOR,PAK,POL,PRT,ROU,RUS,SVK,ZAF,SWE,CHE,THA,TUR,UKR,GBR,USA",
//      23: "", // Croatian Space Agency,HRV
//      24: "", // Ministry of Transport of the Czech Republic - Space Technologies and Satellite Systems Department,CZE
//      25: "", // Danish National Space Center,DNK
//      26: "", // Technical University of Denmark - National Space Institute,DNK
      27: "https://twitter.com/esa", // European Space Agency,"AUT,BEL,CZE,DNK,FIN,FRA,DEU,GRC,IRE,ITA,LUZ,NLD,NOR,POL,PRT,ROU,ESP,SWE,CHE,GBR"
      28: "https://twitter.com/gistda", // Geo-Informatics and Space Technology Development Agency,THA
      29: "https://twitter.com/dlr_de", // German Aerospace Center,DEU
//      30: "", // Hungarian Space Office,HUN, no twitter
      31: "https://twitter.com/isro", // Indian Space Research Organization, IND
      // 32:   nil, // Institute for Space Applications and Remote Sensing (ISARS), Greece
      33: "https://twitter.com/intaespana", // Instituto Nacional de Técnica Aeroespacial (INTA), Spain
      // 34:   nil // Iranian Space Agency", IRN
      35: "https://twitter.com/ilspaceagency", // Israeli Space Agency,ISR
      36: "https://twitter.com/asi_spazio", // Italian Space Agency,ITA
      37: "https://twitter.com/JAXA_en", // Japan Aerospace Exploration Agency,JPN
//      38: "", // National Space Agency (KazCosmos),KAZ, no twitter
//      39: "", // Kazakh Space Research Institute,KAZ, no twitter, same as 38
//      40: "", // Korean Committee of Space Technology,PRK, no twitter
      41: "https://twitter.com/kari2030", // Korea Aerospace Research Institute,KOR
//      42: "", // Lithuanian Space Association,LTU, no twitter
//      43: "", // Malaysian National Space Agency,MYS, no twitter
      44: "https://twitter.com/NASA", // National Aeronautics and Space Administration,USA
//      45: "", // National Authority for Remote Sensing and Space Sciences,EGY, no twitter
//      46: "", // National Center of Space Research (CNES),FRA, no twitter
//      47: "", // National Commission for Aerospace Research and Development,PER, no twitter
//      48: "", // National Commission for Space Research (CONAE),ARG, no twitter
//      49: "", // National Space Activities Commission,ARG, same as 48
      50: "https://twitter.com/lapan_ri", // National Institute of Aeronautics and Space (LAPAN),IDN
//      51: "", // National Remote Sensing Center of Mongolia,MNG, no twitter
//      52: "", // National Remote Sensing Center of Tunisia,TUN
//      53: "", // Uzbek State Space Research Agency (UzbekCosmos),UZB
//      54: "", // National Space Agency of Ukraine,UKR
      55: "NSPO", // National Space Organization,TWN",
//      56: "", // National Space Research and Development Agency,NGA",
      57: "https://twitter.com/sron_space", // Netherlands Institute for Space Research (SRON),NLD",
      58: "https://twitter.com/romsenteret", // Norwegian Space Centre,NOR",
//      59: "", // Pakistan Space and Upper Atmosphere Research Commission,PAK", no twitter
      60: "https://twitter.com/portugalspace", // FCT Space Office,PRT",
//      61: "", // Romanian Space Agency,ROU",
//      62: "", // Royal Centre for Remote Sensing,MAR",
//      63: "", // Russian Federal Space Agency (ROSCOSMOS),RUS",
//      64: "", // Sri Lanka Space Agency,LKA",
//      65: "", // TUBITAK Space Technologies Research Institute,TUR",
//      66: "", // Soviet Space Program,RUS",
//      67: "", // Space Research and Remote Sensing Organization,BGD",
//      68: "", // Space Research Centre,POL",
//      69: "", // South African National Space Agency,ZAF",
//      70: "", // Space Research Institute of Saudi Arabia,SAU",
//      71: "", // Swiss Space Office,CHE",
//      72: "", // Turkmenistan National Space Agency,TKM",
//      73: "", // United Nations Office for Outer Space Affairs,"ALB,DZA,ARG,AUS,AUT,BEL,BEN,BOL,BRA,BGR,BFA,CMR,CAN,TDC,CHL,CHN,COL,CUB,CZE,ECU,EGY,FRA,HUN,DEU,GRC,IND,IDN,IRN,IRQ,ITA,JPN,KAZ,KEN,LBN,LBY,MYS,MEX,MNG,NLD,NIC,NER,NGA,PAK,PER,PHL,POL,PRT,KOR,ROU,RUS,SAU,SEN,SLE,SVK,ZAF,ESP,SDN,SWE,CHE,SYR,THA,TUR,GBR,USA,UKR,URY,VEN,VNM",
//      75: "", // United Nations Committee on the Peaceful Uses of Outer Space,"ALB,DZA,ARG,AUS,AUT,BEL,BEN,BOL,BRA,BGR,BFA,CMR,CAN,TDC,CHL,CHN,COL,CUB,CZE,ECU,EGY,FRA,HUN,DEU,GRC,IND,IDN,IRN,IRQ,ITA,JPN,KAZ,KEN,LBN,LBY,MYS,MEX,MNG,NLD,NIC,NER,NGA,PAK,PER,PHL,POL,PRT,KOR,ROU,RUS,SAU,SEN,SLE,SVK,ZAF,ESP,SDN,SWE,CHE,SYR,THA,TUR,GBR,USA,UKR,URY,VEN,VNM",
//      76: "", // Swedish National Space Board,SWE
//      77: "", // OHB System,DEU
//      78: "", // Thales Alenia Space,"FRA,ITA"
//      79: "", // JSC Information Satellite Systems,RUS
//      80: "", // Boeing,USA
//      81: "", // Astrium Satellites,FRA,DEU,ESP,GBR
//      82: "", // Lockheed Martin,USA
//      83: "", // Space Systems/Loral,USA
//      84: "", // Amsat,"USA,CAN,DEU,ITA,JPN,IND,GBR"
//      85: "", // Astronautic Technology Sdn Bhd,MYS
//      86: "", // Ball Aerospace & Technologies Corp.,USA
//      87: "", // British Aerospace,GBR
//      88: "", // China Aerospace Science and Technology Corporation,CHN
//      89: "", // Fairchild Space and Electronics Division,USA
//      90: "", // Fokker Space & Systems,NLD
//      91: "", // General Electric,USA
//      92: "", // Hawker Siddeley Dynamics,GBR
//      93: "", // Hughes Aircraft,USA
//      94: "", // IHI Corporation,JPN
//      95: "", // Israel Aerospace Industries,ISR
//      96: "", // Khrunichev State Research and Production Space Center,RUS
//      97: "", // NPO Lavochkin,RUS
//      98: "", // Mitsubishi Heavy Industries,JPN
//      99: "", // Northrop Grumman Space Technology,USA
//      100: "", // Orbital Sciences Corporation,USA
//      101: "", // Philco Ford,USA
//      102: "", // Rockwell International,USA
//      103: "", // RKK Energiya,RUS
//      104: "", // SPAR Aerospace,CAN
//      105: "", // SpaceDev,USA
//      106: "", // General Dynamics,USA
//      107: "", // Surrey Satellite Technology Ltd,GBR
//      108: "", // Swales Aerospace,USA
//      109: "", // Turkish Aerospace Industries,TUR
//      110: "", // TRW,USA
//      111: "", // Progress State Research and Production Rocket Space Center,RUS
//      112: "", // Yuzhnoye Design Bureau,UKR
      113: "https://twitter.com/invapargentina", // INVAP, ARG
//      115: "", // Arianespace",FRA
//      116: "", // EADS Astrium Space Transportation,FRA
//      117: "", // Eurockot Launch Services,"FRA, RUS
      118: "https://twitter.com/ilslaunch", // International Launch Services, USA
//      119: "", // ISC Kosmotras,RUS
//      120: "", // SpaceQuest, Ltd.,USA
//      121: "", // SpaceX,USA
//      122: "", // Sea Launch,RUS
//      123: "", // Starsem SA,"FRA,RUS"
//      124: "", // United Launch Alliance,"USA
//      125: "", // A.M. Makarov Yuzhny Machine-Building Plant, UKR
//      126: "", // Deep Space Industries,USA
//      127: "", // Robotics Institute,USA
//      128: "", // Planetary Resources, no twitter
//      129: "", // Tethers Unlimited, Inc.,USA
//      130: "", // RUAG Space,CHE
//      131: "", // Andrews Space,USA
//      132: "", // Kongsberg Defence & Aerospace,NOR
//      133: "", // Aerojet,USA
//      134: "", // American Rocket Company,USA
//      135: "", // Rocketdyne",USA
//      136: "", // Ad Astra Rocket Company,USA
//      137: "", // Reaction Engines Ltd.,GBR
//      138: "", // Snecma,FRA
//      139: "", // Armadillo Aerospace,USA
//      140: "", // Bigelow Aerospace,USA
//      141: "", // Blue Origin,USA
//      142: "", // Copenhagen Suborbitals,DNK
//      143: "", // PlanetSpace,USA
//      144: "", // Scaled Composites,USA
//      145: "", // XCOR  Aerospace,USA
//      146: "", // Canadian Arrow,CAN
//      147: "", // Rocket Lab Ltd,USA
//      148: "", // Scorpius Space Launch Company,USA
      149: "https://twitter.com/interorbital", // Interorbital Systems
//      150: "", // Masten Space Systems,USA
//      151: "", // Swedish Space Corp,SWE
//      152: "", // UP Aerospace,USA
//      153: "", // McDonnell Douglas,USA
//      154: "", // Production Corporation Polyot,RUS
//      156: "", // Alliant Techsystems,USA
//      157: "", // Bristol Aerospace Company,CAN
//      158: "", // Chrysler,USA
//      159: "", // Avio S.p.A,ITA
//      160: "", // Royal Australian Air Force,AUS
//      161: "", // United States Air Force,USA
//      162: "", // People's Liberation Army,CHN
//      163: "", // Russian Aerospace Defence Forces,RUS
//      165: "", // US Army,USA
//      166: "", // US Navy,USA
//      167: "", // Space Florida,USA
//      175: "", // Ministry of Defence of the Russian Federation,RUS
//      177: "", // China Great Wall Industry Corporation,CHN
//      178: "", // Airbus Defence and Space,"FRA, GER, GBR, ESP, ITA"
//      179: "", // Orbital ATK,USA
//      181: "", // National Reconnaissance Office,USA
//      182: "", // National Space Agency of the Republic of Kazakhstan,KAZ
//      183: "", // Unknown,UNK
//      184: "", // China Aerospace Science and Industry Corporation,CHN
//      186: "", // Polish Space Agency,POL
//      187: "", // GK Launch Services JV,RUS
//      188: "", // Gilmour Space Technologies,AUS/SIN
//      189: "", // China Aerospace Corporation,CHN
//      190: "", // Antrix Corporation Limited,IND
//      191: "", // United Space Alliance,USA
//      192: "", // Lockheed Space Operations Company,USA
//      193: "", // Russian Space Forces,RUS
//      194: "", // ExPace,CHN
//      195: "", // Sandia National Laboratories,USA
//      196: "", // Land Launch,RUS
//      197: "", // Lockheed Martin Space Operations,USA
//      198: "", // Mohammed bin Rashid Space Centre,UAE
//      199: "", // Virgin Orbit,USA
//      201: "", // Vector,USA
      202: "https://twitter.com/iridiumcomm", // Iridium Communications, USA
      //      203: "", // SES,LUX
      //      204,: "", // Globalstar,USA
      205: "https://twitter.com/inmarsatglobal", // Inmarsat, England
      206: "https://twitter.com/INTELSAT", // Intelsat
//      207: "", // Arab Satellite Communications Organization,SAU",
      208: "https://twitter.com/Telesat", // Telesat,CAN
//      210: "", // National Oceanic and Atmospheric Administration,USA
//      211: "", // National Security Agency,USA
//      212: "", // Digital Globe,USA
//      213: "", // Missile Defense Agency,USA
//      214: "", // Spire Global,USA
//      224: "", // GeoOptics,US
//      225: "", // 1worldspace,USA
//      226: "", // PanAmSat,USA
//      227: "", // UK Ministry Of Defence,GBR
//      228: "", // National Space Development Agency of Japan,JPN
//      229: "", // Eutelsat,FRA
//      230: "", // Broadcasting Satellite System Corporation,JPN
//      231: "", // SKY Perfect JSAT Group,JPN
//      232: "", // European Organisation for the Exploitation of Meteorological Satellites,"AUT,BEL,BGR,HRV,CZE,DNK,EST,FIN,FRA,DEU,GRC,HUN,IRL,ISL,ITA,LVA,LTU,LUX,NLD,NOR,POL,PRT,ROU,SVK,SVN,ESP,SWE,CHE,TUR,GBR",
//      233: "", // Direction générale de l'armement,FRA
//      234: "", // XTAR LLC",USA
//      235: "", // Thaicom,THA
//      236: "", // DirecTV,USA
//      237: "", // PT Telkom,IDN
//      238: "", // Hisdesat,ESP
//      239: "", // Satmex,MEX
//      240: "", // Optus,AUS
//      241: "", // WildBlue,USA
//      242: "", // Paradigm Secure Communications,GBR
//      243: "", // Hughes,USA
//      244: "", // Star One,BRA
//      245: "", // Regional African Satellite Communication Organization,MUS
//      246: "", // Vietnam Posts and Telecommunications Group,VNM
//      247: "", // Türksat,TUR
//      248: "", // ProtoStar,BMU
//      249: "", // Echostar,USA
//      250: "", // HispaSat,ESP
//      251: "", // AlYahSat,ARE
//      252: "", // MEASAT Satellite Systems,MYS
//      253: "", // French Armed Forces,FRA
//      254: "", // British Satellite Broadcasting,GBR
//      255: "", // Avanti Communications,GBR
//      256: "", // Mexican Satellite System,MEX
//      257: "", // Northrop Grumman Innovation Systems,USA",
//      259: "", // LandSpace,CHN",
//      260: "", // Planet Labs,USA",
//      261: "", // Korean Astronaut Program,KOR",
//      263: "", // OneSpace,CHN",
//      265: "", // Firefly Aerospace,USA",
//      266: "", // Relativity Space,USA",
//      270: "", // Strategic Missile Troops,RUS",
//      271: "", // Army Ballistic Missile Agency,USA",
//      272: "", // Chinarocket Co., Ltd.,CHN",
//      274: "", // iSpace,CHN",
      282: "https://twitter.com/aevumspace", // Aevum
//      285: "", // Astra Space,USA",
//      999: "", // North American Aviation, no twitter
//      1000: "", // Energia,RUS",
//      1001: "", // EXOS Aerospace,USA",
      1002: "https://twitter.com/natsuroke", // Interstellar Technologies
//      1003: "", // Aérospatiale,FRA",
//      1004: "", // Convair,USA",
//      1005: "", // Royal Aircraft Establishment,GBR",
//      1006: "", // Vought,USA",
//      1007: "", // Space Services Inc.,USA",
//      1008: "", // Société d'étude et de réalisation d'engins balistiques,FRA",
      // 1009: nil // Institute of Space and Astronautical Science, JPN
//      1010: "", // KB Mashinostroyeniya",RUS",
//      1011: "", // "Moscow Institute of Thermal Technology,RUS",
//      1012: "", // Department of Aerospace Science and Technology,BRA",
//      1013: "", // Makeyev Rocket Design Bureau,RUS",
//      1014: "", // Martin Marietta,USA",
//      1015: "", // European Launcher Development Organisation,EUR",
//      1016: "", // Weapons Research Establishment,AUS",
//      1017: "", // Science and Engineering Research Council,GBR",
//      1018: "", // National Research Council,ITA",
//      1019: "", // European Space Research Organisation,EUR",
//      1020: "", // Sierra Nevada Corporation,USA",
//      1021: "", // Galactic Energy,CHN",
      1022: "https://twitter.com/axiom_space" // Axiom Space,USA
   ]

let logos: [ Int64: String ] =
   [
      //      1: "", // Belarus Space Agency,BLR No logo
      //      2: "", // Aeronautics and Space Research and Diffusion Center,URY No logo
      3: "AEM", // Mexican Space Agency,MEX
      4: "ASAL", // Algerian Space Agency,DZA
      //      5: "", // Asia Pacific Multilateral Cooperation in Space Technology and Applications,"CHN,PAK,THA",
      //      6: "", // Asia-Pacific Regional Space Agency Forum,"AUS,BGD,BRN,BTN,CAN,KHM,CHN,FRA,DEU,IND,IDN,JPN,LAO,MYS,MNG,MMR,NPL,NZL,PAK,PHL,RUS,SGP,KOR,LKA,THA,USA,VNM",
      7: "APSCO", // Asia-Pacific Space Cooperation Organization,"BGD,CHN,IDN,IRNMNG,PAK,PER,THA,TUR"
      8: "FFG", // Austrian Space Agency,AUT
      9: "ANASA", // Azerbaijan National Aerospace Agency,AZE
      10: "BIRA_IASB", // Belgian Institute for Space Aeronomy,BEL
      11: "ABAE", // Bolivarian Agency for Space Activities,VEN
      12: "AEB", // Brazilian Space Agency,BRA
      13: "UKSpace", // UK Space Agency,GBR
      14: "ABE", // Bolivian Space Agency,BOL
      15: "IKIT", // Bulgarian Space Agency,BGR
      16: "CSA", // Canadian Space Agency,CAN
      17: "CNSA", // China National Space Administration,CHN
      //      18: "", // Colombian Space Commission,COL
      19: "CRISP", // Centre for Remote Imaging, Sensing and Processing,SGP
      20: "CSIRO", // Commonwealth Scientific and Industrial Research Organisation,AUS
      21: "CCSDS", // Consultative Committee for Space Data Systems,"ITA,GBR,CAN,FRA,CHN,DEU,BRA,JPN,USA,RUS",
      22: "COSPAR", // Committee on Space Research,"ARG,ARM,AUS,AUT,BEL,BGR,BRA,CAN,CHN,TWN,CZE,DNK,EGY,ESP,FIN,FRA,DEU,GRC,HUN,IND,IDN,IRN,ISR,ITA,JPN,MEX,NLD,NGA,NOR,PAK,POL,PRT,ROU,RUS,SVK,ZAF,SWE,CHE,THA,TUR,UKR,GBR,USA",
      23: "HSA", // Croatian Space Agency,HRV
      //      24: "", // "Ministry of Transport of the Czech Republic - Space Technologies and Satellite Systems Department,CZE
      25: "DTU", // Danish National Space Center,DNK
      26: "DTU", // Technical University of Denmark - National Space Institute,DNK, same as 25
      27: "ESA", // European Space Agency,"AUT,BEL,CZE,DNK,FIN,FRA,DEU,GRC,IRE,ITA,LUZ,NLD,NOR,POL,PRT,ROU,ESP,SWE,CHE,GBR
      28: "GISTDA", // Geo-Informatics and Space Technology Development Agency,THA
      29: "DLR", // German Aerospace Center,DEU
      30: "HSO", // Hungarian Space Office,HUN
      31: "ISRO", // Indian Space Research Organization, IND
      32: "ISARS", // Institute for Space Applications and Remote Sensing (ISARS), Greece
      33: "INTA", // Instituto Nacional de Técnica Aeroespacial (INTA), Spain
      34: "IranianSpaceAgency", // Iranian Space Agency", IRN
      35: "ISA", // Israeli Space Agency,ISR
      36: "ASI", // Italian Space Agency,ITA
      37: "JAXA", // Japan Aerospace Exploration Agency,JPN
      //      38: "", // National Space Agency (KazCosmos),KAZ, no logo
      //      39: "", // Kazakh Space Research Institute,KAZ, no logo , same as 38
      //      40: "", // Korean Committee of Space Technology,PRK, no logo
      41: "KARI", // Korea Aerospace Research Institute,KOR
      42: "LSA", // Lithuanian Space Association,LTU
      43: "Angkasa", // Malaysian National Space Agency,MYS
      44: "NASA", // National Aeronautics and Space Administration,USA
      45: "NARSSS", // National Authority for Remote Sensing and Space Sciences,EGY
      46: "CNES", // National Center of Space Research,FRA
      47: "CONIDA", // National Commission for Aerospace Research and Development",PER
      48: "CONAE", // National Commission for Space Research,ARG
      49: "CONAE", // National Space Activities Commission,ARG, same as 48
      50: "LAPAN", // National Institute of Aeronautics and Space,IDN
      51: "NRSCM", // National Remote Sensing Center of Mongolia,MNG
      //      52: "", // National Remote Sensing Center of Tunisia,TUN
      //      53: "", // Uzbek State Space Research Agency (UzbekCosmos),UZB
      54: "SSAU", // National Space Agency of Ukraine,UKR
      55: "NSPO", // National Space Organization,TWN
      //      56: "", // National Space Research and Development Agency,NGA
      57: "SRON", // Netherlands Institute for Space Research,NLD
      58: "NOSA", // Norwegian Space Centre,NOR
      59: "SUPARCO", // Pakistan Space and Upper Atmosphere Research Commission,PAK
      60: "PortugalSpace", // FCT Space Office,PRT
      //      61: "", // Romanian Space Agency,ROU
      //      62: "", // Royal Centre for Remote Sensing,MAR
      //      63: "", // Russian Federal Space Agency (ROSCOSMOS),RUS
      //      64: "", // Sri Lanka Space Agency,LKA
      //      65: "", // TUBITAK Space Technologies Research Institute,TUR
      //      66: "", // Soviet Space Program,RUS
      //      67: "", // Space Research and Remote Sensing Organization,BGD
      //      68: "", // Space Research Centre,POL
      //      69: "", // South African National Space Agency,ZAF
      //      70: "", // Space Research Institute of Saudi Arabia,SAU
      //      71: "", // Swiss Space Office,CHE
      //      72: "", // Turkmenistan National Space Agency,TKM
      //      73: "", // United Nations Office for Outer Space Affairs,"ALB,DZA,ARG,AUS,AUT,BEL,BEN,BOL,BRA,BGR,BFA,CMR,CAN,TDC,CHL,CHN,COL,CUB,CZE,ECU,EGY,FRA,HUN,DEU,GRC,IND,IDN,IRN,IRQ,ITA,JPN,KAZ,KEN,LBN,LBY,MYS,MEX,MNG,NLD,NIC,NER,NGA,PAK,PER,PHL,POL,PRT,KOR,ROU,RUS,SAU,SEN,SLE,SVK,ZAF,ESP,SDN,SWE,CHE,SYR,THA,TUR,GBR,USA,UKR,URY,VEN,VNM",
      //      75: "", // United Nations Committee on the Peaceful Uses of Outer Space,"ALB,DZA,ARG,AUS,AUT,BEL,BEN,BOL,BRA,BGR,BFA,CMR,CAN,TDC,CHL,CHN,COL,CUB,CZE,ECU,EGY,FRA,HUN,DEU,GRC,IND,IDN,IRN,IRQ,ITA,JPN,KAZ,KEN,LBN,LBY,MYS,MEX,MNG,NLD,NIC,NER,NGA,PAK,PER,PHL,POL,PRT,KOR,ROU,RUS,SAU,SEN,SLE,SVK,ZAF,ESP,SDN,SWE,CHE,SYR,THA,TUR,GBR,USA,UKR,URY,VEN,VNM",
      //      76: "", // Swedish National Space Board,SWE
      //      77: "", // OHB System",DEU
      //      78: "", // Thales Alenia Space,"FRA,ITA"
      //      79: "", // JSC Information Satellite Systems,RUS
      //      80: "", // Boeing,USA
      //      81: "", // Astrium Satellites,FRA,DEU,ESP,GBR
      //      82: "", // Lockheed Martin,USA
      //      83: "", // Space Systems/Loral,USA
      //      84: "", // Amsat,"USA,CAN,DEU,ITA,JPN,IND,GBR"
      //      85: "", // Astronautic Technology Sdn Bhd,MYS
      //      86: "", // Ball Aerospace & Technologies Corp.,USA",
      //      87: "", // British Aerospace,GBR",
      //      88: "", // China Aerospace Science and Technology Corporation,CHN",
      //      89: "", // Fairchild Space and Electronics Division,USA",
      //      90: "", // Fokker Space & Systems,NLD",
      //      91: "", // General Electric,USA",
      //      92: "", // Hawker Siddeley Dynamics,GBR",
      //      93: "", // Hughes Aircraft,USA",
      //      94: "", // IHI Corporation,JPN",
      //      95: "", // Israel Aerospace Industries,ISR",
      //      96: "", // Khrunichev State Research and Production Space Center,RUS",
      //      97: "", // NPO Lavochkin,RUS",
      //      98: "", // Mitsubishi Heavy Industries,JPN",
      //      99: "", // Northrop Grumman Space Technology,USA",
      //      100: "", // Orbital Sciences Corporation,USA",
      //      101: "", // Philco Ford,USA",
      //      102: "", // Rockwell International,USA",
      //      103: "", // RKK Energiya,RUS",
      //      104: "", // SPAR Aerospace,CAN",
      //      105: "", // SpaceDev,USA",
      //      106: "", // General Dynamics,USA",
      //      107: "", // Surrey Satellite Technology Ltd,GBR",
      //      108: "", // Swales Aerospace,USA",
      //      109: "", // Turkish Aerospace Industries,TUR",
      //      110: "", // TRW,USA",
      //      111: "", // Progress State Research and Production Rocket Space Center,RUS",
      //      112: "", // Yuzhnoye Design Bureau,"UKR",
      113: "INVAP", // INVAP, ARG
      //      115: "", // Arianespace",FRA",
      //      116: "", // EADS Astrium Space Transportation,FRA",
      //      117: "", // Eurockot Launch Services,"FRA, RUS",
      118: "ILS", // International Launch Services, USA
      //      119: "", // ISC Kosmotras,RUS",
      //      120: "", // SpaceQuest, Ltd.,USA",
      //      121: "", // SpaceX,USA",
      //      122: "", // Sea Launch,RUS",
      //      123: "", // Starsem SA,"FRA, RUS",
      //      124: "", // United Launch Alliance,"USA",
      //      125: "", // A.M. Makarov Yuzhny Machine-Building Plant, UKR",
      //      126: "", // Deep Space Industries,USA",
      //      127: "", // Robotics Institute,USA",
      128: "PlanetaryResources", // Planetary Resources
      //      129: "", // Tethers Unlimited, Inc.,USA",
      //      130: "", // RUAG Space,CHE",
      //      131: "", // Andrews Space,USA",
      //      132: "", // Kongsberg Defence & Aerospace,NOR",
      //      133: "", // Aerojet,USA",
      //      134: "", // American Rocket Company,USA",
      //      135: "", // Rocketdyne",USA",
      //      136: "", // Ad Astra Rocket Company,USA",
      //      137: "", // Reaction Engines Ltd.,GBR",
      //      138: "", // Snecma,FRA",
      //      139: "", // Armadillo Aerospace,USA",
      //      140: "", // Bigelow Aerospace,USA",
      //      141: "", // Blue Origin,USA",
      //      142: "", // Copenhagen Suborbitals,DNK",
      //      143: "", // PlanetSpace,USA",
      //      144: "", // Scaled Composites,USA",
      //      145: "", // XCOR  Aerospace,USA",
      //      146: "", // Canadian Arrow,CAN",
      //      147: "", // Rocket Lab Ltd,USA",
      //      148: "", // Scorpius Space Launch Company,USA",
      149: "IOS", // Interorbital Systems
      //      150: "", // Masten Space Systems,USA",
      //      151: "", // Swedish Space Corp,SWE",
      //      152: "", // UP Aerospace,USA",
      //      153: "", // McDonnell Douglas,USA",
      //      154: "", // Production Corporation Polyot,RUS",
      //      156: "", // Alliant Techsystems,USA",
      //      157: "", // Bristol Aerospace Company,CAN",
      //      158: "", // Chrysler,USA",
      //      159: "", // Avio S.p.A,ITA",
      //      160: "", // Royal Australian Air Force,AUS",
      //      161: "", // United States Air Force,USA",
      //      162: "", // People's Liberation Army,CHN",
      //      163: "", // Russian Aerospace Defence Forces,RUS",
      //      165: "", // US Army,USA",
      //      166: "", // US Navy,USA",
      //      167: "", // Space Florida,USA",
      //      175: "", // Ministry of Defence of the Russian Federation,RUS",
      //      177: "", // China Great Wall Industry Corporation,CHN",
      //      178: "", // Airbus Defence and Space,"FRA, GER, GBR, ESP, ITA",
      //      179: "", // Orbital ATK,USA",
      //      181: "", // National Reconnaissance Office,USA",
      //      182: "", // National Space Agency of the Republic of Kazakhstan,KAZ",
      //      183: "", // Unknown,UNK",
      //      184: "", // China Aerospace Science and Industry Corporation,CHN",
      //      186: "", // Polish Space Agency,POL",
      //      187: "", // GK Launch Services JV,RUS",
      //      188: "", // Gilmour Space Technologies,AUS/SIN",
      //      189: "", // China Aerospace Corporation,CHN",
      190: "Antrix", // Antrix Corporation Limited,IND",
      //      191: "", // United Space Alliance,USA",
      //      192: "", // Lockheed Space Operations Company,USA",
      //      193: "", // Russian Space Forces,RUS",
      //      194: "", // ExPace,CHN",
      //      195: "", // Sandia National Laboratories,USA",
      //      196: "", // Land Launch,RUS",
      //      197: "", // Lockheed Martin Space Operations",USA",
      //      198: "", // Mohammed bin Rashid Space Centre,UAE",
      //      199: "", // Virgin Orbit,USA",
      //      201: "", // Vector,USA",
      202: "Iridium", // Iridium Communications, USA
      //      203: "", // SES,LUX",
      //      204,: "", // Globalstar,USA",
      205: "Inmarsat", // Inmarsat
      206: "Intelsat", // Intelsat
      //      207: "", // Arab Satellite Communications Organization,SAU",
      208: "Telesat", // Telesat,CAN
      //      210: "", // National Oceanic and Atmospheric Administration,USA",
      //      211: "", // National Security Agency",USA",
      //      212: "", // Digital Globe,USA",
      //      213: "", // Missile Defense Agency,USA",
      //      214: "", // Spire Global,USA",
      //      224: "", // GeoOptics,US",
      //      225: "", // 1worldspace,USA",
      //      226: "", // PanAmSat,USA",
      //      227: "", // UK Ministry Of Defence,GBR",
      //      228: "", // National Space Development Agency of Japan,JPN",
      //      229: "", // Eutelsat,FRA",
      //      230: "", // Broadcasting Satellite System Corporation,JPN",
      //      231: "", // SKY Perfect JSAT Group,JPN",
      //      232: "", // European Organisation for the Exploitation of Meteorological Satellites,"AUT,BEL,BGR,HRV,CZE,DNK,EST,FIN,FRA,DEU,GRC,HUN,IRL,ISL,ITA,LVA,LTU,LUX,NLD,NOR,POL,PRT,ROU,SVK,SVN,ESP,SWE,CHE,TUR,GBR",
      //      233: "", // Direction générale de l'armement,FRA",
      //      234: "", // XTAR LLC",USA",
      //      235: "", // Thaicom,THA",
      //      236: "", // DirecTV,USA",
      //      237: "", // PT Telkom,IDN",
      //      238: "", // Hisdesat,ESP",
      //      239: "", // Satmex,MEX",
      //      240: "", // Optus,AUS",
      //      241: "", // WildBlue,USA",
      //      242: "", // Paradigm Secure Communications,GBR",
      //      243: "", // Hughes,USA",
      //      244: "", // Star One,BRA",
      //      245: "", // Regional African Satellite Communication Organization,MUS",
      //      246: "", // Vietnam Posts and Telecommunications Group,VNM",
      //      247: "", // Türksat,TUR",
      //      248: "", // ProtoStar,BMU",
      //      249: "", // Echostar,USA",
      //      250: "", // HispaSat,ESP",
      //      251: "", // AlYahSat,ARE",
      //      252: "", // MEASAT Satellite Systems",,"MYS",
      //      253: "", // French Armed Forces,FRA",
      //      254: "", // British Satellite Broadcasting,GBR",
      //      255: "", // Avanti Communications,GBR",
      //      256: "", // Mexican Satellite System,MEX",
      //      257: "", // Northrop Grumman Innovation Systems,USA",
      //      259: "", // LandSpace,CHN",
      //      260: "", // Planet Labs,USA",
      //      261: "", // Korean Astronaut Program,KOR",
      //      263: "", // OneSpace,CHN",
      //      265: "", // Firefly Aerospace,USA",
      //      266: "", // Relativity Space,USA",
      //      270: "", // Strategic Missile Troops,RUS",
      //      271: "", // Army Ballistic Missile Agency,USA",
      //      272: "", // Chinarocket Co., Ltd.,CHN",
      //      274: "", // iSpace,CHN",
      282: "Aevum", // Aevum
      //      285: "", // Astra Space,USA",
      999: "NAA", // North American Aviation
      //      1000: "", // Energia,RUS",
      //      1001: "", // EXOS Aerospace,USA",
      1002: "IST", // Interstellar Technologies
      //      1003: "", // Aérospatiale,FRA",
      //      1004: "", // Convair,USA",
      //      1005: "", // Royal Aircraft Establishment,GBR",
      //      1006: "", // Vought,USA",
      //      1007: "", // Space Services Inc.,USA",
      //      1008: "", // Société d'étude et de réalisation d'engins balistiques,FRA",
      1009: "ISAS", // Institute of Space and Astronautical Science, JPN
      //      1010: "", // KB Mashinostroyeniya",RUS",
      //      1011: "", // "Moscow Institute of Thermal Technology,RUS",
      //      1012: "", // Department of Aerospace Science and Technology,BRA",
      //      1013: "", // Makeyev Rocket Design Bureau,RUS",
      //      1014: "", // Martin Marietta,USA",
      //      1015: "", // European Launcher Development Organisation,EUR",
      //      1016: "", // Weapons Research Establishment,AUS",
      //      1017: "", // Science and Engineering Research Council,GBR",
      //      1018: "", // National Research Council,ITA",
      //      1019: "", // European Space Research Organisation,EUR",
      //      1020: "", // Sierra Nevada Corporation,USA",
      //      1021: "", // Galactic Energy,CHN",
      1022: "Axiom" // Axiom Space,USA",
   ]

let flags: [ Int64: String ] =
   [
      1: "BLR", // Belarus Space Agency,BLR
      2: "URY", // Aeronautics and Space Research and Diffusion Center,URY
      3: "MEX", // Mexican Space Agency,MEX
      4: "DZA", // Algerian Space Agency,DZA
      5: "CHN,PAK,THA", // Asia Pacific Multilateral Cooperation in Space Technology and Applications
      6: "AUS,BGD,BRN,BTN,CAN,KHM,CHN,FRA,DEU,IND,IDN,JPN,LAO,MYS,MNG,MMR,NPL,NZL,PAK,PHL,RUS,SGP,KOR,LKA,THA,USA,VNM", // Asia-Pacific Regional Space Agency Forum
      7: "BGD,CHN,IDN,IRNMNG,PAK,PER,THA,TUR", // Asia-Pacific Space Cooperation Organization
      8: "AUT", // Austrian Space Agency,AUT
      9: "AZE", // Azerbaijan National Aerospace Agency,AZE
      10: "BEL", // Belgian Institute for Space Aeronomy,BEL
      11: "VEN", // Bolivarian Agency for Space Activities,VEN
      12: "BRA", // Brazilian Space Agency,BRA",
      13: "GBR", // UK Space Agency,GBR",
      14: "BOL", // Bolivian Space Agency,BOL",
      15: "BGR", // Bulgarian Space Agency,BGR",
      16: "CAN", // Canadian Space Agency,CAN",
      17: "CHN", // China National Space Administration,CHN",
      18: "COL", // Colombian Space Commission,COL",
      19: "SGP", // Centre for Remote Imaging, Sensing and Processing,SGP",
      20: "AUS", // Commonwealth Scientific and Industrial Research Organisation,AUS",
      21: "ITA,GBR,CAN,FRA,CHN,DEU,BRA,JPN,USA,RUS", // Consultative Committee for Space Data Systems,"",
      22: "ARG,ARM,AUS,AUT,BEL,BGR,BRA,CAN,CHN,TWN,CZE,DNK,EGY,ESP,FIN,FRA,DEU,GRC,HUN,IND,IDN,IRN,ISR,ITA,JPN,MEX,NLD,NGA,NOR,PAK,POL,PRT,ROU,RUS,SVK,ZAF,SWE,CHE,THA,TUR,UKR,GBR,USA", // Committee on Space Research,"",
      23: "HRV", // Croatian Space Agency,HRV",
      24: "CZE", // "Ministry of Transport of the Czech Republic - Space Technologies and Satellite Systems Department,CZE",
      25: "DNK", // Danish National Space Center,DNK",
      26: "DNK", // Technical University of Denmark - National Space Institute,DNK",
      27: "AUT,BEL,CZE,DNK,FIN,FRA,DEU,GRC,IRE,ITA,LUZ,NLD,NOR,POL,PRT,ROU,ESP,SWE,CHE,GBR", // European Space Agency,"",
      28: "THA", // Geo-Informatics and Space Technology Development Agency,THA",
      29: "DEU", // German Aerospace Center,DEU",
      30: "HUN", // Hungarian Space Office,HUN",
      31: "IND", // Indian Space Research Organization, IND
      32: "GRC", // Institute for Space Applications and Remote Sensing (ISARS), Greece
      33: "ESP", // Instituto Nacional de Técnica Aeroespacial (INTA), Spain
      34: "IRN", // Iranian Space Agency", IRN
      35: "ISR", // Israeli Space Agency,ISR",
      36: "ITA", // Italian Space Agency,ITA",
      37: "JPN", // Japan Aerospace Exploration Agency,JPN",
      38: "KAZ", // National Space Agency (KazCosmos),KAZ",
      39: "KAZ", // Kazakh Space Research Institute,KAZ",
      40: "PRK", // Korean Committee of Space Technology,PRK",
      41: "KOR", // Korea Aerospace Research Institute,KOR",
      42: "LTU", // Lithuanian Space Association,LTU",
      43: "MYS", // Malaysian National Space Agency,MYS",
      44: "USA", // National Aeronautics and Space Administration,USA",
      45: "EGY", // National Authority for Remote Sensing and Space Sciences,EGY",
      46: "FRA", // National Center of Space Research,FRA",
      47: "PER", // National Commission for Aerospace Research and Development",PER",
      48: "ARG", // National Commission for Space Research,ARG",
      49: "ARG", // National Space Activities Commission,ARG",
      50: "IDN", // National Institute of Aeronautics and Space,IDN",
      51: "MNG", // National Remote Sensing Center of Mongolia,MNG",
      52: "TUN", // National Remote Sensing Center of Tunisia,TUN",
      53: "UZB", // Uzbek State Space Research Agency (UzbekCosmos),UZB",
      54: "UKR", // National Space Agency of Ukraine,UKR",
      55: "TWN", // National Space Organization,TWN",
      56: "NGA", // National Space Research and Development Agency,NGA",
      57: "NLD", // Netherlands Institute for Space Research,NLD
      58: "NOR", // Norwegian Space Centre,NOR",
      59: "PAK", // Pakistan Space and Upper Atmosphere Research Commission,PAK",
      60: "PRT", // FCT Space Office,PRT",
      61: "ROU", // Romanian Space Agency,ROU",
      62: "MAR", // Royal Centre for Remote Sensing,MAR",
      63: "RUS", // Russian Federal Space Agency (ROSCOSMOS),RUS",
      64: "LKA", // Sri Lanka Space Agency,LKA",
      65: "TUR", // TUBITAK Space Technologies Research Institute,TUR",
      66: "RUS", // Soviet Space Program,RUS",
      67: "BGD", // Space Research and Remote Sensing Organization,BGD",
      68: "POL", // Space Research Centre,POL",
      69: "ZAF", // South African National Space Agency,ZAF",
      70: "SAU", // Space Research Institute of Saudi Arabia,SAU",
      71: "CHE", // Swiss Space Office,CHE",
      72: "TKM", // Turkmenistan National Space Agency,TKM",
      73: "ALB,DZA,ARG,AUS,AUT,BEL,BEN,BOL,BRA,BGR,BFA,CMR,CAN,TDC,CHL,CHN,COL,CUB,CZE,ECU,EGY,FRA,HUN,DEU,GRC,IND,IDN,IRN,IRQ,ITA,JPN,KAZ,KEN,LBN,LBY,MYS,MEX,MNG,NLD,NIC,NER,NGA,PAK,PER,PHL,POL,PRT,KOR,ROU,RUS,SAU,SEN,SLE,SVK,ZAF,ESP,SDN,SWE,CHE,SYR,THA,TUR,GBR,USA,UKR,URY,VEN,VNM", // United Nations Office for Outer Space Affairs,"",
      75: "ALB,DZA,ARG,AUS,AUT,BEL,BEN,BOL,BRA,BGR,BFA,CMR,CAN,TDC,CHL,CHN,COL,CUB,CZE,ECU,EGY,FRA,HUN,DEU,GRC,IND,IDN,IRN,IRQ,ITA,JPN,KAZ,KEN,LBN,LBY,MYS,MEX,MNG,NLD,NIC,NER,NGA,PAK,PER,PHL,POL,PRT,KOR,ROU,RUS,SAU,SEN,SLE,SVK,ZAF,ESP,SDN,SWE,CHE,SYR,THA,TUR,GBR,USA,UKR,URY,VEN,VNM", // United Nations Committee on the Peaceful Uses of Outer Space,"",
      76: "SWE", // Swedish National Space Board,SWE",
      77: "DEU", // OHB System",DEU",
      78: "FRA,ITA", // Thales Alenia Space,"FRA,ITA",
      79: "RUS", // JSC Information Satellite Systems,RUS",
      80: "USA", // Boeing,USA",
      81: "FRA,DEU,ESP,GBR", // Astrium Satellites,FRA,DEU,ESP,GBR",
      82: "USA", // Lockheed Martin,USA",
      83: "USA", // Space Systems/Loral,USA",
      84: "USA,CAN,DEU,ITA,JPN,IND,GBR", // Amsat,"USA,CAN,DEU,ITA,JPN,IND,GBR",
      85: "MYS", // Astronautic Technology Sdn Bhd,MYS",
      86: "USA", // Ball Aerospace & Technologies Corp.,USA",
      87: "GBR", // British Aerospace,GBR",
      88: "CHN", // China Aerospace Science and Technology Corporation,CHN",
      89: "USA", // Fairchild Space and Electronics Division,USA",
      90: "NLD", // Fokker Space & Systems,NLD",
      91: "USA", // General Electric,USA",
      92: "GBR", // Hawker Siddeley Dynamics,GBR",
      93: "USA", // Hughes Aircraft,USA",
      94: "JPN", // IHI Corporation,JPN",
      95: "ISR", // Israel Aerospace Industries,ISR",
      96: "RUS", // Khrunichev State Research and Production Space Center,RUS",
      97: "RUS", // NPO Lavochkin,RUS",
      98: "JPN", // Mitsubishi Heavy Industries,JPN",
      99: "USA", // Northrop Grumman Space Technology,USA",
      100: "USA", // Orbital Sciences Corporation,USA",
      101: "USA", // Philco Ford,USA",
      102: "USA", // Rockwell International,USA",
      103: "RUS", // RKK Energiya,RUS",
      104: "CAN", // SPAR Aerospace,CAN",
      105: "USA", // SpaceDev,USA",
      106: "USA", // General Dynamics,USA",
      107: "GBR", // Surrey Satellite Technology Ltd,GBR",
      108: "USA", // Swales Aerospace,USA",
      109: "TUR", // Turkish Aerospace Industries,TUR",
      110: "USA", // TRW,USA",
      111: "RUS", // Progress State Research and Production Rocket Space Center,RUS",
      112: "UKR", // Yuzhnoye Design Bureau,"UKR",
      113: "ARG", // INVAP, ARG
      115: "FRA", // Arianespace",FRA",
      116: "FRA", // EADS Astrium Space Transportation,FRA",
      117: "FRA,RUS", // Eurockot Launch Services,"FRA, RUS",
      118: "USA", // International Launch Services, USA
      119: "RUS", // ISC Kosmotras,RUS",
      120: "USA", // SpaceQuest, Ltd.,USA",
      121: "USA", // SpaceX,USA",
      122: "RUS", // Sea Launch,RUS",
      123: "RUS", // Starsem SA,"FRA, RUS",
      124: "USA", // United Launch Alliance,"USA",
      125: "UKR", // A.M. Makarov Yuzhny Machine-Building Plant, UKR",
      126: "USA", // Deep Space Industries,USA",
      127: "USA", // Robotics Institute,USA",
      128: "USA", // Planetary Resources
      129: "USA", // Tethers Unlimited, Inc.,USA",
      130: "CHE", // RUAG Space,CHE",
      131: "USA", // Andrews Space,USA",
      132: "NOR", // Kongsberg Defence & Aerospace,NOR",
      133: "USA", // Aerojet,USA",
      134: "USA", // American Rocket Company,USA",
      135: "USA", // Rocketdyne",USA",
      136: "USA", // Ad Astra Rocket Company,USA",
      137: "GBR", // Reaction Engines Ltd.,GBR",
      138: "FRA", // Snecma,FRA",
      139: "USA", // Armadillo Aerospace,USA",
      140: "USA", // Bigelow Aerospace,USA",
      141: "USA", // Blue Origin,USA",
      142: "DNK", // Copenhagen Suborbitals,DNK",
      143: "USA", // PlanetSpace,USA",
      144: "USA", // Scaled Composites,USA",
      145: "USA", // XCOR  Aerospace,USA",
      146: "CAN", // Canadian Arrow,CAN",
      147: "USA", // Rocket Lab Ltd,USA",
      148: "USA", // Scorpius Space Launch Company,USA",
      149: "USA", // Interorbital Systems
      150: "USA", // Masten Space Systems,USA",
      151: "SWE", // Swedish Space Corp,SWE",
      152: "USA", // UP Aerospace,USA",
      153: "USA", // McDonnell Douglas,USA",
      154: "RUS", // Production Corporation Polyot,RUS",
      156: "USA", // Alliant Techsystems,USA",
      157: "CAN", // Bristol Aerospace Company,CAN",
      158: "USA", // Chrysler,USA",
      159: "ITA", // Avio S.p.A,ITA",
      160: "AUS", // Royal Australian Air Force,AUS",
      161: "USA", // United States Air Force,USA",
      162: "CHN", // People's Liberation Army,CHN",
      163: "RUS", // Russian Aerospace Defence Forces,RUS",
      165: "USA", // US Army,USA",
      166: "USA", // US Navy,USA",
      167: "USA", // Space Florida,USA",
      175: "RUS", // Ministry of Defence of the Russian Federation,RUS",
      177: "CHN", // China Great Wall Industry Corporation,CHN",
      178: "FRA,GER,GBR,ESP,ITA", // Airbus Defence and Space,"FRA, GER, GBR, ESP, ITA",
      179: "USA", // Orbital ATK,USA",
      181: "USA", // National Reconnaissance Office,USA",
      182: "KAZ", // National Space Agency of the Republic of Kazakhstan,KAZ",
      //      183: "", // Unknown,UNK",
      184: "CHN", // China Aerospace Science and Industry Corporation,CHN
      186: "POL", // Polish Space Agency,POL
      187: "RUS", // GK Launch Services JV,RUS
      188: "AUS,SIN", // Gilmour Space Technologies,AUS/SIN
      189: "CHN", // China Aerospace Corporation,CHN
      190: "IND", // Antrix Corporation Limited,IND
      191: "USA", // United Space Alliance,USA
      192: "USA", // Lockheed Space Operations Company,USA
      193: "RUS", // Russian Space Forces,RUS
      194: "CHN", // ExPace,CHN
      195: "USA", // Sandia National Laboratories,USA
      196: "RUS", // Land Launch,RUS
      197: "USA", // Lockheed Martin Space Operations,USA
      198: "UAE", // Mohammed bin Rashid Space Centre,UAE
      199: "USA", // Virgin Orbit,USA",
      201: "USA", // Vector,USA",
      202: "USA", // Iridium Communications, USA
      203: "LUX", // SES,LUX",
      204: "USA", // Globalstar,USA",
      205: "GBR", // Inmarsat, England
      206: "LUX", // Intelsat
      207: "SAU", // Arab Satellite Communications Organization,SAU",
      208: "CAN", // Telesat,CAN
      210: "USA", // National Oceanic and Atmospheric Administration,USA
      211: "USA", // National Security Agency,USA
      212: "USA", // Digital Globe,USA
      213: "USA", // Missile Defense Agency,USA
      214: "USA", // Spire Global,USA
      224: "USA", // GeoOptics,USA
      225: "USA", // 1worldspace,USA
      226: "USA", // PanAmSat,USA
      227: "GBR", // UK Ministry Of Defence,GBR
      228: "JPN", // National Space Development Agency of Japan,JPN
      229: "FRA", // Eutelsat,FRA
      230: "JPN", // Broadcasting Satellite System Corporation,JPN
      231: "JPN", // SKY Perfect JSAT Group,JPN
      232: "AUT,BEL,BGR,HRV,CZE,DNK,EST,FIN,FRA,DEU,GRC,HUN,IRL,ISL,ITA,LVA,LTU,LUX,NLD,NOR,POL,PRT,ROU,SVK,SVN,ESP,SWE,CHE,TUR,GBR", // European Organisation for the Exploitation of Meteorological Satellites,"AUT,BEL,BGR,HRV,CZE,DNK,EST,FIN,FRA,DEU,GRC,HUN,IRL,ISL,ITA,LVA,LTU,LUX,NLD,NOR,POL,PRT,ROU,SVK,SVN,ESP,SWE,CHE,TUR,GBR",
      233: "FRA", // Direction générale de l'armement,FRA
      234: "USA", // XTAR LLC,USA
      235: "THA", // Thaicom,THA
      236: "USA", // DirecTV,USA
      237: "IDN", // PT Telkom,IDN
      238: "ESP", // Hisdesat,ESP
      239: "MEX", // Satmex,MEX
      240: "AUS", // Optus,AUS
      241: "USA", // WildBlue,USA
      242: "GBR", // Paradigm Secure Communications,GBR
      243: "USA", // Hughes,USA
      244: "BRA", // Star One,BRA
      245: "MUS", // Regional African Satellite Communication Organization,MUS
      246: "VNM", // Vietnam Posts and Telecommunications Group,VNM
      247: "TUR", // Türksat,TUR
      248: "BMU", // ProtoStar,BMU
      249: "USA", // Echostar,USA
      250: "ESP", // HispaSat,ESP
      251: "ARE", // AlYahSat,ARE
      252: "MYS", // MEASAT Satellite Systems",MYS
      253: "FRA", // French Armed Forces,FRA
      254: "GBR", // British Satellite Broadcasting,GBR
      255: "GBR", // Avanti Communications,GBR
      256: "MEX", // Mexican Satellite System,MEX
      257: "USA", // Northrop Grumman Innovation Systems,USA
      259: "CHN", // LandSpace,CHN
      260: "USA", // Planet Labs,USA
      261: "KOR", // Korean Astronaut Program,KOR
      263: "CHN", // OneSpace,CHN
      265: "USA", // Firefly Aerospace,USA
      266: "USA", // Relativity Space,USA
      270: "RUS", // Strategic Missile Troops,RUS
      271: "USA", // Army Ballistic Missile Agency,USA
      272: "CHN", // Chinarocket Co., Ltd.,CHN
      274: "CHN", // iSpace,CHN
      282: "USA", // Aevum
      285: "USA", // Astra Space,USA
      999: "USA", // North American Aviation
      1000: "RUS", // Energia,RUS
      1001: "USA", // EXOS Aerospace,USA
      1002: "JPN", // Interstellar Technologies
      1003: "FRA", // Aérospatiale,FRA
      1004: "USA", // Convair,USA
      1005: "GBR", // Royal Aircraft Establishment,GBR
      1006: "USA", // Vought,USA
      1007: "USA", // Space Services Inc.,USA
      1008: "FRA", // Société d'étude et de réalisation d'engins balistiques,FRA
      1009: "JPN", // Institute of Space and Astronautical Science, JPN
      1010: "RUS", // KB Mashinostroyeniya",RUS
      1011: "RUS", // "Moscow Institute of Thermal Technology,RUS
      1012: "BRA", // Department of Aerospace Science and Technology,BRA
      1013: "RUS", // Makeyev Rocket Design Bureau,RUS
      1014: "USA", // Martin Marietta,USA
      1015: "EUR", // European Launcher Development Organisation,EUR
      1016: "AUS", // Weapons Research Establishment,AUS
      1017: "GBR", // Science and Engineering Research Council,GBR
      1018: "ITA", // National Research Council,ITA
      1019: "EUR", // European Space Research Organisation,EUR
      1020: "USA", // Sierra Nevada Corporation,USA
      1021: "CHN", // Galactic Energy,CHN
      1022: "USA" // Axiom Space,USA
   ]
