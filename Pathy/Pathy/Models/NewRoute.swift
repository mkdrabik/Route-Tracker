//
//  NewRoute.swift
//  Pathy
//
//  Created by Mason Drabik on 3/18/24.
//

import Foundation

// Example JSON
// {
//     "userName": "Sam Shi",
//     "distance": 1.01,                    // miles
//     "startTime": "2024-02-29T04:13:34Z", // Date
//     "endTime": "2024-02-29T04:20:47Z",   // Date
//     "type": "walk",                      // RouteType
//     "routePoints": [
//         {
//             "latitude": 35.918177364674854,
//             "longitude": -79.0556610644248,
//             "timestamp": "2024-02-29T04:13:34Z"
//         },
//         ...
//     ]
// }


struct NewRoute: Codable{
    // TODO: Fill in properties according to API docs and example JSON above
    // - Hint: "2024-02-29T04:13:34Z" is an iso8601 encoded Date
    // - Hint: the "type" field is of type RouteType
    let userName: String
    let distance: Double
    let startTime: Date
    let endTime: Date
    let type: RouteType
    let routePoints: [RoutePoint]
}
