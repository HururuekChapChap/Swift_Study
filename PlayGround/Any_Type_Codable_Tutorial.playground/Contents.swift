import UIKit

struct ItemModel : Codable {
        
    let name : String?
    let url : String?
    let shop : String?
    let start_datetime : DynamicJsonProperty?
    let end_datetime : String?
    let price : Int?
    let image_list : [String]?

}

enum DynamicJsonProperty : Codable {
    
    case string(String)
    case int(Int)
    
    init(from decoder : Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        //Decode the property
        do {
            let stringValue = try container.decode(String.self)
            self = .string(stringValue)
        }
        catch DecodingError.typeMismatch{
            let intValue = try container.decode(Int.self)
            self = .int(intValue)
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let value):
            try container.encode(value)
        case .int(let value):
            try container.encode(value)
        }
    }
    
}

let jsonReq = """
{
                          "id": -1,
                          "type": "item",
                          "start_datetime": -1,
                          "name": "",
                          "shop": "cjmallplus",
                          "order": 12,
                          "url": "",
                          "image": "",
                          "price": 0,
                          "live": null
}
"""

func main(){

let data = jsonReq.data(using: .utf8)

do {
    let decode = try JSONDecoder().decode(ItemModel.self, from: data!)
    print(decode)
    
    switch decode.start_datetime {
        
    case .int(let value):
        print("Int Type : \(value)")
    case .string(let value):
        print("String Type : \(value)")
        
    default :
        break
    }
}
catch DecodingError.keyNotFound(let key, let context){
    print("could not find key \(key) in JSON: \(context.debugDescription)")
}
catch DecodingError.valueNotFound(let key, let context){
    print("could not find key \(key) in JSON: \(context.debugDescription)")
}
catch DecodingError.typeMismatch(let type, let context) {
    print("type mismatch for type \(type) in JSON: \(context.debugDescription)")
} catch DecodingError.dataCorrupted(let context) {
    print("data found to be corrupted in JSON: \(context.debugDescription)")
}
catch let jsonError{
    print(jsonError.localizedDescription)
}

}

main()
