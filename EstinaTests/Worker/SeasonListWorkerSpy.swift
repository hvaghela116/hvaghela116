//
//  SeasonListWorkerSpy.swift
//  EstinaTests
//
//  Created by Hitesh Vaghela on 22/05/22.
//  Copyright © 2022 Hitesh Vaghela. All rights reserved.
//

import XCTest
@testable import Estina

class SeasonListWorkerSpy: SeasonListWorkerProtocol {
    var fetchSeasonListCalled = false
    var season: SeasonItem?
    
    init(season: SeasonItem? = nil) {
        self.season = season
    }

    func fetchSeasonList(data: Season.FetchList.Request, completion: @escaping (SeasonItem?, Error?) -> Void) {
        fetchSeasonListCalled = true
        completion(season, nil)
    }    
}
