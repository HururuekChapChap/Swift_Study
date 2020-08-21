import UIKit

//StudnetInfoSheet을 사용하기 위한 규약
protocol StudentInfoSheet {
    var studentID : String { get set}
    var studentname : String {get}
    func GetName() -> String
    func GetAge() -> Int
}

//StudentInfo는 StudnetInfoSheet를 따르기 때문에 위의 함수와 변수들이 필요하다.
struct StudentInfo : StudentInfoSheet {
    
    var studentname: String
    
    var studentID: String
    
    func GetName() -> String {
        return studentname
    }
    
    func GetAge() -> Int {
        return 20
    }
        
}

let studnetOne = StudentInfo(studentname: "ChapChap", studentID: "201520906")

studnetOne.studentID
studnetOne.GetAge()
studnetOne.GetName()







class Person {
    
    var delegate : StudentInfoSheet?
    
    func printName(){
        
        if let delegate = delegate{
            print(delegate.GetName())
        }
        else{
            print("PrintName Error : delegate를 설정해주세욥!")
        }
        
    }
    
    func printAge(){
        
        if let delegate = delegate {
            print(delegate.GetAge())
        }
        else{
            print("PrintAge Error : delegate를 설정해주세욥!")
        }
    }
    
}







class viewController: StudentInfoSheet{
    
    var student = Person()
    var studentID: String
    var studentname: String

    
    init() {
        studentID = "13131"
        studentname = "ChapChap"
        
        student.delegate = self
        student.printName()
        student.printAge()
    }
    
    
    func GetName() -> String {
        return studentname
    }
    
    func GetAge() -> Int {
        return 31
    }
    
}

let view = viewController()

