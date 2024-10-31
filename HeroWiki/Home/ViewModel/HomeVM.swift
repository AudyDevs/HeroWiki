//
//  HomeVM.swift
//  HeroWiki
//
//  Created by AudyDev on 31/10/24.
//

import Foundation

@Observable
final class HomeVM {
    var superheroes: Wrapper?
    var isLoading: Bool = false
    var showError: Bool = false
    var errorMessage: String = ""
    
    func getHeroes(query: String) async {
        self.isLoading = true
        do {
            self.superheroes = try await ApiNetwork().getHeroesByQuery(query: query)
            self.isLoading = false
        } catch (let error) {
            self.isLoading = false
            self.showError = true
            self.errorMessage = error.localizedDescription
        }
    }
}
