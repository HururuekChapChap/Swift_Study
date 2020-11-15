import UIKit

class Account{
    
    //저장 프로퍼티는 이런게 가능하다.
    var money : Int = 0{
        willSet{
            print("Money가 \(money)에서 \(newValue)로 변경 중 입니다.")
        }
        
        didSet{
            print("Money가 \(oldValue)에서 \(money)로 변경 돼었습니다.")
        }
    }
    //연산 프로퍼티는 초기화 설정이 안됀다.
    var credit : Int {
        
        get {
            return (money / 1000)
        }
        
        set (input) {
            money = input * 1000
            print("Money를 \(input)으로 변경 중 입니다.")
        }
        
    }
    
}

class ForeignAccount : Account{
    
    override var credit : Int {
        
        willSet{
            print("credit \(credit)에서 \(newValue)로 변경될 예정 입니다")
        }
        
        didSet{
            print("credit \(oldValue)에서 \(credit)으로 변경 되어 ㅆ습니다.")
        }
        
    }
    
}

let myAccount : ForeignAccount = ForeignAccount()
myAccount.money = 1000

myAccount.credit

myAccount.credit = 3

myAccount.money

//그리고 연산 프로퍼티에 willSet을 사용하기 위해서는 상속  받아서 override를 해줘야한다.
//상속 받으면 willSet -> Set -> didSet으로 발동 된다.


struct Node {
    var name : String
    var id : Int
}

struct Position {
    
    lazy var point : Node = Node(name: "ChapChap", id: 1)
    
    let job : String
    
    init(job : String){
        self.job = job
    }
    
}

var test : Position = Position(job: "Programmer")

print(test) // Position($__lazy_storage_$_point: nil, job: "Programmer")

print(test.point) // Node(name: "ChapChap", id: 1)

print(test) // Position($__lazy_storage_$_point: Optional(__lldb_expr_11.Node(name: "ChapChap", id: 1)), job: "Programmer")

//이것을 볼 때 lazy는 프로퍼티로 처음 접근 하지 않으면 nil 값을 가지게 되면서 메모리 낭비를 줄 일 수 있을 것 같다.
//그리고 접근이 되고 나서는 값을 가지게 된다.
//그런데 옵셔널이 있는데 굳이???
//아 생각해보니 옵셔널을 하려면 애초에 값을 주지 않아야하는데, 이것은 값을 주고 사용 안하는 것 같다.
