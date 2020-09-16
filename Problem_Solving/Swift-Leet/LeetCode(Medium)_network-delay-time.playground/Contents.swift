import UIKit

class Solution {
    
    var distanceTime : [Int] = []
    var visited : [Bool] = []
    
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        
        distanceTime = Array(repeating: Int.max, count: N + 1)
        visited = Array(repeating: false, count: N + 1)
        
        dijkstra(K, times, N)
        
        distanceTime.removeFirst()
        
        print(distanceTime)
        
        let maxTime = distanceTime.max()!
        
        return maxTime == Int.max ? -1 : maxTime
    }
    
    func dijkstra(_ start : Int, _ times : [[Int]], _ nodes : Int){
        
        distanceTime[start] = 0
        visited[start] = true
        
        //초기 설정
        for element in times{
            if element[0] == start {
                
                distanceTime[ element[1] ] = element[2]
                
            }
        }
        
        
        //다른 노드에 대해서 반복적 수행
        for _ in 1..<nodes{
            let minIndex = getMinDistance()
            
            if minIndex == -1 {
                continue
            }
            
            visited[minIndex] = true
            let currentDistance = distanceTime[minIndex]
            
            for element in times{
                
                if element[0] == minIndex {
                    
                    if distanceTime[element[1]] > currentDistance + element[2] {
                        distanceTime[ element[1] ] = currentDistance + element[2]
                    }
                
                }
                
            }
            
        }
        
    }
    
    func getMinDistance() -> Int{
        
        var minValue = Int.max
        var minIndex = -1
        for (index, element) in distanceTime.enumerated(){
            
            //방문하지 않은 노드 중 가장 최소 값을 반환
            if minValue > element && !visited[index]{
                
                minValue = element
                minIndex = index
            }
            
        }
        
        
        return minIndex
    }
    
    
}

let times = [[1,2,2], [1,4,1],[1,3,5],[2,3,3],[2,4,2],[3,2,3],[3,6,5],[4,3,3],[4,5,1],[5,3,1],[5,6,2],[7,8,1]]
let N = 8
let K = 1

print(Solution().networkDelayTime(times, N, K))


