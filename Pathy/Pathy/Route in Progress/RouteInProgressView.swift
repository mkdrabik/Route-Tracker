//
//  SearchView.swift
//  Pathy
//
//  Created by Mason Drabik on 2/13/24.
//

import SwiftUI

struct RouteInProgressView: View {
    @StateObject private var vm = RouteInProgressViewModel()
    @EnvironmentObject var locationManager: LocationManager
<<<<<<< HEAD
    @Environment(\.dismiss) private var dismiss
=======
>>>>>>> 2e3bf9b055d4279da6f88b65f076c58a5db72d33

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
<<<<<<< HEAD
        }.overlay(alignment: .center) {
            RouteInProgressLoadingStateView(state: vm.loadingState)
        }
        .overlay(alignment: .topLeading) {
            Menu {
                Picker("Route Type", selection: $vm.routeType) {
                    ForEach(RouteType.allCases, id: \.rawValue) { type in
                        Label(type.rawValue.capitalized, systemImage: type.systemImageName)
                            .tag(type)
                    }
                }
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: vm.routeType.systemImageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)

                    Image(systemName: "chevron.down")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 8, height: 8)
                }
                .padding(10)
                .background(.ultraThickMaterial, in: .rect(cornerRadius: 8))
            }
            .padding(.leading, 16)
        }
        .overlay(alignment: .topTrailing) {
            Button {
                cancel()
                dismiss()
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .fontWeight(.semibold)
                    .padding(12)
                    .background(.ultraThickMaterial, in: .circle)
            }
            .padding(.trailing, 16)
=======
>>>>>>> 2e3bf9b055d4279da6f88b65f076c58a5db72d33
        }
        .environmentObject(locationManager)
    }

<<<<<<< HEAD
    func cancel() {
        // TODO: Tell location manager to stop location updates
        // TODO: Call dismiss from the enviroment (you'll need to add that at the very top of this struct)
        locationManager.stopFetchingCurrentLocation()
    }

=======
>>>>>>> 2e3bf9b055d4279da6f88b65f076c58a5db72d33
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
                if locationManager.userLocation != nil {
                    vm.stopCollectingRoute(routeStartTime: startTime)
                }
<<<<<<< HEAD
            case .ended(let startTime, let endTime):
                Task {
                    // TODO: Call vm.saveRoute
                    await vm.saveRoute(startTime: startTime, endTime: endTime)
                    if case .success = vm.loadingState {
                        // TODO: Call dismiss from the environment if request was successful
                        dismiss()
                    }
                }
=======

            case .ended:
                // In a future stage, save route to the server
                break
>>>>>>> 2e3bf9b055d4279da6f88b65f076c58a5db72d33
            }
        }
    }
}

#Preview {
    RouteInProgressView().environmentObject(LocationManager())
}
