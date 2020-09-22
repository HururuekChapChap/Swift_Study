import UIKit

class Solution {
    
    func findParent(_ list : inout [Int],_ person : Int) -> Int{
        
        if list[person] == person {return person}
        
        list[person] = findParent(&list, list[person])
        
        return list[person]
    }
    
    func unionParent(_ list : inout [Int], _ personOne : Int, _ personTwo : Int){
        
        let one = findParent(&list, personOne)
        let two = findParent(&list, personTwo)
        
        if one < two {
            list[personTwo] = one
        }
        else if two < one {
            list[personOne] = two
        }
        
    }
    
    func findCircleNum(_ M: [[Int]]) -> Int {
    
        var list = Array(stride(from: 0, to: M.count, by: 1))
        
        for _ in 0..<M.count{
        
        for (yindex, yelement) in M.enumerated(){
            
            for (xindex ,element) in yelement.enumerated(){
                
                if element == 1 {
                    unionParent(&list, yindex, xindex)
                }
                
            }
            
        }
        
        }
        
//        print(list)
        
        return Set(list).count
    }
    
}

var input : [[Int]] = [[1,1,0,0,0,0,0,1,0,0,0,0,0,0,0],[1,1,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,1,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,1,0,1,1,0,0,0,0,0,0,0,0],[0,0,0,0,1,0,0,0,0,1,1,0,0,0,0],[0,0,0,1,0,1,0,0,0,0,1,0,0,0,0],[0,0,0,1,0,0,1,0,1,0,0,0,0,1,0],[1,0,0,0,0,0,0,1,1,0,0,0,0,0,0],[0,0,0,0,0,0,1,1,1,0,0,0,0,1,0],[0,0,0,0,1,0,0,0,0,1,0,1,0,0,1],[0,0,0,0,1,1,0,0,0,0,1,1,0,0,0],[0,0,0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,1,0,1,0,0,0,0,1,0],[0,0,0,0,0,0,0,0,0,1,0,0,0,0,1]]

//print(Solution().findCircleNum(input))


public class UnionFind {
    var parent: [Int]
    var rank: [Int]
    var count: Int
    
    public init(_ n: Int) {
        self.count = n
        self.parent = [Int](repeatElement(0, count: n))
        self.rank = [Int](repeatElement(0, count: n))
        for i in 0..<n {
            self.parent[i] = i
            self.rank[i] = 0
        }
    }
    
    public func find(_ p: Int) -> Int {
        var p = p
        while p != self.parent[p] {
            self.parent[p] = self.parent[self.parent[p]]
            p = self.parent[p]
        }
        return p
    }
    
    public func getCount() -> Int {
        return self.count
    }
    
    public func connected(_ p: Int, _ q: Int) -> Bool {
        return find(p) == find(q)
    }
    
    public func union(_ p: Int, _ q: Int) {
        let i = find(p)
        let j = find(q)
        
        if i == j {
            return
        }
        if self.rank[i] < self.rank[j] {
            self.parent[i] = j
        } else if self.rank[i] > self.rank[j] {
            self.parent[j] = i
        } else {
            self.parent[j] = i
            self.rank[i] += 1
        }
        self.count -= 1
    }
}


func findCircleNum_UnionFind(_ M: [[Int]]) -> Int {
       if M.count == 0 || M[0].count == 0 {
           return 0
       }
       
       let n = M.count
       let unionFind = UnionFind(n)
       
       for i in 0..<(n - 1) {
           for j in (i + 1)..<n {
               if M[i][j] == 1 {
                   unionFind.union(i, j)
               }
           }
        
        print(unionFind.parent)
        print(unionFind.rank)
        print()
       }
       return unionFind.getCount()
   }


input = [[1,0,0,0,0,0,1],[0,1,0,0,0,0,1],[0,0,1,0,0,1,0],[0,0,0,1,1,0,0] ,[0,0,0,1,1,1,0],[0,0,1,0,1,1,1],[1,1,0,0,0,1,1]]

print(findCircleNum_UnionFind(input))
