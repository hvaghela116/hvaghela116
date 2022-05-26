//
//  SeasonListPresenterSpy.swift
//  Copyright © 2022 Hitesh Vaghela. All rights reserved.
//

import XCTest
@testable import Estina

class SeasonListPresenterSpy: XCTestCase, SeasonListPresenterProtocol {
    var presentSeasonListCalled = false
    var season: SeasonItem?

    func presentSeasonList(response: Season.FetchList.Response) {
        presentSeasonListCalled = true
        self.season = response.season
    }
    
    func testDisplayFetchedMoviesCalledByPresenter() {
        // Given
        let viewControllerSpy = SeasonListViewControllerSpy()
        let sut = SeasonListPresenter(viewController: viewControllerSpy)
        // When
        sut.presentSeasonList(response: Season.FetchList.Response())
        // Then
        XCTAssert(viewControllerSpy.displaySeasonListCalled, "presentSeasonList() should ask the view controller to display them")
    }

}
