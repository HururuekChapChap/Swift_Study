import UIKit

struct Lecture{
    var title : String
    var MaxStudents : Int = 10
    var NumOfRegistered : Int = 0

    var IsClose : Bool {
        
        get{
           
            if NumOfRegistered < (MaxStudents/2) {
                return false
            }
            
            return true
            
        }
        
        set{
            print(newValue)
        }
        
    }
    
    
    
    //이렇게 클래스나 구조체에 사용되는 함수를 메소드라고 한다.
    func remainSeats() -> Int {
        let remainSeats = MaxStudents - NumOfRegistered
        return remainSeats
    }
    
    //mutating : 변형되다 따라서 구조체 안에 있는 stored 프로퍼티가 변한다면 mutating을 써줘야한다.
    mutating func IncreaseMax(_ num: Int){
        
        MaxStudents += num
    }
    
    //구조체는 Type 프로퍼티도 존재하지만 함수에 대한 Type 프로퍼티도 가능하다.
    static let Target : String = "Anybody who want"
    //이렇게 Type 함수도 가능하다.
    static func 대학교이름() -> String {
        return "캣홀릭대학교"
    }
}

var lec1 = Lecture(title: "Swift")

print(lec1.remainSeats())

lec1.IncreaseMax(5)
lec1.remainSeats()
lec1.IsClose = true

Lecture.Target
Lecture.대학교이름()
