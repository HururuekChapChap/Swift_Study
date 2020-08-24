import UIKit

//Auto Rectain Cycle

class ParentCalss {
    
    weak var classConect : ParentCalss?
    
    init(){
    
        print("클래스 생성")
    }
    
    deinit{
        print("클래스 소멸")
    }
    
}
//
//var parent : ParentCalss? = ParentCalss()
//var child : ParentCalss? = ParentCalss()
//
//parent?.classConect = child
//child?.classConect = parent
//
//parent = nil
//child = nil

class ViewController {
    
    var completHandler : ((String)->())? = nil
    
    let printElement  = 5
    init(){
        print("클래스 생성")
        
        completHandler = { [weak self]result in
            self?.printHello(result)
        }
        
        callFunction(name: "ChapChap")
        
        
    }
    
    deinit {
        print("클래스 소멸")
    }
    
    private func printHello(_ name : String){
        print("Hello \(name)")
    }
    
    func callFunction(name : String){
        completHandler?(name)
    }
    
}
//
//var viewController  : ViewController? = ViewController()
//viewController = nil



//함수 내부에 선언된 클로저는 함수가 반환 될 때 사라진다.
class ClosureClass {
    var name : String? = nil
    
    init() {
        print("클래스 생성")
        startClosure()
    }
    
    deinit {
        print("클래스 소멸")
    }
    
    func getName(name : String , completeHandler : (String?)->()){
        completeHandler(name)
    }
    
    func startClosure(){
        getName(name: "ChapChap", completeHandler: { result in
            self.name = result
        })
    }
}
//
//var closureClass : ClosureClass? = ClosureClass()
//closureClass = nil

protocol SomeDelegate : class{
    func funcPrint()
}

class MainViewController : SomeDelegate {
    
    let vc : ChildViewController?
    
    init(){
        print("MainViewController 생성")
        vc = ChildViewController()
        vc?.delegate = self
        vc?.anyFunc()
        
        //ChildeViewController의 delgate가 SomeDelegate를 받고 있고
        //그 deleagate에 값을 넣어주기 위해서는 현재 클래스도 SomeDelegate를 받고 있어야한다.
    }

    func funcPrint() {
        
    }
    
    deinit {
        print("MainViewController 소멸")
    }
    
    
}

class ChildViewController {
   weak var delegate : SomeDelegate?
    
    init(){
        print("ChildViewController 생성")
    }
    
    deinit {
        print("ChildViewController 소멸")
    }
    
    func anyFunc(){
        print("프린트 ChildViewController")
    }
    
    
}

var mainViewController : MainViewController? = MainViewController()
mainViewController = nil
