import UIKit

func solution(_ gems:[String]) -> [Int] {
    
    var dict : [String : Int] = [:]
    var answer : [(start : Int , end : Int, len : Int)] = []
    
    let allCount = Set(gems).count
    
    var start = 0
    var end = -1
    
    var cnt = 0
    
    while start < gems.count || end < gems.count {
        
//        print(start , end)
        
        if cnt == allCount {
            
            //스택에 저장
            answer.append((start: start, end: end, len: end - start))
            
            if let exist = dict[gems[start]]{
                
                if exist - 1 == 0 {
                    
                    dict.removeValue(forKey: gems[start])
                    cnt -= 1
                }
                else{
                    
                    dict[gems[start]] = exist - 1
                }
                
            }
            
            start += 1
            
        }
        else{
            
            end += 1
            
            if end < gems.count{
            
            if let exist = dict[gems[end]] {
                dict[gems[end]] = exist + 1
            }
            else{
                dict[gems[end]] = 1
                cnt += 1
            }
                
            }
            
        }
        
        if end >= gems.count && cnt < allCount{
            break
        }
        
    }
    
    answer = answer.sorted(by: { (element1, element2) -> Bool in
        
        if element1.len == element2.len{
            return element1.start < element2.start
        }
        
        return element1.len < element2.len
    })
        
    return [answer.first!.start + 1 , answer.first!.end + 1]
}

//https://tech.kakao.com/2020/07/01/2020-internship-test/

let gems = ["ZZZ", "YYY", "NNNN", "YYY", "BBB"]
print(solution(gems))
