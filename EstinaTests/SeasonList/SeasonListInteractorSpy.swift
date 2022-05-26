//
//  SeasonListInteractorSpy.swift
//  Created by Hitesh Vaghela on 01/02/2021.
//

import XCTest
@testable import Estina

class SeasonListInteractorSpy: XCTestCase {
    var fetchSeasonListCalled = false
    
    func test_SeasonListInteractor_To_Worker() {
        // Given
        let seasonListPresenterSpy = SeasonListPresenterSpy()
        let seasonListWorkerSpy = SeasonListWorkerSpy()
        let sut = SeasonListInteractor(presenter:seasonListPresenterSpy, worker: seasonListWorkerSpy)
        // When
        sut.fetchSeasonList(request: Season.FetchList.Request())
        // Then
        XCTAssert(seasonListWorkerSpy.fetchSeasonListCalled, "fetchSeasonList() should ask the worker to fetch SeasonList")
    }
    
    func test_SeasonListInteractor_To_Presenter() {
        // Given
        let seasonListPresenterSpy = SeasonListPresenterSpy()
        let seasonListWorkerSpy = SeasonListWorkerSpy()
        let sut = SeasonListInteractor(presenter:seasonListPresenterSpy, worker: seasonListWorkerSpy)
        // When
        sut.fetchSeasonList(request: Season.FetchList.Request())
        // Then
        XCTAssert(seasonListPresenterSpy.presentSeasonListCalled, "presentSeasonList() should ask the presenter the SeasonList")
    }
}

extension SeasonListInteractorSpy: SeasonListInteractorProtocol {
    func fetchSeasonList(request: Season.FetchList.Request) {
        fetchSeasonListCalled = true
    }
}
