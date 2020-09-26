import UIKit


func solution(_ n : Int , _ p : [Int], _ c : [Int]) -> String{
    
    var left = 0
    var money = 0
    var cost = 100
    var cannt = 0
    var days = 0
    
    for index in 0..<n{
        days = index + 1
        let produce = p[index] + left
        let use = c[index]
        
        print(produce , use)
        
        if produce >= use {
            
            if cannt == 0 {
                cost = 100
            }
            else if cannt == 1{
                cost = 50
            }
            else if cannt == 2{
                cost = 25
            }
            
            money += cost * use
            left = produce - use
            cannt = 0
        }
        else{
            left = produce
            cannt += 1
            
            if cannt == 3 {
                break
            }
        }
        
        print(money , left , cannt)
        
    }

    
    let answer = Double(money) / Double(days)
    
    let r = round(answer * 100) / 100
    
    print(money , days)
    print(answer)
    print(r)
    
    return String(format: "%.2f", r)
}

let n = 6
let p = [0,1,1,0,0,1]
let c = [1,1,1,1,1,1]

print(solution(n, p, c))
