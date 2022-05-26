//
//  SeasonListPresenter.swift
//  Created by Hitesh Vaghela on 01/02/2021.

import UIKit

protocol SeasonListPresenterProtocol {
    func presentSeasonList(response: Season.FetchList.Response)
}

class SeasonListPresenter: SeasonListPresenterProtocol {
    private weak var viewController: SeasonListViewControllerProtocol?
    
    init(viewController: SeasonListViewControllerProtocol) {
        self.viewController = viewController
    }

    func presentSeasonList(response: Season.FetchList.Response) {
        let viewModel = Season.FetchList.ViewModel(season: response.season)
        viewController?.displaySeasonList(viewModel: viewModel)
    }
}
