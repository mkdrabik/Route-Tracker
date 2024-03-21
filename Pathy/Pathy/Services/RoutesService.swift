//
//  RoutesService.swift
//  Pathy
//
//  Created by Mason Drabik on 3/18/24.
//

import Foundation

struct RoutesService {
    static func fetchAllRoutes() async throws -> [Route] {
        // TODO: Make a GET request to https://learning.appteamcarolina.com/pathy/routes (see API docs in Notion)
        // - You should use URL, URLRequest, JSONDecoder, and URLSession
        
        let url = URL(string: "https://learning.appteamcarolina.com/pathy/routes")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        let(data, _) = try await URLSession.shared.data(for: request)
        let routes = try decoder.decode([Route].self, from: data)
        
        // TODO: Return the actual resulting array, not an empty one
        return routes
    }
    
        static func create(route newRoute: NewRoute) async throws {
        // TODO: Make a POST request to https://learning.appteamcarolina.com/pathy/routes (see API docs in Notion)
        // - You should use URL, URLRequest, JSONEncoder, JSONDecoder, and URLSession
        // - Remember to set the "Content-Type" header to "application/json" on the URLRequest
            
            let url = URL(string: "https://learning.appteamcarolina.com/pathy/routes")!
            let encoder = JSONEncoder()
            let decoder = JSONDecoder()
            encoder.dateEncodingStrategy = .iso8601
            decoder.dateDecodingStrategy = .iso8601
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            let bodyData = try encoder.encode(newRoute)
            request.httpBody = bodyData

            let (data, _) = try await URLSession.shared.data(for: request)
            _ = try decoder.decode(Route.self, from: data)
    }
    
    static func delete(route: Route) async throws {
        // TODO: Make a DELETE request to https://learning.appteamcarolina.com/pathy/routes/\(route_id) (see API docs in Notion)
        // - You should use URL, URLRequest, and URLSession
        // - This method will be very simple and few lines of code
        
        let url = URL(string: "https://learning.appteamcarolina.com/pathy/routes/\(route.id)")!
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        _ = try await URLSession.shared.data(for: request)
        
    }
}
