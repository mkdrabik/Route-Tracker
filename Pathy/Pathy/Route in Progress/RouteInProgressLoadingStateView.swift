//
//  RouteInProgressLoadingStateView.swift
//  Pathy
//
//  Created by Mason Drabik on 3/18/24.
//

import SwiftUI

enum RouteInProgressLoadingState {
    case idle
    case loading
    case success
    case error(message: String)
}

struct RouteInProgressLoadingStateView: View {
    let state: RouteInProgressLoadingState
 
    var body: some View {
        switch state {
        case .idle:
            EmptyView()
        case .loading:
            buildOverlay { ProgressView() }
        case .success:
            buildOverlay(systemImage: "checkmark")
        case .error(let message):
            buildOverlay(message, systemImage: "xmark")
        }
    }
 
    private func buildOverlay(_ title: String? = nil, systemImage: String) -> some View {
        buildOverlay {
            VStack(spacing: 16) {
                Image(systemName: systemImage)
                    .font(.title)
 
                if let title {
                    Text(title)
                        .fontWeight(.semibold)
                }
            }
        }
    }
 
    private func buildOverlay<Content: View>(content: () -> Content) -> some View {
        content()
            .padding(16)
            .background(Color(uiColor: .secondarySystemBackground), in: .rect(cornerRadius: 12))
    }
}
 
#Preview {
    Group {
        RouteInProgressLoadingStateView(state: .idle)
        RouteInProgressLoadingStateView(state: .loading)
        RouteInProgressLoadingStateView(state: .success)
        RouteInProgressLoadingStateView(state: .error(message: "An error has occurred"))
    }
}
