//
//  ContentView.swift
//  Pathy
//
//  Created by Mason Drabik on 2/13/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    var body: some View {
        if locationManager.hasLocationAccess == true {
            SearchView(locationmanager: locationManager)
            if let location = locationManager.userLocation {
                Text("\(location.coordinate.latitude), \(location.coordinate.longitude)")
            }
        } else {
            RequestLocationAccessView(locationmanager: locationManager)
        }
    }
}

#Preview {
    ContentView()
}
