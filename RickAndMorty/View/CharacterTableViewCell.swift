import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    var charactersViewModel = CharacterViewModel()

    @IBOutlet weak var imageCharacter: UIImageView!
    
    @IBOutlet weak var genderCharacter: UILabel!
    @IBOutlet weak var nameCharacter: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initCell(item: Character) {
        nameCharacter.text = item.name
        genderCharacter.text = item.gender
//        LoadModel.shared.loadImage(icon: item.image) { (data) in
//            self.imageCharacter.image = data
//        }
        charactersViewModel.loadCharacterImage(icon: item.image,image: imageCharacter)
      }
}
