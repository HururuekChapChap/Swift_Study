import UIKit

// 참고 자료 :  https://learnappmaking.com/codable-json-swift-how-to/
// 동영상 강의 : https://www.youtube.com/watch?v=Oj-2s0ALACE


//이렇게 내부에 내부를 타는 식으로 만들어줘야한다.
struct getSource : Codable {
    
    let News : String
    //이름이 다르게 설정 했을 경우 이렇게 COdingKey를 통하여 이름을 지정해 줄 수 있다.
    private enum CodingKeys : String, CodingKey{
        case News = "name"
    }
    
}

class getNews : Codable{
    
    let title : String
    let description : String
    //이렇게 내부를 타는 식으로
    let source : getSource
    
    init(title: String, description : String, source : getSource) {
        self.title = title
        self.description = description
        self.source = source
    }
    
}

class getNewsArticles : Codable{
 
    let totalResults : Int
    //배열 형태면 배열로
    let articles : [getNews]
    
    init(totalResults : Int, articles : [getNews] ){
        self.totalResults = totalResults
        self.articles = articles
    }
    
}

let url = "http://newsapi.org/v2/top-headlines?country=us&apiKey=c46ef587d0bb4f20b41fa6c558a38f3f"

//url을 읽어야 하기 때문에 이렇게 해준다.
URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
    //data는 utf8으로 형성 되어 있다.
    print(data!)
    // JSONDecoder로 풀어준다.
    let NewsDecoder = JSONDecoder()
    
    do {
        //decode 내부에는 가장 위에있는 최 상단에 있는 클래스를 넣어주고 self를 붙여줘서 자신임을 알려주고 from에서 가져올 데이터를 넣어준다.
        let NewsResult = try NewsDecoder.decode(getNewsArticles.self, from: data!)
        print(NewsResult.totalResults)
        print(NewsResult.articles[0].title)
        print(NewsResult.articles[1].description)
        print(NewsResult.articles[1].source.News)
    } catch {
        print("fail to Decode \(error.localizedDescription)")
    }
    
}.resume()


/*
 Json으로 인코딩!
 */

//이렇게 객체형태로 지정을 해주고
let Mynews = getNews(title: "HELLO", description: "안녕", source: getSource(News: "태수 today"))
//인코더 객체를 실행시켜준다.
let jsonEncode = JSONEncoder()
//예쁘게 보이게 해주고
jsonEncode.outputFormatting = .prettyPrinted

do {
    //jsonEncode로 Mynews 객체를 이코딩 해준다.
    let jsonData = try jsonEncode.encode(Mynews)
    
    //그리고 데이터 형식으로 된 jsonString을 보여준다.
    if let jsonString = String(data: jsonData, encoding: .utf8){
        print(jsonString)
    }
    
} catch  {
    print("error with \(error.localizedDescription)")
}


let TaeSOONews = getNewsArticles(totalResults: 1, articles: [Mynews])

let jsonEncoding = JSONEncoder()

jsonEncoding.outputFormatting = .prettyPrinted

do {
    let jsonData = try jsonEncoding.encode(TaeSOONews)
    
    if let jsonString = String(data: jsonData , encoding: .utf8){
        
        print(jsonString)
    }
    
    
} catch  {
    print("error with \(error.localizedDescription)")
}



//my nodeJS Json Test 성공

struct Test : Codable {
    
    let title : String
    
    init(title : String){
        self.title = title
    }
    
}

let testurl = "http://localhost:3000/Json"

URLSession.shared.dataTask(with: URL(string:testurl)!) { (data, response, error) in
    
    let JsonDecoder = JSONDecoder()
    
    do {
        let myjson = try JsonDecoder.decode(Test.self, from: data!)
        
        print(myjson.title)
    } catch  {
        print("\(error.localizedDescription)")
    }
    
}.resume()


