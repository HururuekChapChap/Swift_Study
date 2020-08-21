import UIKit

enum APIERROR : Error{
    case HASError
}

struct InfoDetail : Codable {
    
    let infodetail : [InfoArray]
}

struct InfoArray : Codable{
    let id : Int
    let tel : String
    let info : String
    let latitude : String
    let longitude : String
    let avg : Double
    let cnt : Int
}

func getInfodetail(id : Int , handler : @escaping (Result<InfoDetail,APIERROR>)->()){
    
    let url : String = "http://project.mintpass.kr:3000/location/\(id)"
    print("Start")
    
    guard let realUrl = URL(string: url) else {
        print("realURL Fail")
        handler(.failure(.HASError))
        return
    }
    URLSession.shared.dataTask(with: realUrl) { (data, _, _) in
        
        guard let data = data else {
            print("data Fail")
            handler(.failure(.HASError))
            return
        }
        
        let decoder = JSONDecoder()
        print("data : \(data)")
        do {
            
            let decodeResult = try decoder.decode(InfoDetail.self, from: data)
            
            print(decodeResult.infodetail[0].info)
            
            
            
        } catch  {
            print(error.localizedDescription)
             handler(.failure(.HASError))
        }
        
    }.resume()
    
    
    
}

getInfodetail(id: 1) { result in
    
    switch result {
    case .failure(_):
        print("fail")
    case .success(let infos):
        print("yes")
    }
    
}
