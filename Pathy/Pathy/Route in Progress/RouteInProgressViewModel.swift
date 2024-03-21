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
    @Published var routes: [CLLocation] = []
    
    @Published var routeType: RouteType = .run
    @Published var loadingState: RouteInProgressLoadingState = .idle
    
    var startTime: Date = .init()
    var endTime: Date = .init()
    
    /// Update the current route with a new location
    func addLocationToRoute(location: CLLocation) {
        routes.append(location)
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
        for location in routes {
            coords.append(location.coordinate)
        }
        return coords
    }
    
    /// The distance of the route so far, in miles
    var distance: Double {
        guard var previousLocation = routes.first else { return 0 }
        var distanceMeters: Double = 0
        
        for location in routes {
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

    func saveRoute(startTime: Date, endTime: Date) async {
        // TODO: Update loading state
        // TODO: Use map to convert locations to be of type [RoutePoint]
        // TODO: Instantiate a NewRoute using the local and instance variables
        // - You should use your name for userName
        do {
            // TODO: Call service method
            loadingState = .loading
            var routePoints: [RoutePoint] = []
            for location in routes{
                let rp = RoutePoint(latitude: location.coordinate.latitude, longitude: location.coordinate.latitude, timestamp: location.timestamp)
                routePoints.append(rp)
            }
            let newRoute = NewRoute(userName: "Mason Drabik", distance: distance, startTime: startTime, endTime: endTime, type: routeType, routePoints: routePoints)
            try await RoutesService.create(route: newRoute)
        } catch {
            // TODO: Handle the error appropriately
            fatalError(String(describing: error))
        }
    }
}
