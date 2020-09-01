import UIKit

// 0 : 25

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    
    //세로를 중심으로 확인
    for times in 3...5000{
        
        let yellow_row = times - 2
        
        let yellow_cow = (brown - times * 2) / 2
        
        if yellow_row * yellow_cow == yellow {
            return [yellow_cow + 2, times ]
        }
        
    }
    
    
    return []
}

let brown = 24
let yellow = 24

print(solution(brown, yellow))
