import UIKit

struct SendSelectList : Codable{
    
    let id : Int
    let userid : String
    
}

struct Message : Codable{
    let message : String
}


//post 방식으로 받을 웹서버 주소를 적어준다.
let url = URL(string: "http://project.mintpass.kr:3000/list")

if let url = url {
    
    //이렇게 url 주소를 URLRequest를 통해서 해독해준다.
    var request = URLRequest(url: url)
    //httpMethod를 post 방식으로 보내주도록 하고
    request.httpMethod = "POST"
    //이건 먼지 모르겠지만 기본으로 셋팅해주는 것 같다.
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("application/json", forHTTPHeaderField: "Accept-Type")
    //해독과 암호화 해주는 Codable을 객체를 생성해준다.
    let Encoder = JSONEncoder()
    let Decoder = JSONDecoder()
    //요렇게 데이터를 인코딩 해주고
    let TempEncoder = SendSelectList(id: 5, userid: "1346053050")
    //Json 데이터가 잘 출력되는지 보내주고
    Encoder.outputFormatting = .prettyPrinted

    do {
        //내가 보낼려고 하는 데이터를 인코딩 해주고
        let jsonData = try Encoder.encode(TempEncoder)
        
        print(jsonData)
        //httpBody를 통해서 데이터화 시켜준다.
        request.httpBody = jsonData
        
        //그리고 나서 with url이 아니라 request로 데이터를 전송해주고
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error{
                print("Error took place \(error)")
            }
            
            //오류없이 데이터를 받았다면 아래와 같이 다시 해독해주고 반응을 살핀다.
            if let data = data, let jsonString = String(data: jsonData, encoding: .utf8){
                print(data)
                do {
                    let myjson = try Decoder.decode(Message.self, from: data)
                    print(myjson.message)
               } catch  {
                    print("\(error.localizedDescription)")
                }
              print(jsonString)
            }
        }.resume()
        
    }
catch{
    print("\(error.localizedDescription)")
}

}
