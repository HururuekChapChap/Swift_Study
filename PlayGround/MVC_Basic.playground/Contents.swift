import UIKit

class View {
    
    func showInfo(_ info : String){
        print(info)
    }
    
}

class Controller {
    
    var view : View?
    var model : Model?
    
    init(_ model : Model , _ view : View){
        self.view = view
        self.model = model
    }
    
    func setModel(_ name : String, _ id : String){
     
        model!.setInfo(name, id)
        
    }
    
    func updateView(){
    
        view!.showInfo(model!.getInfo())
        
    }
    
}

struct Model{
    
    private var name : String
    private var id : String
    
    init(_ name : String , _ id : String){
        
        self.name = name
        self.id = id
        
    }
    
    mutating func setInfo(_ name : String, _ id : String){
        
        self.name = name
        self.id = id
    }
    
    func getInfo() -> String{
        return "\(name) : \(id)"
    }
    
    
}

let initModel = Model.init("Hururuek", "12345")

let initView = View()

let controller = Controller.init(initModel, initView)

controller.updateView()

controller.setModel("ChapChap", "67890")

controller.updateView()
