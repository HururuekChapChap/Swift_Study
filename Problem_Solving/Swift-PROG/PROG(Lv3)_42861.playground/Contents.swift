import UIKit

typealias Info = (From : Int , To : Int , Cost : Int )

func makeMINHeap(_ list : inout [Info], _ element : Info){
    
    if list.isEmpty {
        list.append(element)
    }
    else{
        
        var start = 0
        var end = list.count - 1
        
        while start <= end {
            
            let mid = (start + end)/2
            
            if list[mid].Cost < element.Cost{
                end = mid - 1
            }
            else{
                start = mid + 1
            }
            
        }
        
        list.insert(element, at: start)
    }

    
}

struct Union_Find{
    
    var element : [Int]
    var height : [Int]
    
    init(_ n : Int){
        element = Array(0..<n)
        height = Array(repeating: 1, count: n)
    }
    
    mutating func findParent(_ node : Int) -> Int{
        
        if element[node] == node {return node}
        
        element[node] = findParent(element[node])
        return element[node]
    }
    
    mutating func unionNode(_ node1 : Int , node2 : Int) -> Bool{
        
        let node1Parent = findParent(node1)
        let node2Parent = findParent(node2)
        
        if node1Parent == node2Parent{return false}
        
        if height[node1Parent] < height[node2Parent]{
            element[node1Parent] = node2Parent
        }
        else if height[node1Parent] > height[node2Parent]{
            element[node2Parent] = node1Parent
        }
        else{
            
            element[node2Parent] = node1Parent
            height[node1Parent] += 1
        }
        
        return true
    }
    
}

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    
    var list : [Info] = []
    
    var unionFind = Union_Find.init(n)
    
    var answer = 0
    
    for element in costs{
            makeMINHeap(&list, (element[0],element[1],element[2]))
    }
    
    while !list.isEmpty{
        
        let item = list.removeLast()
        
        if unionFind.unionNode(item.From, node2: item.To) {
            answer += item.Cost
        }
        
    }

    return answer
}

let n = 4
let costs : [[Int]] = [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]]
print(solution(n, costs))
