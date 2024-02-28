//
//  RouteInProgressViewModel.swift
//  Pathy
//
//  Created by Mason Drabik on 2/28/24.
//

import CoreLocation
import Foundation
import SwiftUI

class RouteInProgressViewModel: ObservableObject {
    /// The current state of the route state collection
    @Published var routeState: RouteState = .notStarted
    
    /// A list of rich locations describing the user's route until now
    @Published var route: [CLLocation] = []
    
    var startTime: Date = .init()
    var endTime: Date = .init()
    
    /// Update the current route with a new location
    func addLocationToRoute(location: CLLocation) {
        route.append(location)
    }
    
    /// Call this method to start collecting the route
    func startCollectingRoute() {
        startTime = Date()
        routeState = .inProgress(startTime: startTime)
    }
    
    /// Call this method to stop collecting the route
    func stopCollectingRoute(routeStartTime: Date) {
        startTime = routeStartTime
        endTime = Date()
        routeState = .ended(startTime: startTime, endTime: endTime)
    }
    
    /// A list of coordinates describing the user's route until now
    var coordinates: [CLLocationCoordinate2D] {
        var coords: [CLLocationCoordinate2D] = []
        for location in route {
            coords.append(location.coordinate)
        }
        return coords
    }
    
    /// The distance of the route so far, in miles
    var distance: Double {
        guard var previousLocation = route.first else { return 0 }
        var distanceMeters: Double = 0
        
        for location in route {
            distanceMeters += previousLocation.distance(from: location)
            previousLocation = location
        }
    
        // Use the Measurement API to convert from meters to miles
        let distanceMeasurement = Measurement(value: distanceMeters, unit: UnitLength.meters)
        return distanceMeasurement.converted(to: .miles).value
    }
    
    /// The distance of the route so far, in miles, formatted as a string
    var formattedDistance: String {
        String(format: "%.2f", distance)
    }
    
    /// Returns a string that nicely formats the duration between the two provided dates
    func formatDuration(startTime: Date, endTime: Date) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute, .second]
        return formatter.string(from: startTime, to: endTime)!
    }
}
