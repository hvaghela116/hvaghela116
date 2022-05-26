//
//  DetailPresenter.swift
//  Created by Hitesh Vaghela on 03/02/2021.

import UIKit

protocol DetailPresenterProtocol {
    func presenterEpisode(response: Season.FetchEpisode.Response)
}

class DetailPresenter: DetailPresenterProtocol {
    private weak var viewController: DetailViewControllerProtocol?
   
    init(viewController: DetailViewControllerProtocol) {
        self.viewController = viewController
    }

    func presenterEpisode(response: Season.FetchEpisode.Response) {
        let viewModel = Season.FetchEpisode.ViewModel(episode: response.episode)
        viewController?.displayEpisode(viewModel: viewModel)
    }
}
