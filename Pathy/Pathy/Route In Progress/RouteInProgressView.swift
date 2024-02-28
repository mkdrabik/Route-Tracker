//
//  SearchView.swift
//  Pathy
//
//  Created by Mason Drabik on 2/13/24.
//

import SwiftUI

struct RouteInProgressView: View {
    @StateObject private var vm = RouteInProgressViewModel()
    @ObservedObject var locationManager: LocationManager

    var body: some View {
        ZStack(alignment: .bottom) {
            RouteInProgressMapView(coordinates: vm.coordinates)
                .ignoresSafeArea()

            RouteInProgressCardView(vm: vm, startStopSaveAction: startStopSaveAction)
                .padding(.top, 10)
                .padding(.leading, 16)
                .padding(.trailing, 16)
                .padding(.bottom, 10)
        }
        .onChange(of: locationManager.userLocation, initial: true) { _, _ in
            withAnimation(.bouncy) {
                if let lm = locationManager.userLocation {
                    vm.addLocationToRoute(location: lm)
                }
            }
        }
    }

    private func startStopSaveAction() {
        withAnimation(.bouncy) {
            switch vm.routeState {
            case .notStarted:
                // Start location updates and start collecting a route
                locationManager.startFetchingCurrentLocation()
                vm.startCollectingRoute()
                if let location = locationManager.userLocation {
                    vm.addLocationToRoute(location: location)
                }

            case .inProgress(let startTime):
                // Start location updates and stop collecting the route
                locationManager.stopFetchingCurrentLocation()
                vm.startCollectingRoute()
                if let date = locationManager.userLocation {
                    vm.stopCollectingRoute(routeStartTime: startTime)
                }

            case .ended:
                // In a future stage, save route to the server
                break
            }
        }
    }
}

#Preview {
    RouteInProgressView(locationManager: .init())
}
