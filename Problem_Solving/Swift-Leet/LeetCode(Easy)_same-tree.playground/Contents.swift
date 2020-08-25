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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    
        guard let leftNode = p , let rightNode = q else{
            
            if p == nil && q == nil {
                return true
            }
            
            return false
        }
        
        if leftNode.val != rightNode.val {
            return false
        }
        
        if !isSameTree(p?.left, q?.left) || !isSameTree(p?.right, q?.right){
            return false
        }

        return true
    }
    
    func makeTree(_ list : [Int?],_ location : Int) -> TreeNode? {
        
        if location >= list.count {
            return nil
        }
        
        let node : TreeNode = TreeNode(list[location])
       
        node.left = makeTree(list, location * 2)
        node.right = makeTree(list, location * 2 + 1)
        
        return node
    }
    
}

let list1 : [Int?] = [0,1,2,1]
let list2 : [Int?] = [0,1,1,2]
let tree1 = Solution().makeTree(list1, 1)
let tree2 = Solution().makeTree(list2, 1)
Solution().isSameTree(tree1, tree2)

