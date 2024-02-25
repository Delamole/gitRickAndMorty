import Foundation

struct Result: Decodable {
    var info: Info
    var results: [Character]
}

struct Info: Decodable {
    var count: Int
    var pages: Int
    var next: String?
    var prev: String?
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


struct Episode: Decodable {
    var id: Int
    var name: String
    var air_date: String
}
