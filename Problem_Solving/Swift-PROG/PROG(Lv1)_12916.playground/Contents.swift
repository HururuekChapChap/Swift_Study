import UIKit

func solution(_ s:String) -> Bool
{
    
    let array = Array(s)
    var cntP = 0
    var cntY = 0
    
    for index in array{
        
        if index == "p" || index == "P" {
            cntP += 1
        }
        else if index == "y" || index == "Y"{
            cntY += 1
        }
        
       // print(index , terminator : " ")
    }
    
    if cntP == cntY {
        return true
    }

    return false
}

func solution2(_ s:String) -> Bool {
        
    let lowerS = s.lowercased()
    print(lowerS)
    
    let componentP = lowerS.components(separatedBy: "p")
    let componentY = lowerS.components(separatedBy: "y")
    
    return componentP.count == componentY.count
}



let s = "pPoooyY"

solution2(s)
