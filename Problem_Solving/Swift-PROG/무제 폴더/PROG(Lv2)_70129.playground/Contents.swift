import UIKit

func solution(_ s:String) -> [Int] {
    
    var change_cnt = 0
    var total_cnt = 0
    
    var change_s = s
    var cnt = change_s.filter { (char) -> Bool in
        return char == "0"
    }.count
    
    while change_s != "1" {
        
        print(change_s , cnt)
        total_cnt += cnt
        change_cnt += 1
        
        let temp = change_s.replacingOccurrences(of: "0", with: "")
        let new = String(temp.count, radix: 2)
        change_s = new
        
        cnt = change_s.filter { (char) -> Bool in
            return char == "0"
        }.count
        
    }
    
    return [change_cnt, total_cnt]
}

let s = "1111111"
print(solution(s))
