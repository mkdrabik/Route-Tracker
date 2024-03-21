//
//  RouteListViewItem.swift
//  Pathy
//
//  Created by Mason Drabik on 3/18/24.
//

import SwiftUI

struct RouteListItemView: View {
    let route: Route
    
    var body: some View {
        // TODO: Change the ZStack to the correct HStacks and VStacks to arrange these view
        // TODO: Apply modifiers to these views to correctly style them
        VStack{
            RouteInProgressMapView(coordinates: route.coordinates)
            .allowsHitTesting(false)
            .frame(height: 180)
            .cornerRadius(8)
            HStack{
                Image(systemName: route.type.systemImageName)
                    .background(.regularMaterial, in: .circle)
                    .frame(width: 48, height: 48)
                VStack{
                    HStack{
                        Text(route.userName)
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                        Spacer()
                        Text("\(route.formattedDistance) mi")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                    }
                    HStack{
                        Text(route.formattedDate)
                            .font(.callout)
                            .fontWeight(.regular)
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(route.formattedDuration)
                            .font(.callout)
                            .fontWeight(.regular)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}

#Preview {
    List {
        // TODO: Uncomment this to use Previews
         RouteListItemView(route: .walkExample)
    }
}

