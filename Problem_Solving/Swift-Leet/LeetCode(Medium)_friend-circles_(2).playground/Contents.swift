import UIKit

struct DisJointSet{
    
    var nodes : [Int]
    
    init(_ N : Int) {
        nodes = Array(0..<N)
    }
    
    mutating func findParent(_ a : Int) -> Int{
        
        if nodes[a] == a {
            return a
        }
        
        nodes[a] = findParent(nodes[a])
        
        return nodes[a]
    }
    
    mutating func unionElement(_ a : Int , _ b : Int){
        
        let rootOf_A = findParent(a)
        let rootOf_B = findParent(b)
        
        if rootOf_A < rootOf_B{
            nodes[rootOf_B] = rootOf_A
        }
        else{
            nodes[rootOf_A] = rootOf_B
        }
        
    }

}

struct DisJointSet2{
    
    var nodes : [Int]
    var height : [Int]
    
    init(_ N : Int) {
        nodes = Array(0..<N)
        height = Array(repeating: 1, count: N)
    }
    
    mutating func findParent(_ a : Int) -> Int{
        
        if nodes[a] == a {
            return a
        }
        
        nodes[a] = findParent(nodes[a])
        
        return nodes[a]
    }
    
    mutating func unionElement(_ a : Int , _ b : Int){
        
        let rootOf_A = findParent(a)
        let rootOf_B = findParent(b)
        
        if rootOf_A == rootOf_B {return}
        
        if height[rootOf_A] < height[rootOf_B]{
            nodes[rootOf_A] = rootOf_B
        }
        else if height[rootOf_A] > height[rootOf_B]{
            nodes[rootOf_B] = rootOf_A
        }
        else{
        
        if rootOf_A < rootOf_B{
            nodes[rootOf_B] = rootOf_A
            height[rootOf_A] += 1
        }
        else{
            nodes[rootOf_A] = rootOf_B
            height[rootOf_B] += 1
        }
            
        }
        
    }

}


class Solution {
    
    func findCircleNum2(_ M: [[Int]]) -> Int {
            
        var relation = DisJointSet.init(M.count)
        
        print(relation.nodes)
        
        relation.unionElement(0, 1)
        relation.unionElement(1, 2)
        
        print(relation.nodes)
        
        relation.unionElement(4, 5)
        relation.unionElement(5, 6)
        
        print(relation.nodes)
        
        relation.unionElement(0, 4)
        
        print(relation.nodes)
        
        for xindex in 0..<M.count{
            
            relation.findParent(xindex)
            
        }
        
        print(relation.nodes)
        
        return 0
    }
    
    func findCircleNum(_ M: [[Int]]) -> Int {
            
        var relation = DisJointSet2.init(M.count)
        
        for (yindex , yelement) in M.enumerated(){
            
            for (xindex, xelement) in yelement.enumerated(){
                
                if xelement == 1 {
                    
                    relation.unionElement(yindex, xindex)
                    
                }
                
            }
            
            
        }
        
        for xindex in 0..<M.count{
                   
            relation.findParent(xindex)
                   
        }
        
        return Set(relation.nodes).count
    }
    
}

let input = [[1,1,0],[1,1,1],[0,1,1]]

print(Solution().findCircleNum(input))


