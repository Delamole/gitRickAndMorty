//
//  EpisodesTableViewCell.swift
//  RickAndMorty
//
//  Created by Владислав Бочаров on 17.02.2024.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell {

    @IBOutlet weak var urlOfEpisode: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
