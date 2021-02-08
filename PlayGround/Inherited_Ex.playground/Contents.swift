import UIKit

protocol NACoding{
    
    init?(temp : String)
    
}

//Prototocal을 상속 받았는데
//그 때 init?()이 되어 있으면 required를 받게 된다.
class Person : NACoding{
    
    var name : String
    
    required init(){
        self.name = "Unknown - name"
    }
    
    required convenience init?(temp: String) {
        self.init()
        print(temp)
    }
    
}

class Student : Person{
    var major : String = "Unknown - Major"
}


//Required는 사용하면 상속 받는 클래스는 무조건으로 init()을 생성 해줘야합니다.
//하지만 상속받은 클래스에서 지정 init()이 없다면 자동 생성 해준다. 그래서 아래처럼 결과가 나온다.
let miJeong : Student = Student()
print(miJeong.major , miJeong.name) // Unknown - Major Unknown - name

let miDong : Person? = Person(temp: "테스트")
print(miDong!.name) // 테스트 \n Unknown - name


class A {
    var name : String
    
    required init(){
        self.name = "Unknown - name"
    }
}

class B : A {
    var major : String = "Unknown - major"
    
    init(input : String){
        self.major = input
        super.init()
    }
    
    //지정 init을 새롭게 생성 한다면 이렇게
    //required를 만들어줘야한다.
    required init(){
        self.major = "B class Required init start"
    }
}

//required init()을 실행시키면 super.init()이 없어도 해당 init()을 실행시켜준다.
let class_B : B = B()
print(class_B.name , class_B.major) // Unknown - name B class Required init start

let class_B2 : B = B(input: "major two")
print(class_B2.name , class_B2.major) // Unknown - name major two

protocol NBCoding{
    
    init?()
    
}

class C{
    
    var name : String
    
    init(){
        self.name = "Unkown C class - name"
    }
    
}


class D : C {
    var major : String = "Unkown D class - major"
    
    init(major : String){
        self.major = major
        super.init()
    }
    
    //이렇게 init()을 재정의 해주면서 required까지 붙일 수 있다.
    required override init(){
        self.major = "D class second Version - major"
        super.init()
    }
    
    //convenience은 init()이 필수로 필요하다.
    //이렇게 required를 사용해서 convenience를 만들 수도 있다.
    required convenience init(name : String){
        self.init()
        self.name = name
    }
}

class E : D {
    var grade : String
    
    init(grade : String){
        self.grade = grade
        super.init()
    }
    
    required convenience init(name: String) {
        self.init()
        self.name = name
    }
    
    //이미 부모 required에서 override를 내포하고 있다면 굳이 override를 적어줄 필요가 없다.
    required init() {
        self.grade = "F"
        super.init()
    }
    
}

let yagom : E = E()
print(yagom.grade)

let juHyun : E = E(name: "JuHyun")
print(juHyun.name)
