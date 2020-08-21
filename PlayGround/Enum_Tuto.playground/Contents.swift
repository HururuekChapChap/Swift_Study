import UIKit

//https://shark-sea.kr/entry/Swift-Enum-알아보기-응용편?category=784184

enum Studnet : String{
    case elementary = "초등학생 입니다"
    case middle = "중학생 입니다"
    case high
    case university
    
    func printCase(){
        
        switch  self {
        case .elementary :
            print("printCase - 초딩")
        case .middle :
            print("printCase - 중딩")
        case .high :
            print("printCase - 고딩")
        case .university :
            print("printCase - 대딩")
        }
        
    }
}

let student = Studnet.high
print(student.rawValue)

student.printCase()

switch  student {
case .elementary :
    print("초딩")
case .middle :
    print("중딩")
case .high :
    print("고딩")
case .university :
    print("대딩")
}


func swapTwoElement<anyTemplate>(_ a : inout anyTemplate, _ b : inout anyTemplate ){
    let temp = a
    a = b
    b = temp
    
    print(a , b)
}


var index1 = 2
var index2 = 1
swapTwoElement(&index1, &index2)


enum Just<Success , Failure> {
    case success(Success)
    case failure(Failure)
    
    func printCase(){
        
        switch self {
        case .success(let message):
            print(message)
        case .failure(let message):
            print(message)
        }
        
    }
}

func printSuccess() -> Just<Int, String>{
    return .success(12)
}

func printFailure() -> Just<String, Int>{
    return .failure(55)
}

printSuccess().printCase()
printFailure().printCase()
