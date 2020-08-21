import UIKit

let n = 4

func solution(_ n:Int) -> String {
    
    var mellon = ""
    
    for i in 1...n{
        
        if i % 2 == 0 {
            mellon += "박"
        }
        else{
            mellon += "수"
        }
        
    }
    
    return mellon
}

func solution2(_ n:Int) -> String {
    
    let mellon = String(repeating: "수박", count: n/2) + ( n % 2 == 0 ? "" : "수" )
    
    return mellon
}

print(solution2(n))
