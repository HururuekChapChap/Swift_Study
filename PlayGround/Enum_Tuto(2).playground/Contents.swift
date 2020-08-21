import UIKit

// 기본적인 Enum 활용
enum Company{
    
    case Apple
    case Samsung
    case Google
    case Naver
    
}

var koreaCompany = Company.Apple
koreaCompany

func changeEnumeration(_ element : inout Company){
    
    switch element {
  
    case .Apple:
        element = .Samsung
    case .Samsung:
        element = .Apple
    case .Google:
        element = .Naver
    case .Naver:
        element = .Google
    }
    

}

changeEnumeration(&koreaCompany)
koreaCompany

// enum 반복 사용

enum Developer : CaseIterable{

    case WEB, IOS, BIGDATA, ANDROID

}

let allCaseOFEnum = Developer.allCases.count
allCaseOFEnum

for singleCase in Developer.allCases{
    print(singleCase)
}

// 값 할당 하기
enum Language{
    case Programming(String)
    case Life(String)
}

var language = Language.Programming("IOS")

switch language {

case .Programming(let word):
    word
case .Life(let word):
    word
}

// RawValue

enum Friend : String{
    
    case Steven = "IOS Developer"
    case Ruel = "Singer"
    case Hachimula = "BasketBall Player"
    
    func BestFriend(){
        
        switch self {
        case .Steven:
            print("Steven IS Best Friend")
        default:
            print("That NONO")
        }
        
    }
}

let myFriend = Friend.Hachimula
myFriend.rawValue
myFriend.BestFriend()

//Generic - Duplicate 방지

func SwapTwoElement<Gerneric>(_ one : inout Gerneric , _ two : inout Gerneric ){
    
    let temp = one
    one = two
    two = temp
    
}

var one : Any = 10
var two : Any = 20

SwapTwoElement(&one, &two)

one
two

one = "Hururuek"
two = "ChapChap"

SwapTwoElement(&one, &two)

one
two

// Generic with Enum

enum Error<Success, Failure> {
    
    case success(Success)
    case connectionError(Failure)
    
    func printStatus(){
        
        switch self {
            
        case .success(let message):
            print(message)
        case .connectionError(let message):
            print(message)
        }
        
    }
    
}

func setNetwork(_ choice : Bool) -> Error<String,String>{
    
    if choice {
        return .success("통신 성공")
    }
    else{
        return .connectionError("연결 오류")
    }
    
}

setNetwork(false).printStatus()


