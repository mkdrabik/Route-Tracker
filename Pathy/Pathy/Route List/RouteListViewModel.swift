//
//  RouteListViewModel.swift
//  Pathy
//
//  Created by Mason Drabik on 3/18/24.
//

import Foundation

enum RouteListLoadingState {
    case idle
    case loading
    case success(routes: [Route])
    case error(message: String)
}

@MainActor
class RouteListViewModel: ObservableObject {
    @Published var state: RouteListLoadingState = .idle

    func fetchAllRoutes() async {
        do {
            // TODO: Set state to loading
            // TODO: Make a request to RoutesService.fetchAllRoutes()
            // TODO: Sort resulting array based on startTime (descending/newest first)
            // TODO: Update state to success
            
            state = .loading
            let routes = try await RoutesService.fetchAllRoutes()
            let sortedRoutes = routes.sorted(by: {
                $0.startTime.compare($1.startTime) == .orderedDescending
            })
            state = .success(routes: sortedRoutes)
        } catch {
            // TODO: Handle the error
            fatalError(String(describing: error))
        }
    }

    func delete(route: Route) async {
        do {
            // TODO: Set state to loading
            // TODO: Make a request to RoutesService.delete(route:)
            // TODO: Call self.fetchAllRoutes() to get the most recent list (post deletion)
            
            state = .loading
            try await RoutesService.delete(route: route)
            await fetchAllRoutes()
        } catch {
            // TODO: Handle the error
            fatalError(String(describing: error))
        }
    }
}
