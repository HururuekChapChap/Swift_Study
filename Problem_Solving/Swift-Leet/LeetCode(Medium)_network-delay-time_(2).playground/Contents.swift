import UIKit

class Solution {
func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {

    var graph : [Int : [Int : Int]] = [:]

    for t in times {
       graph[t[0], default: [:]][t[1]] = t[2]
    }
    
    var distance : [Int] = Array(repeating: Int.max, count: N + 1)
    var visited : [Bool] = Array(repeating: false, count: N + 1)
    
    var queue : [(destination : Int , distance : Int)] = [(K , 0)]
    distance[K] = 0
    visited[K] = true
    
    while !queue.isEmpty {
        
        let item = queue.removeLast()
        
        let node = item.destination
        let time = item.distance
        
        if let connectedNodes = graph[node] {
            
            for element in connectedNodes{
                
                if time + element.value < distance[element.key] {
                    
                    distance[element.key] = time + element.value
                    queue.append((destination: element.key, distance:  time + element.value))
                    
                }
                
            }
            
        }
    
    }
    
    distance.removeFirst()
    
    let maxTime = distance.max()!
    
    
   return maxTime == Int.max ? -1 : maxTime
}

}

let times = [[2,1,1],[2,3,1],[3,4,1]]
let N = 4
let K = 2

print(Solution().networkDelayTime(times, N, K))
var test : [Int : [Int:Int]] = [1:[2:2] , 2 : [2:3 , 3: 2]]

test[2]![5] = 2

//print(test)

test[3 , default : [:]][5] = 2

//    print(graph)
//
//    graph.removeAll()
//
//    for t in times {
//        if var temp = graph[t[0]] {
//            temp[t[1]] = t[2]
//        }
//        else{
//            graph[t[0]] = [t[1] : t[2]]
//        }
//    }
//
//    print(graph)

//print(test)

var testStack : [Int : [Int]] = [:]

testStack[2 , default : []].append(3)

//print(testStack)


