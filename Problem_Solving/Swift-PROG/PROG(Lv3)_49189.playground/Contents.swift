import UIKit

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    
    var dict : [Int : [Int]] = [:]
    
    var distance : [Int] = Array(repeating: Int.max, count: n + 1)
    
    for element in edge{
        dict[element[0], default : []].append(element[1])
        dict[element[1], default : []].append(element[0])
    }
    
    distance[1] = 0
    var queue : [(node : Int , cnt : Int)] = [(1,0)]
    
    while !queue.isEmpty {
        
        let item = queue.removeLast()
        
        if let exist = dict[item.node] {
            
            for element in exist{
                
                let newDistance = item.cnt + 1
                
                if distance[element] > newDistance {
                    distance[element] = newDistance
                    queue.insert((element , newDistance), at: 0)
                }
                
            }
            
        }
        
    }
    
    
    distance.removeFirst()
    
    let maxValue = distance.max()!
    
    print(distance)
    
    
    
    return distance.filter { (element) -> Bool in
        return element == maxValue
    }.count
}

let n = 2

let vertex = [[1, 2]]

print(solution(n, vertex))
