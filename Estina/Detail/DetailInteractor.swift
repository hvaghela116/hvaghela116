//
//  DetailInteractor.swift
//  Created by Hitesh Vaghela on 03/02/2021.
import UIKit

protocol DetailInteractorProtocol {
    func fetchEpisode(request: Season.FetchEpisode.Request)
}

protocol DetailDataStore {
    var episode: Episode? { get set}
}

class DetailInteractor: DetailInteractorProtocol, DetailDataStore {
    var episode: Episode?
    private var presenter: DetailPresenterProtocol?

    init(presenter: DetailPresenterProtocol) {
        self.presenter = presenter
    }

    func fetchEpisode(request: Season.FetchEpisode.Request) {
        let response = Season.FetchEpisode.Response(episode: episode)
        presenter?.presenterEpisode(response: response)
    }
}
