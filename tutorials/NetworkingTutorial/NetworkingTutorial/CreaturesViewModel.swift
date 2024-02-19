//
//  CreaturesViewModel.swift
//  NetworkingTutorial
//
//  Created by Mason Drabik on 2/18/24.
//

import Foundation

class CreaturesViewModel: ObservableObject {
    private struct Returned: Codable {
        var count: Int
        var next: String?
        var results: [Result]
    }
    
    struct Result: Codable, Hashable {
        var name: String
        var url: String
    }
    
    @Published var creaturesArray: [Result] = []
    @Published var urlString = "https://pokeapi.co/api/v2/pokemon/"
    @Published var count = 0
    
    func getData() async {
        print("We are accessing the url \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("Error could not create URL from \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print("JSON error: could not decode returned JSON data\(urlString)")
                return
            }
            count = returned.count
            urlString = returned.next ?? ""
            creaturesArray = returned.results
            
        } catch {
            print("Error could not get data from \(urlString)")
        }
    }
}
