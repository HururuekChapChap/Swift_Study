import UIKit

//0:20
func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    
    var say = 0
    var isturn = 1
    var num = 0
    
    var answer : [String] = []
    while say < t {
        
        let number = String(num , radix: n)
        
        for element in number {
            
            if isturn == p && say < t{
                answer.append(String(element).uppercased())
                say += 1
            }
            
            if isturn == m {
                isturn = 0
            }
            
            isturn += 1
            
        }
        
        num += 1
        
    }
    
    return answer.joined()
}

let n = 16
let t = 16
let m = 2
let p = 2

//print(solution(n, t, m, p))


func toN(_ n:Int, _ base:Int) -> String{
    let data = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"]
    var out = ""
    var res = n
    var rem = 0
    while res > 0 {
        rem = res%base
        res = res/base
        out = data[rem] + out
    }
    if n == 0{
        out = "0"
    }
    return out
}


for  x in stride(from: 10, to: 0, by: -2){
    print(x)
}


func solution2(_ n: Int, _ t: Int, _ m: Int, _ p: Int) -> String {
    let count = t*m
    var values: [String] = []
    var number = 0
    while values.count < count {
        values += String(number, radix: n).compactMap({ String($0).uppercased() })
        number += 1
    }
    return stride(from: p - 1, to: count, by: m).reduce("", { $0 + values[$1] })
}
