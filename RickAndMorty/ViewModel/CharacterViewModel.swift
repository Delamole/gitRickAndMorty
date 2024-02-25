import Foundation
import UIKit

class CharacterViewModel  {
    
    var loadModel = LoadModel()
    
    var characterList: [Character]?
    var episodes: [Episode]?
    var nextPageUrl=url_character
    var count: Int?
    var image: UIImage?

    func callService(completion: @escaping ([Character]) -> Void) {
        loadModel.loadCharacter { (response) in
            DispatchQueue.main.async {
                self.characterList=response.results
                self.nextPageUrl = response.info.next ?? ""
                self.count = response.info.count
                completion(response.results)
            }
        }
    }
    
    func callNextService(completion: @escaping ([Character]) -> Void) {
        loadModel.loadNextCharacter(url: nextPageUrl) { (response) in
                DispatchQueue.main.async {
                    self.characterList?.append(contentsOf: response.results)
                    self.nextPageUrl = response.info.next ?? ""
                    self.count = response.info.count
                    completion(response.results)
                }
        }
    }
    
    func loadCharacterImage(icon: String, image: UIImageView) {
        loadModel.loadImage(icon: icon) { data in
            image.image = data
        }
    }
    
    func callEpisode(url: String, completion: @escaping (Episode) -> Void) {
        loadModel.loadEpisode(url: url) { (response) in
            DispatchQueue.main.async {
                completion(response)
            }
        }
    }

    func numberOrRows() -> Int? {
        return self.characterList?.count ?? 0
    }

    func getCharacter(index: Int) -> Character? {
        return self.characterList?[index]
    }
}
