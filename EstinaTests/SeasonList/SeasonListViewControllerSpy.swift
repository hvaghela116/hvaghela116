//
//  SeasonListViewControllerSpy.swift
//  Copyright © 2022 Hitesh Vaghela. All rights reserved.
//

import XCTest
@testable import Estina

class SeasonListViewControllerSpy:XCTestCase {
    var sut: SeasonListViewController!
    var interactorSpy: SeasonListInteractorSpy!

    var displaySeasonListCalled = false
    var displaySeason: SeasonItem?

    override func setUp() {
        super.setUp()
        interactorSpy = SeasonListInteractorSpy()
        sut = SeasonListViewController()
        sut.interactor = interactorSpy
        sut.beginAppearanceTransition(true, animated: false)
        sut.endAppearanceTransition()
    }
    
    func testShouldFetchSeasonListWhenViewDidLoad() {
        // When
        sut.viewDidLoad()
        // Then
        XCTAssert(interactorSpy.fetchSeasonListCalled, "Should fetch SeasonList when view is loaded")
    }
    func testShouldDisplayFetchedMovies() {
        // Given
        let tableViewSpy = SeasonListTableViewSpy()
        sut.tableView = tableViewSpy
        // When
        sut.displaySeasonList(viewModel: Season.FetchList.ViewModel())
        // Then
        XCTAssert(tableViewSpy.reloadDataCalled, "Displaying fetched SeasonList should reload the table view")
    }
}

extension SeasonListViewControllerSpy: SeasonListViewControllerProtocol {
    func displaySeasonList(viewModel: Season.FetchList.ViewModel) {
        displaySeasonListCalled = true
        self.displaySeason = viewModel.season
    }
}

class SeasonListTableViewSpy: UITableView {
    var reloadDataCalled = false
    
    override func reloadData() {
         reloadDataCalled = true
    }
}
