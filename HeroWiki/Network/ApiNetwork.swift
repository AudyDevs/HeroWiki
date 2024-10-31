//
//  ApiNetwork.swift
//  HeroWiki
//
//  Created by AudyDev on 31/10/24.
//

import Foundation

final class ApiNetwork{
    
    let urlBase = "https://www.superheroapi.com/api.php/540830a5636c0fd14fd2b11556a037f8/"
    
    func getHeroesByQuery(query:String) async throws -> Wrapper {
        guard let url = URL(string: "\(urlBase)search/\(query)") else {
            throw ErrorCases.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ErrorCases.invalidResponse
        }
        do {
            let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
            return wrapper
        } catch {
            throw ErrorCases.invalidData
        }
    }
    
}
