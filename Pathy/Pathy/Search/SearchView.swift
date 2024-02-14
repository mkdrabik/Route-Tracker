//
//  SearchView.swift
//  Pathy
//
//  Created by Mason Drabik on 2/13/24.
//

import SwiftUI

struct SearchView<locationManager: LocationManager>: View {
    let locationmanager: locationManager

    var body: some View {
        Button {
            locationmanager.startFetchingCurrentLocation()
        } label: {
            Text("Start Fetching Current Location")
        }
        .padding()
    }
}
