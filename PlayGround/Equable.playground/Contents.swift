import UIKit

struct Grade : Hashable{
    let total : Double
}

struct Student :  Hashable{
    let name : String
    let ID : Int
    let grade : Grade
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(grade.total)
    }
    
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.grade.total == rhs.grade.total && lhs.name == lhs.name
    }
    
}

let Hururuek = Student(name: "Hururuek", ID: 2000 , grade: Grade(total: 3.5))
let ChapChap = Student(name: "Hururuek", ID: 1000 , grade: Grade(total: 2.5))


var dictionary : [Student : Int] = [Hururuek : 1 , ChapChap : 2]

let newStudent = Student(name: "New", ID: 3000, grade: Grade(total: 2.8))

if let element = dictionary[newStudent] {
    print(element)
}
else{
    print("존재 하지 않다")
    dictionary[newStudent] = 1
    print(dictionary[newStudent])
}
