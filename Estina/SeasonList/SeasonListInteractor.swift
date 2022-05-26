//
//  SeasonListInteractor.swift
//  Created by Hitesh Vaghela on 01/02/2021.
import UIKit

protocol SeasonListInteractorProtocol {
    func fetchSeasonList(request: Season.FetchList.Request)
}

protocol SeasonListDataStore {
    var season: SeasonItem? { get }
}

class SeasonListInteractor: SeasonListInteractorProtocol, SeasonListDataStore {
    var season: SeasonItem?
    var worker: SeasonListWorkerProtocol
    private var presenter: SeasonListPresenterProtocol?
    
    init(presenter: SeasonListPresenterProtocol, worker: SeasonListWorkerProtocol = SeasonListWorker()) {
        self.presenter = presenter
        self.worker = worker
    }

    func fetchSeasonList(request: Season.FetchList.Request) {
        worker.fetchSeasonList(data: request) { (season, error) in
            if error == nil {
                self.season = season
                let response = Season.FetchList.Response(season: season)
                self.presenter?.presentSeasonList(response: response)
            }
        }
    }
}
