//
//  Route.swift
//  Pathy
//
//  Created by Mason Drabik on 3/18/24.
//

import Foundation
import MapKit

// Example JSON
// {
//     "id": "FCDD92CA-94BE-4D55-885B-7D5F399813F8",
//     "userName": "Sam Shi",
//     "distance": 1.01,
//     "startTime": "2024-02-29T04:13:34Z",
//     "endTime": "2024-02-29T04:20:47Z",
//     "type": "walk",
//     "routePoints": [
//         {
//             "latitude": 35.918177364674854,
//             "timestamp": "2024-02-29T04:13:34Z",
//             "longitude": -79.0556610644248
//         },
//         ...
//     ]
// }

struct Route: Codable, Identifiable{
    // TODO: Fill in properties according to API docs and example JSON above
    // - Hint: "FCDD92CA-94BE-4D55-885B-7D5F399813F8" is a UUID
    // - Hint: "2024-02-29T04:13:34Z" is an iso8601 encoded Date
    // - Hint: the "type" field is of type RouteType
    let id: UUID
    let userName: String
    let distance: Double
    let startTime: Date
    let endTime: Date
    let type: RouteType
    let routePoints: [RoutePoint]

    // TODO: Uncomment all of these computed properties
    var coordinates: [CLLocationCoordinate2D] {
        routePoints.map { CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude) }
    }

    var formattedDuration: String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute, .second]
        return formatter.string(from: startTime, to: endTime)!
    }

    var formattedDistance: String {
        String(format: "%.2f", distance)
    }

    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: startTime)
    }
}

// TODO: Uncomment these examples
extension Route {
    static var walkExample: Route {
        Route(
            id: UUID(),
            userName: "Sam Shi",
            distance: 1.01,
            startTime: RoutePoint.exampleWalk.first?.timestamp ?? Date(),
            endTime: RoutePoint.exampleWalk.last?.timestamp ?? Date(),
            type: .walk,
            routePoints: RoutePoint.exampleWalk)
    }

    static var bikeExample: Route {
        Route(
            id: UUID(),
            userName: "Alec Nipp",
            distance: 6.5,
            startTime: RoutePoint.exampleWalk.first?.timestamp ?? Date(),
            endTime: RoutePoint.exampleWalk.last?.timestamp ?? Date(),
            type: .bike,
            routePoints: RoutePoint.exampleWalk)
    }
}
