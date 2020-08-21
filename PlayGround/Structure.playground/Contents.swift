import UIKit


func getDistance(myloc : Location, storeloc : Location) ->Double {
    
    let disX = (myloc.x - storeloc.x)*(myloc.x - storeloc.x)
    let disY = (myloc.y - storeloc.y)*(myloc.y - storeloc.y)
    
    let distance : Double = {
        return sqrt(Double(disX) + Double(disY))
    }()
    
    return distance
}

struct Location{
    var x : Int
    var y : Int
}

struct Store{
    var loc : Location
    var name : String
    let isDelivary = 2.0
    
    func isDelivable(_ mylocation: Location) ->Bool {
        
        let distance = getDistance(myloc: mylocation, storeloc: loc)
        
        if( isDelivary >= distance ){
            return true
        }
        
        return false
    }
}

let CloseStore : (Location, [Store]) ->String = { (myloc, stores) in
    
    var MinDis : Double?
    var MinStore : String?
    var isDelivalble : Bool?
    
    for store in stores{
        
        let distance = getDistance(myloc: myloc, storeloc: store.loc)
        
        if let tempDis = MinDis{
            
            if tempDis > distance {
                //print("tempDis \(tempDis),Distance \(distance) , Store:\(MinStore!)")
                MinDis = distance
                MinStore = store.name
                isDelivalble = store.isDelivable(myloc)
            }
            
        }
        else{
            MinDis = distance
            MinStore = store.name
            isDelivalble = store.isDelivable(myloc)
        }
        
    }
    
    print("가게 : \(MinStore!) 배달가능 : \(isDelivalble!)")
    
    return MinStore!
}


let mylocation = Location(x: 0, y: 0)

let store1 = Store(loc: Location(x: 3, y: 3), name: "gs")
let store2 = Store(loc: Location(x: 4, y: 4), name: "hello")
let store3 = Store(loc: Location(x: 5, y: 5), name: "emart")
let store4 = Store(loc: Location(x: 1, y: 1), name: "lotte")
let store5 = Store(loc: Location(x: 2, y: 2), name: "hyudei")

let storesList = [store1, store2, store3, store4, store5]

CloseStore(mylocation,storesList)


struct Lecture{
    var lecture : String
    var Name : String
    var MAX : Int
}

let lec1 = Lecture(lecture: "Swift", Name: "이종석", MAX: 30)
let lec2 = Lecture(lecture: "NodeJS", Name: "백종원", MAX: 20)
let lec3 = Lecture(lecture: "C++", Name: "윤태수", MAX: 10)

let list : [Lecture] = [lec1, lec2,lec3]

func FindLec(name : String, list : [Lecture]) -> String {
/*
    for lecture in list{
        
        if(lecture.Name == name){
            return lecture.lecture
        }
        
    }
  */
    
    let lectureName = list.first { (lec) -> Bool in
        return lec.Name == name
        }?.lecture
    
    return lectureName ?? "없습니다"
    
}

print(FindLec(name: "윤수", list: list))


//프로퍼티

struct Person{
    //stored property : 값을 단순히 저장하는 프로펄티
    var firstName : String
    var lastName : String
     
    //comput property : Stored property또는 newValue를 가공하여 새로운 값을 만들어내느 프로펄티
    var fullName : String {
        
        //반환하는것
        get{
            return "\(firstName) \(lastName)"
        }
        //설정하는것 즉, 가공하는 과정
        set{
            guard let firstName = newValue.components(separatedBy: " ").first else{return}
            
            self.firstName = firstName
            
            guard let lastName = newValue.components(separatedBy: " ").last else{return}
            
            self.lastName = lastName
        }
        
    }
    
    //Type property : 구조체 자체에서 공용적으로 쓰이는 프로펄티, 즉, 구조체에 특징을 나타내는 stored 프로퍼티
    static let isAlien : Bool = false
}

var person1 = Person(firstName: "태수", lastName: "윤")


print("\(person1.lastName) \(person1.firstName)")
person1.fullName = "수석 윤"
print("\(person1.lastName) \(person1.firstName)")

print(Person.isAlien)
