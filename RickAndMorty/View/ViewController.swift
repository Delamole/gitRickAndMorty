import UIKit

class ViewController: UIViewController {

    var characters: [Character] = []
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
          return charactersViewModel.numberOrRows()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell") as! CharacterTableViewCell

        cell.initCell(item: charactersViewModel.getCharacter(index: indexPath.row)!)
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selected = charactersViewModel.getCharacter(index: indexPath.row)
          let newView: CharacterViewController = self.storyboard?.instantiateViewController(withIdentifier: "CharacterViewController") as! CharacterViewController
     
        newView.character = selected
        present(newView, animated: true, completion: nil)
               
    }
}

