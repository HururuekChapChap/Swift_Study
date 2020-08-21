import UIKit

struct Personstruct{
    var firstName : String
    var lastName : String
    
    //이렇게 초기화를 해주는 init을 클래스에서는 등록을 해줘야 한다.
    init(firstName : String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String{
        return "\(firstName) \(lastName)"
    }
    
    //mutating은 오직 struct에서만 사용한다.
    mutating func uppercaseName(){
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }

}

class PersonClass{
    var firstName : String
    var lastName : String
    
    //이렇게 초기화를 해주는 init을 클래스에서는 등록을 해줘야 한다.
    init(firstName : String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
    
    var fullName: String{
        return "\(firstName) \(lastName)"
    }
    
    //mutating은 오직 struct에서만 사용한다.
    func uppercaseName(){
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }

}


var PersonStruct1 = Personstruct(firstName: "TaeSoo", lastName: "Yoon")
var PersonStruct2 = PersonStruct1

PersonStruct1.firstName = "JIEun"

var PersonClass1 = PersonClass(firstName: "TaeSoo", lastName: "Yoon")
var PersonClass2 = PersonClass1

PersonClass1.firstName = "JIEun"

//이렇게 구조체는 값이 바뀌어도 서로 영향을 주지 않지만
PersonStruct1.fullName
PersonStruct2.fullName
//클래스는 참조형이기 때문에 바뀌면 서로 영향을 준다.
PersonClass1.fullName
PersonClass2.fullName

//이렇게 새롭게 할당을 해주면 서로 다른 값을 가지게 된다.
PersonClass2 = PersonClass(firstName: "BOOB", lastName: "SAKARAKA")
PersonClass2.fullName
PersonClass1.fullName


