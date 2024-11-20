//
//  DetailViewModelTests.swift
//  HeroWikiTests
//
//  Created by AudyDev on 20/11/24.
//

import XCTest
@testable import HeroWiki

class DetailVMTests: XCTestCase {
    var detailViewModel: DetailVM!
    var idModel: String!
    
    override func setUpWithError() throws {
        detailViewModel = DetailVM()
        idModel = "1"
    }

    override func tearDownWithError() throws {
        detailViewModel = nil
        idModel = nil
    }

    func test_DetailViewModel_ShouldReturnACorrectSuperHeroModel() throws {
        Task{
            await detailViewModel.getHeroById(id: idModel)
            XCTAssert(detailViewModel.superhero?.id == idModel)
        }
    }
}
