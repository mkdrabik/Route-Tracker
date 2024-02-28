//
//  RouteInProgressMapView.swift
//  Pathy
//
//  Created by Mason Drabik on 2/27/24.
//

import MapKit
import SwiftUI

struct RouteInProgressMapView: View {
    let coordinates: [CLLocationCoordinate2D]

    var body: some View {
        Map {
            if !coordinates.isEmpty {
                MapPolyline(coordinates: coordinates)
                    .stroke(.blue, lineWidth: 4.0)
            }
        }
    }
}

#Preview {
    RouteInProgressMapView(coordinates: [])
}
