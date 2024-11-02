//
//  HeroWikiTests.swift
//  HeroWikiTests
//
//  Created by AudyDev on 2/11/24.
//

import XCTest
@testable import HeroWiki

final class HeroWikiTests: XCTestCase {
    var homeViewModel: HomeVM = HomeVM()
    var detailViewModel: DetailVM = DetailVM()
    
    func HomeViewModelTest() throws {
        Task{
            await homeViewModel.getHeroes(query: "SuperMan")
            XCTAssert(homeViewModel.superheroes?.response == "success")
            XCTAssert(homeViewModel.superheroes?.results.count == 1)
        }
    }
    
    func DetailViewModelTest() throws {
        Task{
            await detailViewModel.getHeroById(id: "1")
            XCTAssert(detailViewModel.superhero?.id == "1")
        }
    }
}
