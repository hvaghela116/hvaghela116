//
//  SeasonListViewController.swift
//  Created by Hitesh Vaghela on 01/02/2021.


import UIKit

protocol SeasonListViewControllerProtocol: AnyObject {
    func displaySeasonList(viewModel: Season.FetchList.ViewModel)
}

class SeasonListViewController: UIViewController {
    var interactor: SeasonListInteractorProtocol?
    var router: (NSObjectProtocol & SeasonListRouterProtocol & SeasonListDataPassing)?

    @IBOutlet weak var tableView: UITableView!
    
    private var seasonItem: SeasonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName:SeasonListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier:SeasonListTableViewCell.identifier)
        interactor?.fetchSeasonList(request: Season.FetchList.Request())
    }
}

extension SeasonListViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        seasonItem?.seasons.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seasonItem?.seasons[section].episodes.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let episodes = seasonItem?.seasons[indexPath.section].episodes else { return UITableViewCell() }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SeasonListTableViewCell.identifier, for: indexPath) as? SeasonListTableViewCell else { fatalError() }
        cell.config(episode: episodes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToDetail()
    }
}

extension SeasonListViewController: SeasonListViewControllerProtocol {
    func displaySeasonList(viewModel: Season.FetchList.ViewModel) {
        seasonItem = viewModel.season
        title = seasonItem?.title
        tableView.reloadData()
    }
}
