//
//  ContentView.swift
//  Pathy
//
//  Created by Mason Drabik on 2/13/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        NavigationStack {
            if locationManager.hasLocationAccess == true {
                RouteListView()
            } else {
                RequestLocationAccessView()
            }
        }
        .environmentObject(locationManager)
    }
}

#Preview {
    ContentView()
}
