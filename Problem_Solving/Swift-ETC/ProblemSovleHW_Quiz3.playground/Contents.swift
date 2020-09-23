import UIKit

var map : [[Int]] = []
var visited : [Int] = []
func solution(_ list : [Int]){
    
    let list = list.sorted()
    
    map = Array(repeating: Array(repeating: 0, count: list.count), count: list.count)
    visited = Array(repeating: 0, count: list.count)
    
    for y in 0..<list.count{
            
        for x in 0..<list.count{
    
            map[y][x] = list[x] - list[y]
            
        }
        
    }
    
    for element in map{
        print(element)
    }
    
    visited[0] = 1
    DFS(0, -1, 1, true)
    
    
    
}

func DFS(_ yindex : Int, _ number : Int, _ cnt : Int, _ isfirst : Bool){
    
//    print(visited)
    
    if cnt > 2 {
//        print("too many \(cnt) \(yindex)")
        return}
    
    for x in stride(from: yindex + 1, to: map.count, by: +1){
    
        if isfirst {
            
            if visited[x] == 0{
                
//                print("firstNode : \(yindex) \(x)")
                
                visited[x] = cnt
                DFS(x, map[yindex][x], cnt, false)
                visited[x] = 0
            }
            
        }
        else{
        
        if map[yindex][x] == number{
            
            if visited[x] == 0 {
            
//                print("same Number : \(yindex) \(x) \(number) \(map[yindex][x])")
                
            visited[x] = cnt
            DFS(x , map[yindex][x], cnt,false)
            visited[x] = 0
                
            }
        }
        else{
            
            if visited[x] == 0 ,let firstNode = visited.firstIndex(of: 0) {
            
//            print("not same number : \(yindex) \(x) \(firstNode)")
            
            visited[firstNode] = cnt + 1
            DFS(firstNode,-1, cnt + 1, true)
            visited[firstNode] = 0
                
            }
            
        }
            
        }
        
    }
    
    
    if cnt == 1 && yindex == map.count - 1{
        
        if let firstNode = visited.firstIndex(of: 0) {
         
//            print("single cnt and last index go to \(firstNode)")
            
            visited[firstNode] = cnt + 1
            DFS(firstNode, -1, cnt + 1, true)
            visited[firstNode] = 0
            
            
        }
        else{
//            print("single cnt and no left index to do so just End")
        }
        
    }
    else if cnt == 2{
        
        if visited.firstIndex(of: 0) != nil {
//            print("left element exist so just pass : \(yindex)")
        }
        else{
            print("answer Find : \(visited)")
        }
        
    }
        
    
    
}

let list : [Int] = [42, 12, 36, 36, 54, 33, 30, 24, 51, 39, 45, 18, 42, 48, 6]
    
    //[4,3,1,2] -> (1,2,3 | 4) 가 안된다.
    
    //[1,2,3,5,8]
solution(list)
