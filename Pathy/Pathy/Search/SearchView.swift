//
//  SearchView.swift
//  Pathy
//
//  Created by Mason Drabik on 2/13/24.
//

import SwiftUI

struct SearchView: View {
    let locationManager: LocationManager

    var body: some View {
        Button {
            locationManager.startFetchingCurrentLocation()
        } label: {
            Text("Start Fetching Current Location")
        }
        .padding()
    }
}
