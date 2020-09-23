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


