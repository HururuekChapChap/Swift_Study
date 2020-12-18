import UIKit
import Foundation

func DateType2String() -> String{
    let current = Date()
    
    let formatter = DateFormatter()
    //한국 시간으로 표시
    formatter.locale = Locale(identifier: "ko_kr")
    formatter.timeZone = TimeZone(abbreviation: "KST")
    //형태 변환
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    return formatter.string(from: current)
}

//HH -> 13시 이렇게 24시 형태로 나오고
//hh -> 1시 이렇게 12시 형태로 나온다

DateType2String()

func String2DateType(string : String) -> Date?{
    let formatter = DateFormatter()
    
    formatter.dateFormat = "yyyy-MM-dd"
    
    return formatter.date(from: string)
}

String2DateType(string: "2020-01-02")

func oneHourPlus() -> String{
    
    let now = Date()
    let oneHourLater = now.addingTimeInterval(+3600)
    //TimeInterval은 초를 의미한다.
    //60 - 1분
    //3600 - 1시간
    //86400 - 24시간 하루
    let formatter = DateFormatter()
    
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    print("현재시간 : \(formatter.string(from: now))")
    
    return formatter.string(from: oneHourLater)
}

print(oneHourPlus())

func makeAMPM() -> String{
    
    let now = Date()
    
    let formatter = DateFormatter()
    //한국 시간으로 표시
    formatter.locale = Locale(identifier: "ko_kr")
    formatter.timeZone = TimeZone(abbreviation: "KST")
    //형태 변환
    formatter.dateFormat = "a hh:mm:ss"
    formatter.amSymbol = "오전"
    formatter.pmSymbol = "오후"
    
    return formatter.string(from: now)
    
}

makeAMPM()

func useCalendar(){
    
    let date = Date()
    let calendar = Calendar.current
    
    let component = calendar.dateComponents([.hour, .minute, .second], from: date)
    
    print(component)
    
}

useCalendar()

func oneHourAfterUseCalendar(){
    
    let date = Date()
    let calendar = Calendar.current
    
    let componet = calendar.date(byAdding: .hour, value: +1, to: date)
    
    print(String(describing: componet))
}

oneHourAfterUseCalendar()

func getDiffTwoDays(){
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let startDate = dateFormatter.date(from:"2018-03-01")
    let endDate = dateFormatter.date(from:"2018-05-15")
    
    let calendar = Calendar.current
    let dateGap = calendar.dateComponents([.year,.month,.day,.hour], from: startDate!, to: endDate!)
    
//    if case let (y?, m? , d?, h?) = (dateGap.year , dateGap.month, dateGap.day, dateGap.hour) {
//        print("\(y)년 \(m)개월 \(d)일 \(h)시간 후")
//    }
    
    let test = calendar.date(from: dateGap)!
    print(test)
    
}

getDiffTwoDays()
