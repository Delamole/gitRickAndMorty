import Foundation
import UIKit

class CharacterViewModel  {
    
    var characterList: [Character]?

    func callService(completion: @escaping ([Character]) -> Void) {
        LoadModel.shared.loadCharacter { (response) in
            DispatchQueue.main.async {
                self.characterList=response.results
                completion(response.results)
            }
        }
        
    }

    func numberOrRows() -> Int {
        return self.characterList?.count ?? 0
    }

    func getCharacter(index: Int) -> Character? {
        return self.characterList?[index]
    }
}
