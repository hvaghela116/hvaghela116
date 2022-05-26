//
//  SeasonListRouter.swift
//  Created by Hitesh Vaghela on 01/02/2021.

import UIKit

protocol SeasonListRouterProtocol: AnyObject {
    static func assembleModule() -> SeasonListViewController
    func routeToDetail()
}

protocol SeasonListDataPassing {
  var dataStore: SeasonListDataStore? { get }
}

class SeasonListRouter: NSObject, SeasonListRouterProtocol, SeasonListDataPassing {
    var dataStore: SeasonListDataStore?
    
    weak var viewController: SeasonListViewController?
    
    static func assembleModule() -> SeasonListViewController {
        let view = SeasonListViewController()
        let presenter = SeasonListPresenter(viewController: view)
        let router = SeasonListRouter()
        let interactor = SeasonListInteractor(presenter: presenter, worker: SeasonListWorker())

        // Connecting
        view.interactor = interactor
        view.router = router
        router.viewController = view
        router.dataStore = interactor
        return view
    }
    
    func routeToDetail() {
        let destinationVC = DetailRouter.assembleModule()
        if var destinationDS = destinationVC.router?.dataStore {
            guard let dataStore = dataStore else {
                return
            }
            passDataToDetail(source: dataStore, destination: &destinationDS)
            viewController?.navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
    
    func passDataToDetail(source: SeasonListDataStore, destination: inout DetailDataStore) {
        if let selectedSection = viewController?.tableView.indexPathForSelectedRow?.section {
            if let selectedRow = viewController?.tableView.indexPathForSelectedRow?.row {
                let episodes = source.season?.seasons[selectedSection].episodes
                let episode = episodes?[selectedRow]
                destination.episode = episode
            }
        }
    }
}
