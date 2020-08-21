import UIKit

struct Grade {
    
    var letter : Character
    var points : Double
    var credits : Double
    
}

class Person {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String){
        self.firstName = firstName
        self.lastName = lastName
    }
    
    func printMyName(){
        print("My Name is \(firstName)\(lastName)")
    }
}

class Student : Person{
    
    var grades : [Grade] = []
    /*
    
     //클래스는 이렇게 상속을 취하면 종복되는 코드를 줄일 수 있다.
     
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String){
          self.firstName = firstName
          self.lastName = lastName
      }
      
      func printMyName(){
          print("My Name is \(firstName)\(lastName)")
      }
 
 */
    
}

let jay = Person(firstName: "Jay", lastName: "Lee")
//Student 클래스는 Person 클래스를 상속 받았기 때문에 Person 클래스의 내용을 사용할 수 잇다.
let jason = Student(firstName: "Jasson", lastName: "Lee")

jay.firstName
jason.firstName

jay.printMyName()
jason.printMyName()

//->이렇게 Person 클래스의 내용을 Student 클래스인 Jason 도 사용할 수 있다.

let math = Grade(letter: "B", points: 8.5, credits: 3)
let history = Grade(letter: "A", points: 9.5, credits: 3)
jason.grades.append(math)
jason.grades.append(history)
print(jason.grades)
// jay.grades -> jay는 Person 클래스이기 때문에 Student 클래스의 내용을 사용할 수 없다.


class StudentAthelete : Student{
    
    var MinnumTrainTime : Int = 2
    var TrainedTime : Int = 0
    var Sports : [String]
    
    //이렇게 새롭게 생성자를 만들어 줄때는
    init(firstName: String, lastName: String, Sports : [String]) {
        //먼저 자신의 stored property를 챙겨주고
        self.Sports = Sports
        //자기 윗선의 생성자에거 넘겨준다. (-> Phase 1)
        super.init(firstName: firstName, lastName: lastName)
        
        //이렇게 정의가 완료가 되면 Phase 2로 메소드나 그들이 가지고 있는 내용을 사용할 수 있다.
    }
    
    func Train(){
        TrainedTime += 1
    }
}

class FootBallPlayer : StudentAthelete{
    
    var FootBallTeam = "FC Swift"
    
    //함수가 상속 받은거에 중복이 됐기 때문에
    override func Train(){
        TrainedTime += 2
    }
    
}

var Athelete1 = StudentAthelete(firstName: "Taesoo", lastName: "YOON", Sports: ["BaseBall", "BasketBall"])
var Athelete2 = FootBallPlayer(firstName: "Irving", lastName: "Kyrie", Sports: ["FootBall", "Soccer"])

Athelete1.grades.append(math)
Athelete1.grades.append(history)

Athelete2.grades.append(math)
Athelete2.grades.append(history)

Athelete1.Train()
Athelete1.printMyName()
Athelete1.TrainedTime


//같은 Train이지만 Override 됐기 때문에 Athelete2에서는 FootBallPlayer 클래스의 Train() 함수를 사용한다.
Athelete2.Train()
Athelete2.printMyName()
Athelete2.FootBallTeam
Athelete2.TrainedTime

//이렇게 캐스팅을 해서 Athelete1에 Athelete2의 기능을 넣을 수 있다. 그러나 중복되지 않거나 Athelete1이 가지고 있지 않는 Athelete2의 기능은 사용할 수 없다. (FootBallTeam)
Athelete1 = Athelete2 as StudentAthelete
Athelete1.TrainedTime
Athelete1.Train()
Athelete1.TrainedTime
Athelete1.printMyName()

if let Athelete1 = Athelete1 as? FootBallPlayer {
    Athelete1.FootBallTeam
}








