import UIKit

func solution(_ a:Int, _ b:Int) -> String {
    
    //시작 요일 , 끝 일
    let 달력 : [Int : (String,Int)] = [1 : ("FRI",31), 2 :("MON",29), 3:("TUE",31) , 4:("FRI",30), 5:("SUN",31), 6:("WED",30), 7:("FRI",31), 8:("MON",31),9:("THU",30), 10:("SAT",31),11:("TUE",30),12:("THU",31) ]
    
    var 요일 : String = ""
    
    for index in 1...달력[a]!.1{
        
        요일 = next요일(요일, 기본: 달력[a]!.0)
        
        if index == b{
            break
        }
        
    }
    
    return 요일
}

func next요일(_ 요일 : String, 기본 : String) -> String{
    
    var retrunValue = ""
    switch 요일 {
    case "MON":
        retrunValue = "TUE"
    case "TUE":
        retrunValue = "WED"
    case "WED":
        retrunValue = "THU"
    case "THU":
        retrunValue = "FRI"
    case "FRI":
        retrunValue = "SAT"
    case "SAT":
        retrunValue = "SUN"
    case "SUN":
        retrunValue = "MON"
    default:
        retrunValue = 기본
    }
    
    return retrunValue
}

let a : Int = 5
let b : Int = 24

solution(a, b)
