import UIKit

class Person{
    
    var name : String = ""
    var age : Int = 0
    
    var introductionn : String {
        get{
            return "이름 : \(name), 나이 : \(age)"
        }
    }
    
    func speak(){
        print("가나다라마바사")
    }
    
    class func introduceClass() -> String {
        return "인류의 소원은 평화 입니다. "
    }
}

class Student : Person{
    
    var grade : String = "F"
    
    func study(){
        print("Study hard,,,,")
    }
    
    override func speak() {
        print("저는 학생 입니당 ㅠㅠ")
    }
    
}

class UniversityStudent : Student {
    
    var major : String = ""
    
    class func introduceClass(){
        print(super.introduceClass())
    }
    
    override class func introduceClass() -> String {
        return "대학생의 소원은 A+ 입니다."
    }
    
    override func speak() {
        super.speak()
        print("대학생이죠.")
    }
}


let yagom : Person = Person()
yagom.speak()

let jay : Student = Student()
jay.speak()

let jenny : UniversityStudent = UniversityStudent()
jenny.speak()

print(Person.introduceClass())
print(Student.introduceClass())
print(UniversityStudent.introduceClass() as String)
UniversityStudent.introduceClass() as Void

