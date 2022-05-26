//
//  SeasonListTableViewCell.swift
//  Estina
//
//  Created by Hitesh Vaghela on 02/02/21.
//  Copyright © 2021 Hitesh Vaghela. All rights reserved.
//

import UIKit

class SeasonListTableViewCell: UITableViewCell {
    
    static let identifier = "SeasonListTableViewCell"
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var seasonNumber: UILabel!
    @IBOutlet weak var episodeNumber: UILabel!
    @IBOutlet weak var episodeName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(episode: Episode) {
        posterImageView.loadImageAsync(with: episode.Poster)
        seasonNumber.text = episode.Season
        episodeNumber.text = episode.Episode
        episodeName.text = episode.Title
    }
}
