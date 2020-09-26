import UIKit

var visited : [Bool] = []
var result : [String] = []
var answer = 0
func solution(_ K : Int) -> [Int] {
    
    let list = [6,2,5,5,4,5,6,3,7,6]
    
    visited = Array(repeating: false, count: 10)
    
   combination(0, K, list, "")
    
    print()
//    print(result)
    print(answer)
    
    return []
}

func combination(_ current : Int , _ max : Int , _ list : [Int], _ number : String){
    
    var temp = number

//    print(temp , current)
    
    if current == max {
        
        if number.count == 1 {
//            result.append(temp)
            answer += 1
            
        }
        else{
            
            if number.first! != "0" {
//                result.append(temp)
                answer += 1
            }
            
        }
        
        
    }
    else if current < max{
        
        for start in 0...9{
            
                temp.append(String(start))
                combination(list[start] + current, max, list , temp)
                temp.removeLast()
                
            }
            
        }
    
    
        
    }
    



let n = 20
solution(n)


