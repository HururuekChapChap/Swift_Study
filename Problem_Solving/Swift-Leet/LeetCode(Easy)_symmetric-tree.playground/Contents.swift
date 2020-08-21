import UIKit

 
 public class TreeNode {
    
     public var val: Int?
     public var left: TreeNode?
     public var right: TreeNode?
    
     public init() { self.val = 0; self.left = nil; self.right = nil; }
    
     public init(_ val: Int?) { self.val = val; self.left = nil; self.right = nil; }
    
     public init(_ val: Int?, _ left: TreeNode?, _ right: TreeNode?) {
         self.val = val
         self.left = left
         self.right = right
     }
    
 }

class Solution {
    
    func isSymmetric2(_ root: TreeNode?) -> Bool {
        
        guard let root = root else {return true}
        
        if root.left == nil && root.right == nil {return true}
        
        var sequence : [TreeNode?] = [root]
        
        while !sequence.isEmpty{
            
            var nodesValue : [TreeNode?] = []
            var flag = false
            
            for element in sequence {
                
                let leftNode = element?.left
                let rightNode = element?.right
                nodesValue.append(leftNode)
                nodesValue.append(rightNode)
                
                if leftNode != nil || rightNode != nil {
                    flag = true
                }
                
            }
            
            if flag == false {
                break
            }
            
            sequence.removeAll()
            
            for element in 0...(nodesValue.count - 1)/2 {
                
                if let startnode = nodesValue[element] , let lastNode = nodesValue[nodesValue.count - 1 - element] {
                    
                    if startnode.val != lastNode.val {
                        return false
                    }
                    
                }
                else if nodesValue[element] != nil && nodesValue[nodesValue.count - element - 1] == nil{
                    return false
                }
                else if nodesValue[element] == nil && nodesValue[nodesValue.count - element - 1] != nil{
                    return false
                }
            }
            
            sequence = nodesValue
            
        }
       
        
        return true
    }
    
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
     
        return isMirrored(root, root, true)
        
    }
    
    func isMirrored(_ leftNode : TreeNode? , _ rightNode : TreeNode?, _ isStart : Bool) -> Bool {
        
        guard let left = leftNode , let rigth = rightNode else {
            return leftNode == nil && rightNode == nil
        }
        
        if isStart == true {
        
            return left.val == rigth.val && isMirrored(left.left, rigth.right, false)
        }
        
        return left.val == rigth.val && isMirrored(left.right, rigth.left, false) && isMirrored(left.left, rigth.right, false)
    }
    
    func makeTree(_ array : [Int?]) -> TreeNode?{
        
        if array.isEmpty {return nil}
        
        var sequence : [TreeNode?] = []
        
        let startNode = TreeNode(array[0])
            
        var flag = "left"
        
        for element in array{
            
            if sequence.isEmpty {
                sequence.append(startNode)
                sequence.append(startNode)
                continue
            }
            
            
            if let node = sequence[0] {
                sequence.remove(at: 0)
                let newNode = TreeNode(element)
                if flag == "left"{
                           
                    node.left = newNode
                    sequence.append(node.left)
                    sequence.append(node.left)
                    flag = "right"
                }
                else {
                    
                    node.right = newNode
                    sequence.append(node.right)
                    sequence.append(node.right)
                    flag = "left"
                }
                
            }
            
        }
            
//        print(startNode.val, startNode.left?.val , startNode.right?.val, startNode.left?.left?.val, startNode.left?.right?.val)
        
        return startNode
    }
    
    
}

let array : [Int?] = [1,2,2,nil,3,nil,3]

let tree = Solution().makeTree(array)
print(Solution().isSymmetric(tree))

