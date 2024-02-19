import Foundation
import UIKit
import Alamofire
import AlamofireImage

var url_character = "https://rickandmortyapi.com/api/character"

class LoadModel: NSObject {
    
    static var shared = LoadModel()
    
    func loadCharacter(completion: @escaping (Result) -> Void){
        Loader().fetch(structData: Result.self, url: url_character, httpMethod: HttpMethod.get, parameters: nil, completion: { (address) in
            DispatchQueue.main.async {
                completion(address)
            }
            
        },
                       completionError: {
            (errorReq) in
            print("errorReq: \(errorReq)")
            
        })
    }
    
    func loadImage(icon: String, completion: @escaping (UIImage) -> Void){
    AF.request(icon).responseImage { response in
        debugPrint(response)
        print(response.request)
        print(response.response)
        debugPrint(response.result)

        if case .success(let image) = response.result {
            print("image downloaded: \(image)")
                    completion(image)
        }
    }
    }
}
