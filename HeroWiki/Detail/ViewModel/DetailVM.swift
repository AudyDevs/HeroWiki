//
//  DetailVM.swift
//  HeroWiki
//
//  Created by AudyDev on 1/11/24.
//

import Foundation

@Observable
final class DetailVM {
    var superhero: SuperHero?
    var isLoading: Bool = false
    var showError: Bool = false
    var errorMessage: String = ""
    
    func getHeroById(id: String) async {
        self.isLoading = true
        do {
            self.superhero = try await ApiNetwork().getHeroesById(id: id)
            self.isLoading = false
        } catch (let error){
            self.isLoading = false
            self.showError = true
            self.errorMessage = error.localizedDescription
        }
    }
}
