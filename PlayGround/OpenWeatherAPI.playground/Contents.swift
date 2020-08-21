import UIKit

enum APIERROR : Error{
    case HASError
}

struct OpenWeather : Codable{
    
    let weather : [Weather]
    let base : String
    let main : Main
    let name : String
    
}

struct Main : Codable{
    let temp : Double
    let feels_like : Double
    let temp_min : Double
    let temp_max : Double
    let humidity : Double
}

struct Weather : Codable{
    
    let description : String
    
}

var OpenWeatherInfo : OpenWeather? {
    
    didSet{
        print(OpenWeatherInfo?.main.temp)
    }
    
}

let url = "http://api.openweathermap.org/data/2.5/weather?lat=37.647397&lon=126.928974&appid=b60295906c8a1dfb2ec7ed30423a5373"


func GetWeatherInfo(url : String ,handler : @escaping (Result<OpenWeather,APIERROR>) -> () ){
    
    print("Start")
    if let url = URL(string: url){
        print("Next Step")
        //url을 읽어야 하기 때문에 이렇게 해준다.
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            //data는 utf8으로 형성 되어 있다.
            guard let data = data else {
                handler(.failure(.HASError))
                return
            }
            
            // JSONDecoder로 풀어준다.
            let Decoder = JSONDecoder()
            
            do {
                //decode 내부에는 가장 위에있는 최 상단에 있는 클래스를 넣어주고 self를 붙여줘서 자신임을 알려주고 from에서 가져올 데이터를 넣어준다.
                let decodeResult = try Decoder.decode(OpenWeather.self, from: data)
                print("지역 이름 : \(decodeResult.name)")
                print("지역 온도 : \(decodeResult.main.temp)")
                print("체감 온도 : \(decodeResult.main.feels_like)")
                print("최고 온도 : \(decodeResult.main.temp_max)")
                print("최저 온도 : \(decodeResult.main.temp_min)")
                print("지역 습도 : \(decodeResult.main.humidity)")
                print("날씨 상태 : \(decodeResult.weather[0].description)")
                
                let WeatherInfo = decodeResult
                handler(.success(WeatherInfo))
               
            } catch {
                handler(.failure(.HASError))
                print("fail to Decode \(error.localizedDescription)")
            }
            
        }.resume()
        
    }
    else{
        handler(.failure(.HASError))
    }
}

GetWeatherInfo(url: url) { (result) in
    switch result {
    case .failure(let error):
        print(error)
    case .success(let weatherInfo):
        OpenWeatherInfo = weatherInfo
}
}
