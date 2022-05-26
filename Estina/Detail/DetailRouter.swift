//
//  DetailRouter.swift
//  Created by Hitesh Vaghela on 03/02/2021.

import UIKit

protocol DetailRouterProtocol: AnyObject {
    static func assembleModule() -> DetailViewController
}

protocol DetailDataPassing {
    var dataStore: DetailDataStore? { get }    
}

class DetailRouter: NSObject, DetailRouterProtocol, DetailDataPassing {
    weak var viewController: DetailViewController?
    var dataStore: DetailDataStore?
    
    static func assembleModule() -> DetailViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(viewController: view)
        let router = DetailRouter()
        let interactor = DetailInteractor(presenter: presenter)
        
        // Connecting
        view.interactor = interactor
        view.router = router
        router.viewController = view
        router.dataStore = interactor
        return view
    }
}
