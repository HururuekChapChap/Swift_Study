import UIKit

//URL
let urlString = "https://search.naver.com/search.naver?sm=top_hty&fbm=1&ie=utf8&query=안녕"
let url = URL(string: urlString)

func check_url(url : URL?){
    
    guard let url = url else {return }
    
    
    url.absoluteString
    url.scheme
    url.host
    url.path
    url.query
    url.baseURL

    
}

check_url(url: url)

//URLComponets

var urlComponents = URLComponents(string: "https://search.naver.com/search.naver?")
let smQuery = URLQueryItem(name: "sm", value: "top_hty")
let fbmQuery = URLQueryItem(name: "fbm", value: "1")
let ieQuery = URLQueryItem(name: "ie", value: "utf8")
let Query = URLQueryItem(name: "query", value: "안녕")

urlComponents?.queryItems?.append(smQuery)
urlComponents?.queryItems?.append(fbmQuery)
urlComponents?.queryItems?.append(ieQuery)
urlComponents?.queryItems?.append(Query)

urlComponents?.url
urlComponents?.string
urlComponents?.queryItems
urlComponents?.queryItems?.last
urlComponents?.queryItems?.removeAll()
urlComponents

//URLComponents with Dictionary

var urlComponent = URLComponents(string: "https://itunes.apple.com/search?")
let urlDictionary : [String : String] = ["media":"music", "entity" : "song" , "term" : "시작"]

urlComponent?.queryItems = urlDictionary.map({ (key, value) -> URLQueryItem in
    return URLQueryItem(name: key, value: value)
})

let requestUrl = urlComponent?.url

// Session DataTask

struct Response : Codable {
    let resultCount : Int
    let tracks : [Track]
    
    //CodingKey 프로토콜로 데이터 변수를 동일하게 매칭시켜준다.
    enum CodingKeys : String, CodingKey {
        case resultCount = "resultCount"
        case tracks = "results"
    }
    
}

struct Track : Codable {
    let songName : String
    let artistName : String
    let trackPic : String
    
    enum CodingKeys : String, CodingKey {
        case songName = "trackName"
        case artistName = "artistName"
        case trackPic = "artworkUrl30"
    }
    
    
}

let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

session.dataTask(with: requestUrl!) { (data, res, err) in
    
    //에러 존재 여부 판단
    guard err == nil else {return}
    
    //상태코드 확인
    guard let statusCode = (res as? HTTPURLResponse)?.statusCode else {return}
    
    let successRange = 200..<300
    //상태코드가 2xx 이라면 안전하게 패스
    guard successRange.contains(statusCode) else {
        //handle response error
        return
        
    }
    
    //통신 get으로 받아온 데이터 확인
    guard let resultData = data else {return}
    
    do{
        //데이터를 JSON decoder로 Response 구조체의 형식으로 해독
        let response = try JSONDecoder().decode(Response.self , from: resultData)
        print(response.tracks.count)
        
        for item in response.tracks{
            print(item)
        }
        
    }
    catch let error {
        print("---> error : \(error.localizedDescription)")
    }
    
//    let resultString = String(data: resultData, encoding: .utf8)
//
//    print("-->  result : \(resultString)")
    
}.resume()



