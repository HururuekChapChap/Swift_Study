import UIKit

protocol InfoRule {
    
    var name : String {get}
    var id : Int {get set}
    var totalID : Int {get set}
    
    mutating func changeInfo(name : String)
    
    func returnInfo() -> String
}

struct StudentInfo : InfoRule{
    
    var name : String = {
        return "HururuekChapChap"
    }()
    
    var id: Int
    
    
    var totalID: Int{
        get{
            return 100+self.id
        }
        set{
            self.id = newValue
        }
    }
    

    mutating func changeInfo(name: String) {
        self.name = name
    }
    
    func returnInfo() -> String{
        return "\(name) : \(id)"
    }

}

class WorkerInfo : InfoRule {
    
    
    var name: String
    var id: Int
    
    var totalID: Int{
        get{
            return 100+self.id
        }
        set{
            self.id = newValue
        }
    }
    
    init(_ id : Int){
        self.name = "ChapChap"
        self.id = id
    }
    
    func returnInfo() -> String {
        return "\(name) : \(id)"
    }
    
    
    func changeInfo(name: String) {
        self.name = name
    }
    
        
}

var studentOne = StudentInfo(id: 100)

var studentTwo = studentOne

print("구조체 변경 전 : \(studentOne.id) \(studentTwo.id)")

studentTwo.id = 200

print("구조체 변경 후 : \(studentOne.id) \(studentTwo.id) \n")



var workerOne = WorkerInfo(300)


var workerTwo = workerOne

print("클래스 변경 전 : \(workerOne.id) \(workerTwo.id)")

workerTwo.id = 400

print("클래스 변경 후 : \(workerOne.id) \(workerTwo.id)")
