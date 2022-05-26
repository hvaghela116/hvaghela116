//
//  SeasonListWorker.swift
//  Estina
//
//  Created by Hitesh Vaghela on 01/02/21.
//  Copyright © 2021 Hitesh Vaghela. All rights reserved.
//


import Foundation

protocol SeasonListWorkerProtocol: AnyObject {
    func fetchSeasonList(data : Season.FetchList.Request, completion: @escaping (SeasonItem?, Error?) -> Void)
}

class SeasonListWorker: SeasonListWorkerProtocol {
    func fetchSeasonList(data: Season.FetchList.Request, completion: @escaping (SeasonItem?, Error?) -> Void) {
        let season = parseJSON("hbo-silicon-valley")
        completion(season, nil)
    }
    
    private func parseJSON(_ fileName: String) -> SeasonItem?  {
        guard let url = Bundle.main.url(forResource:"hbo-silicon-valley", withExtension: "json") else {return nil}
        guard let jsonData = try? Data(contentsOf: url) else {return nil}
        return try? JSONDecoder().decode(SeasonItem.self, from: jsonData)
    }
}
