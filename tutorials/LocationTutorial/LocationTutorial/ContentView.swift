//
//  ContentView.swift
//  LocationTutorial
//
//  Created by Mason Drabik on 2/13/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager.shared

    var body: some View {
        Group {
            if locationManager.userLocation == nil {
                LocationRequestView()
            } else if let location = locationManager.userLocation {
                Text("\(location)")
                    .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
