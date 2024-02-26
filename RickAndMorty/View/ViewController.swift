import UIKit

class ViewController: UIViewController {

    var characters: [Character] = []
    var character: Character?
    private var charactersViewModel = CharacterViewModel()
    
    @IBOutlet weak var charactersTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        charactersViewModel.callService() { (data) in
            self.charactersTable.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return charactersViewModel.characterList?.count ?? 0
//          return charactersViewModel.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell") as! CharacterTableViewCell

        if(charactersViewModel.characterList?.count ?? 0 < charactersViewModel.count ?? 0) {
            if indexPath.row == (charactersViewModel.numberOrRows() ?? 0)-1{
                    charactersViewModel.callNextService() { (data) in
                        
                            self.charactersTable.reloadData()
                    }
                }
            }
        
        cell.initCell(item: self.charactersViewModel.characterList![indexPath.row])
   
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selected = charactersViewModel.getCharacter(index: indexPath.row)
          let newView: CharacterViewController = self.storyboard?.instantiateViewController(withIdentifier: "CharacterViewController") as! CharacterViewController
     
        newView.character = selected
        present(newView, animated: true, completion: nil)
               
    }
}

