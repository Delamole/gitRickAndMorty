import Foundation

struct Result: Decodable {
    var results: [Character]
}

struct Character: Decodable {
    var id: Int
    var name: String
    var status: String
    var gender: String
    var image: String
    var species: String
    var type: String
    var location: Location
    var episode: [String]
    var origin: Origin
}

struct Location: Decodable {
    var name: String
}

struct Origin: Decodable {
    var name: String
}
