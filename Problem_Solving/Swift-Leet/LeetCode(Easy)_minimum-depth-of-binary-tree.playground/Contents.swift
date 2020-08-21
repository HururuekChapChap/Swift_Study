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
    func minDepthDFS(_ root: TreeNode?) -> Int {
        
        guard let root = root else {return 0 }
        
        if root.left == nil && root.right == nil {
            return 1}
        
        if root.left != nil && root.right == nil {
            return minDepth(root.left) + 1
        }
        else if root.right != nil && root.left == nil {
            return minDepth(root.right) + 1
        }
        
        return min(minDepth(root.left) + 1 , minDepth(root.right) + 1)
    }
    
    func minDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {return 0}
        
        var nodeInfoList : [(TreeNode?, Int)] = [(root,1)]
        
        while !nodeInfoList.isEmpty {
            
            if let nodeInfo = nodeInfoList.first {
            nodeInfoList.remove(at: 0)
            
            let node = nodeInfo.0
            let depth = nodeInfo.1
            
                if node?.left == nil && node?.right == nil {
                    return depth
                }
                else{
                    
                    if node?.left == nil && node?.right != nil {
                        nodeInfoList.append((node?.right, depth + 1))
                    }
                    else if node?.left != nil && node?.right == nil {
                        nodeInfoList.append((node?.left, depth + 1))
                    }
                    else{
                        nodeInfoList.append((node?.right, depth + 1))
                        nodeInfoList.append((node?.left, depth + 1))
                    }
                    
                }
            }
 
        }
        
        return 0
    }
    
    func makeThree(_ array : [Int?], _ index : Int) -> TreeNode?{
            
        if index >= array.count {return nil}
        
        if array[index] == nil {return nil}
        
        let newNode = TreeNode(array[index])
        
        newNode.left = makeThree(array, index * 2)
        newNode.right = makeThree(array, index * 2 + 1)
        
        return newNode
    }
}

let array : [Int?] = [0,1,2]
let tree = Solution().makeThree(array, 1)
print(Solution().minDepth(tree))
