import UIKit

enum APIError : Error {
    case GotError
}

struct ImageInfos : Codable{
    
    let imginfo : [ImageList]
}

struct ImageList : Codable {
    let id : Int
    let url : String
}

func getInfodetail(id : Int , handler : @escaping (Result<[ImageList],APIError>)->()){
    
    let url : String = "http://img.mintpass.kr/api/\(id)"
    
    guard let realUrl = URL(string: url) else {
        print("realURL Fail")
        handler(.failure(.GotError))
        return
    }
    URLSession.shared.dataTask(with: realUrl) { (data, _, _) in
        
        guard let data = data else {
            handler(.failure(.GotError))
            return
        }
        
        let decoder = JSONDecoder()
        
        do {
            
            let decodeResult = try decoder.decode(ImageInfos.self, from: data)
            
            print(decodeResult)
            
            handler(.success(decodeResult.imginfo))
            
            
        } catch  {
            print(error.localizedDescription)
            handler(.failure(.GotError))
        }
        
    }.resume()
    
}

getInfodetail(id: 1) { (result) in
    switch result {
    case .success(let infoArray):
        print(infoArray.count)
     case .failure(_):
         print("got Error from infoDetail")
     
    }
    
}
