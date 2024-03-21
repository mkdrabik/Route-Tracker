//
//  RoutePoint.swift
//  Pathy
//
//  Created by Mason Drabik on 3/18/24.
//

import Foundation

// Example JSON
// {
//     "latitude": 35.918177364674854,
//     "longitude": -79.0556610644248,
//     "timestamp": "2024-02-29T04:13:34Z"
// }


struct RoutePoint: Codable{
    // TODO: Fill in properties according to API docs and example JSON above
    // - Hint: "2024-02-29T04:13:34Z" is an iso8601 encoded Date
    let latitude: Double
    let longitude: Double
    let timestamp: Date
}

// TODO: Uncomment this example
extension RoutePoint {
    static var exampleWalk: [RoutePoint] {
        let coordinates: [(latitude: Double, longitude: Double)] = [
            (latitude: 35.918177364674854, longitude: -79.0556610644248),
            (latitude: 35.918177364674854, longitude: -79.0556610644248),
            (latitude: 35.9183598356656, longitude: -79.05591373339207),
            (latitude: 35.91826641935475, longitude: -79.05614633120508),
            (latitude: 35.91825476850934, longitude: -79.05615119270892),
            (latitude: 35.91826441025417, longitude: -79.05611846947673),
            (latitude: 35.91829817625053, longitude: -79.05613108150696),
           (latitude: 35.91831134159126, longitude: -79.05616572815025),
             (latitude: 35.91831559612395, longitude: -79.05620323905661),
             (latitude: 35.91834705923925, longitude: -79.05621507722807),
             (latitude: 35.91841987636012, longitude: -79.05621342885888),
             (latitude: 35.918452168653076, longitude: -79.05621335288939),
             (latitude: 35.91847959492123, longitude: -79.05620429473201),
             (latitude: 35.91850651496551, longitude: -79.05620505988693),
             (latitude: 35.91853187406277, longitude: -79.05619910219119),
             (latitude: 35.91855630564831, longitude: -79.05618199833702),
             (latitude: 35.91857761780953, longitude: -79.05615322074438),
             (latitude: 35.918589397089505, longitude: -79.05612352551985),
             (latitude: 35.91860154880085, longitude: -79.05609722873203),
             (latitude: 35.91861040385305, longitude: -79.05607041186576),
             (latitude: 35.91862369737922, longitude: -79.05604185810839),
             (latitude: 35.91863212100224, longitude: -79.05601347496487),
             (latitude: 35.91864271391278, longitude: -79.055971862614),
             (latitude: 35.918656060441094, longitude: -79.05593928321689),
             (latitude: 35.91867201510162, longitude: -79.0559002991858),
             (latitude: 35.918692868210705, longitude: -79.05585248259997),
             (latitude: 35.918698551124955, longitude: -79.05581249519525),
             (latitude: 35.91871780006983, longitude: -79.05575961286912),
             (latitude: 35.91872878554422, longitude: -79.05572435246093),
             (latitude: 35.918739826995285, longitude: -79.0556804941306),
             (latitude: 35.918749700103504, longitude: -79.0556392058184),
             (latitude: 35.91875804301571, longitude: -79.05560471303554),
             (latitude: 35.91877087674105, longitude: -79.05556569692513),
             (latitude: 35.91878545862694, longitude: -79.05553043645808),
             (latitude: 35.91879779343973, longitude: -79.05549400528936),
             (latitude: 35.91880704132502, longitude: -79.05546852373057),
             (latitude: 35.91881473507565, longitude: -79.05543926864388),
             (latitude: 35.9188267089142, longitude: -79.05541143435768),
             (latitude: 35.91883718760422, longitude: -79.05538216858399),
             (latitude: 35.91884529416412, longitude: -79.05535398693921),
             (latitude: 35.918849988375655, longitude: -79.05530967445623),
             (latitude: 35.91884920990203, longitude: -79.0552574845127),
             (latitude: 35.918865084651415, longitude: -79.0552266897751),
             (latitude: 35.918875285470996, longitude: -79.05520058489563),
             (latitude: 35.91887355704446, longitude: -79.05514991862368),
             (latitude: 35.91888205620569, longitude: -79.05511896439057),
             (latitude: 35.918871636892845, longitude: -79.05508261275297),
             (latitude: 35.91884983438231, longitude: -79.05507343553212),
             (latitude: 35.91881635005514, longitude: -79.05504567551188),
             (latitude: 35.91878509656613, longitude: -79.05503664569844),
             (latitude: 35.918753251404816, longitude: -79.0550477097608),
             (latitude: 35.918719397227754, longitude: -79.05505123105971),
             (latitude: 35.91869395355145, longitude: -79.05505515794192),
             (latitude: 35.918655143757576, longitude: -79.0550626981567),
             (latitude: 35.918630209344315, longitude: -79.05506587227124),
             (latitude: 35.91859764079838, longitude: -79.05506213661054),
             (latitude: 35.91857379769007, longitude: -79.0550668927577),
             (latitude: 35.91854003946348, longitude: -79.05507728949483),
             (latitude: 35.91851063269592, longitude: -79.05508246465969),
             (latitude: 35.91851815582894, longitude: -79.05505314552761),
             (latitude: 35.918516957514726, longitude: -79.05501716669335),
             (latitude: 35.91850497007702, longitude: -79.05499268118126),
             (latitude: 35.9184926907061, longitude: -79.05496857597919),
             (latitude: 35.91846914334424, longitude: -79.05493929799692),
             (latitude: 35.91843913779696, longitude: -79.05492934303736),
             (latitude: 35.91841758816648, longitude: -79.05491825807175),
             (latitude: 35.9183870657554, longitude: -79.05492246680274),
             (latitude: 35.918355797619434, longitude: -79.05492312037234),
             (latitude: 35.91832517683747, longitude: -79.0549218251735),
             (latitude: 35.91829329333118, longitude: -79.05492305755998),
             (latitude: 35.91826876561721, longitude: -79.05493118213025),
             (latitude: 35.918241581539824, longitude: -79.0549391210483),
             (latitude: 35.91820881974014, longitude: -79.05494781261524),
             (latitude: 35.91818208554879, longitude: -79.05496111187922),
             (latitude: 35.9181585004639, longitude: -79.05499832698196),
             (latitude: 35.91815068487297, longitude: -79.05503576195461),
             (latitude: 35.91813994272046, longitude: -79.05508385273717),
             (latitude: 35.91812867676293, longitude: -79.05511370078096),
             (latitude: 35.918124375776415, longitude: -79.05514715146002),
             (latitude: 35.91811806723602, longitude: -79.05519155445532),
             (latitude: 35.9181151223192, longitude: -79.05522595571902),
             (latitude: 35.9181128279813, longitude: -79.0552613908679),
             (latitude: 35.918102113458424, longitude: -79.05529942468402),
             (latitude: 35.91809826615418, longitude: -79.05533101360489),
             (latitude: 35.918095485142196, longitude: -79.05536182972179),
             (latitude: 35.918096450801826, longitude: -79.05539409082671),
             (latitude: 35.91808873273328, longitude: -79.0554243590201),
             (latitude: 35.91807988248589, longitude: -79.055457554695),
             (latitude: 35.9180514714387, longitude: -79.05548268614672),
             (latitude: 35.91802761978735, longitude: -79.05550318060686),
             (latitude: 35.918010285135914, longitude: -79.05553942588563),
             (latitude: 35.917994492819474, longitude: -79.05556564024234),
             (latitude: 35.91798182482289, longitude: -79.05559829216332),
             (latitude: 35.917973951451316, longitude: -79.05563484368537),
             (latitude: 35.917968742755036, longitude: -79.0556682385821),
             (latitude: 35.91796833226389, longitude: -79.0557022611214),
             (latitude: 35.91796337687222, longitude: -79.05573372538845),
             (latitude: 35.91795457802018, longitude: -79.05576393947811),
             (latitude: 35.91794287071758, longitude: -79.05579910860533),
             (latitude: 35.91793076768285, longitude: -79.05582876009996),
             (latitude: 35.91792497244306, longitude: -79.05586181439732),
             (latitude: 35.91791991604677, longitude: -79.0558942332134),
             (latitude: 35.91791237423558, longitude: -79.05592593485477),
             (latitude: 35.91789821119924, longitude: -79.05597478509436),
             (latitude: 35.91787829757184, longitude: -79.05600789966795),
             (latitude: 35.91787662118181, longitude: -79.05604537073265),
             (latitude: 35.91787346465152, longitude: -79.05607947484316),
             (latitude: 35.917867716649205, longitude: -79.05611261081116),
             (latitude: 35.91786769592414, longitude: -79.05614883451467),
             (latitude: 35.91786709254458, longitude: -79.05618286043824),
             (latitude: 35.91788416422225, longitude: -79.05621416648513),
             (latitude: 35.917914152105446, longitude: -79.056231785031),
             (latitude: 35.917949137678356, longitude: -79.05623489554543),
             (latitude: 35.917984956575715, longitude: -79.05622824185157),
             (latitude: 35.91801595089177, longitude: -79.05622560626931),
             (latitude: 35.918045335782395, longitude: -79.05621172673453),
             (latitude: 35.91804941649893, longitude: -79.0561622205845),
             (latitude: 35.91804888571279, longitude: -79.05612495649656),
             (latitude: 35.91805936258621, longitude: -79.05609159967811),
             (latitude: 35.918068670697295, longitude: -79.05605706553966),
             (latitude: 35.918074520730435, longitude: -79.05602293692199),
             (latitude: 35.91807964438267, longitude: -79.05599322926969),
             (latitude: 35.91808501466631, longitude: -79.05596158996885),
             (latitude: 35.91809486170145, longitude: -79.05593442729867),
             (latitude: 35.918125342063064, longitude: -79.05593055092179),
             (latitude: 35.918151983349404, longitude: -79.05593520626948),
             (latitude: 35.918176120079806, longitude: -79.05592797810527),
             (latitude: 35.91820245806853, longitude: -79.05593232543676),
             (latitude: 35.9182133044543, longitude: -79.05595929103816),
             (latitude: 35.91824674791686, longitude: -79.05597093975683),
             (latitude: 35.91826599716354, longitude: -79.05598850876873),
             (latitude: 35.918281032720515, longitude: -79.05601684233449),
             (latitude: 35.91828532367069, longitude: -79.05604584521686),
             (latitude: 35.91825862137383, longitude: -79.05607044896684)
         ]

         var date = Date()
         var result: [RoutePoint] = []

         for coordinate in coordinates {
             result.append(RoutePoint(latitude: coordinate.latitude, longitude: coordinate.longitude, timestamp: date))
             date += 1
         }

         return result
     }
 }
