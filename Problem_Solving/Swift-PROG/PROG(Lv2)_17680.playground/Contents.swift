import UIKit

//1 : 00
func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    
    let newCities = cities.map { (char) -> String in
        return String(char.lowercased())
    }
    
    print(newCities)
    
    if cacheSize == 0 {
        return cities.count * 5
    }
    
    var currentCache = 0
    var answer = 0
    var dict : [String : Int] = [:]
    var queue : [String] = []
    
    for element in newCities {
        
        var flag = false
        
        if let _ = dict[element] {
            answer += 1
            
            flag = true
        }
        else{
            answer += 5
            dict[element] = 1
        }
        
        //딕셔너리에 존재한다.
        if flag {
            
            var start = 0
            var end = queue.count - 1
            var index = 0
            
            while start <= end {
                
                if queue[start] == element {
                    index = start
                    break
                }
                else if queue[end] == element {
                    index = end
                    break
                }
                
                start += 1
                end -= 1
                
            }
            
            queue.remove(at: index)
            queue.append(element)
            
        }
        //딕셔너리에 존재하지 않다.
        else {
            
            if currentCache >= cacheSize {
            
                let item =  queue.removeFirst()
                dict.removeValue(forKey: item)
                queue.append(element)
            }
            else{
                    
                queue.append(element)
                currentCache += 1
                
            }
        
        }
        
        
    }
    
    
    return answer
}

let cacheSize = 2
let cities : [String] = []

//print(solution(cacheSize, cities))

var queue : [String] = ["A", "B","C","D","E"]

let a = queue.firstIndex(of: "C")!

queue.remove(at: a)

print(queue)
