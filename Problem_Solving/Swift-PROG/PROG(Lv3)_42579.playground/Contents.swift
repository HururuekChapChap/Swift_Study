import UIKit

typealias Info = (index : Int , plays : Int)

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    var dict : [String : [Info]] = [:]
    var count : [String : Int] = [:]
    
    for (index , element) in genres.enumerated(){
        
        dict[element , default : []].append((index, plays[index]))
        
        if let exist = count[element]{
            count[element] = exist + plays[index]
        }
        else{
            count[element] = plays[index]
        }
        
    }
    
    let dictByCount = Array(dict).sorted { (element1, element2) -> Bool in
        
        if count[element1.key]! < count[element2.key]!{
            return false
        }
        
        return true
    }
    
    var answer : [Int] = []
    
    for element in dictByCount{
        
        let sortedElement = element.value.sorted { (element1, element2) -> Bool in
            
            if element1.plays == element2.plays{
                return element1.index < element2.index
            }
            
            return element1.plays > element2.plays
        }
        
        var cnt = 0
        
        for item in sortedElement{
            
            if cnt >= 2 {
                break
            }
            
            answer.append(item.index)
            
            cnt += 1
            
        }
        
    }
    
    
    return answer
}

let genres = ["classic", "pop", "classic", "classic", "pop" , "song"]
let plays = [500, 600, 150, 800, 2500, 40000]

print(solution(genres, plays))
