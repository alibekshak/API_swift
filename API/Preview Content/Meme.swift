import Moya
import Foundation

enum Meme {
    case getMeme(name: String, topText: String, bottomText: String)
}

extension Meme: TargetType {
    var baseURL: URL {
        URL(string: "https://www.apimeme.com/")!
    }
    
    var path: String {
        "meme"
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getMeme(let name, let topText, let bottomText):
            let parameters: [String: String] = [
                "meme": name,
                "top": topText,
                "bottom": bottomText
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        ["Accept": "application/json"]
    }
}
