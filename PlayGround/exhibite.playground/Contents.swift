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
    
    //Static Class 모두 Type 프로퍼티이다.
    //하지만 Static은 Override가 안돼고
    //Class는 Override가 가능하다.
    class func introduceClass() -> String {
        return "인류의 소원은 평화 입니다. "
    }
    
    static func typeFunction() {
        print("I'm Static typeFunction")
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
    
    
    //Static 변수는 Override가 안되지만 Class는 가능하다
    //override static func typeFunction(){}
    
}

class UniversityStudent : Student {
    
    var major : String = ""
    
    class func introduceClass(){
        print(super.introduceClass())
    }
    
    override class func introduceClass() -> String {
        return "대학생의 소원은 C+ 입니다."
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

//자기 자신의 introduceClass 호출
print(Person.introduceClass())
//Person의 introduceClass 호출 왜냐하면 자기 자신에는 introduceClass가 없기 때문
print(Student.introduceClass())
//재정의한 자기 자신의 introduceClass 호출
print(UniversityStudent.introduceClass() as String)
//자기 보다 윗선의 introduceClass 호출 없다면 그 위에 호출
UniversityStudent.introduceClass() as Void



class A {
    var name : String = ""
    var age : Int = 0
    var koreanAge : Int {
        return self.age + 1
    }
    
    var introduction : String {
        return "이름 : \(name) , 나이 : \(age)"
    }
}

class B : A{
    var grade : String = "F"
    
    override var introduction: String {
        return super.introduction + " " + "학점 : \(self.grade)"
    }
    
    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        
        set{
            self.age = newValue - 1
        }
    }
}

let yagomA : A = A()
yagomA.name = "Yagom"
yagomA.age = 55
//compile - error : koreanAge는 get 방식만 허용하기 때문에
//yagomA.koreanAge = 56

print(yagomA.introduction)
print(yagomA.koreanAge)

let jayB : B = B()
jayB.name = "JayB"
jayB.age = 14
//override 해서 get only 였던 것을 get과 set으로 모두 변경 했다.
jayB.koreanAge = 15

print(jayB.introduction)
print(jayB.koreanAge)
