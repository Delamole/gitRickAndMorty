//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Владислав Бочаров on 17.02.2024.
//

import UIKit

class CharacterViewController: UIViewController {

    @IBOutlet weak var episodesTable: UITableView!
    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var locationCharacter: UILabel!
    @IBOutlet weak var originCharacter: UILabel!
    @IBOutlet weak var speciesCharacter: UILabel!
    @IBOutlet weak var statusCharacter: UILabel!
    @IBOutlet weak var genderCharacter: UILabel!
    @IBOutlet weak var nameCharacter: UILabel!
    
    var character: Character? = nil
    var episodes: [String] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        nameCharacter.text = character?.name
        genderCharacter.text = character?.gender
        statusCharacter.text = character?.status
        speciesCharacter.text = character?.species
        locationCharacter.text = character?.location.name
        originCharacter.text = character?.origin.name
        episodes = character?.episode ?? [""]
        LoadModel.shared.loadImage(icon: character?.image ?? "") { (data) in
            self.imageCharacter.image = data
        }
        episodesTable.reloadData()
        // Do any additional setup after loading the view.
    }
    

}
extension CharacterViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodesTableViewCell") as! EpisodesTableViewCell
        
        cell.urlOfEpisode.text = episodes[indexPath.row]
        
        return cell
    }
}
