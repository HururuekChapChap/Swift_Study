import UIKit

func solution(_ num:Int) -> Int {
    
    var 정답 = num
    var 횟수 = 0
    while 정답 != 1 && 횟수 <= 500 {
        
        if 정답 % 2 == 0 {
            정답 = 정답 / 2
        }
        else {
            정답 = 정답 * 3 + 1
        }
        
        횟수 += 1
    }
    
    return 횟수 <= 500 ? 횟수 : -1
}

solution(626331)
