import UIKit

func solution(_ number:String, _ k:Int) -> String {
    
    var space : [Int] = []

    for (index , element) in number.enumerated(){
        
        let charToint = Int(String(element))!
        
        if space.isEmpty {
            space.append(charToint)
        }
        else{
            
            let last = space[space.count - 1]
            
            if space.count == number.count - k {
                
                // 회정하면서 최대로 작은 값 까지 변경 / 마지막
                
            }
            else{
                
                //last 값 보다 element 값이 더 크면 chanage
                //그게 아니면 넣어준다.
                
                775
                
            }
            
        }
        
    }
    
    return ""
}
