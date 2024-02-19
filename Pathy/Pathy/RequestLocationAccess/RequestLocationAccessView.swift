//
//  RequestLocationAccessView.swift
//  Pathy
//
//  Created by Mason Drabik on 2/13/24.
//

import SwiftUI

struct RequestLocationAccessView: View {
    let locationManager: LocationManager

    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()

            VStack {
                Image(systemName: "paperplane.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color(.systemBlue))
                Text("We will use your location to display resturants near you.")
                    .font(.system(size: 17, weight: .regular))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .padding(5)
                Button {
                    locationManager.requestLocationAccess()
                } label: {
                    Text("Allow Access")
                        .font(.system(size: 17, weight: .regular))
                }
            }
        }
    }
}
