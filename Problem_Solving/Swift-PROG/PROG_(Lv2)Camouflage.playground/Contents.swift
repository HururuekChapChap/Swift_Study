import UIKit

let clothes = [["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["black_sunglasses", "eyewear"] ,["green_turban", "headgear"], ["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]]

var answer = 1

func Combination(cnt : Int ,sum : Int ,current : Int, max : Int, visited : inout [Int], clothesCnt : [Int]){
    
    if cnt == max {
        //print(sum)
        answer += sum
    }
    else {
        
        for i in current..<clothesCnt.count{
            
            if visited[i] == 0 {
                
                visited[i] = 1
                Combination(cnt: cnt + 1, sum: sum * clothesCnt[i], current: i + 1, max: max, visited: &visited, clothesCnt: clothesCnt)
                visited[i] = 0
                
            }
            
        }
        
    }
    
}

func solution(_ clothes:[[String]]) -> Int {
    
    var 의상종류 : [String : Int] = [:]
    var 의상갯수 : [Int] = []
    
    for 요소들 in clothes {
        
        let 의상의종류 = 요소들[1]
       
        if 의상종류[의상의종류] != nil {
            의상종류[의상의종류]! += 1
            }
        else{
            의상종류[의상의종류] = 1
            }
        
    }
    
    
    for 키 in 의상종류 {
        
        //의상갯수.append(키.value)
        
        answer *= (키.value + 1)
        
    }
    
//    var visited:[Int] = Array(repeating: 0, count: 의상갯수.count)
//
//    for select in 1...의상갯수.count{
//
//    Combination(cnt: 0, sum: 1, current: 0, max: select, visited: &visited, clothesCnt: 의상갯수)
//
//        print(answer)
//    }
//
    
    print(answer)
    
    return answer - 1
}

solution(clothes)
