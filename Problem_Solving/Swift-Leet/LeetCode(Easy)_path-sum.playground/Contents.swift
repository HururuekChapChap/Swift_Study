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
    
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
    
        return checkIsSame(root, sum, 0)
    }
    
    func checkIsSame(_ treeNode : TreeNode?, _ sum : Int , _ total : Int) -> Bool {
        
        guard let treeNode = treeNode else {
            return false
        }
        
        if treeNode.val == nil {
            return false
        }
        
        if treeNode.left == nil && treeNode.right == nil {
            
            return sum == total + treeNode.val! ? true : false
        }
        
        return checkIsSame(treeNode.left, sum, treeNode.val! + total) || checkIsSame(treeNode.right, sum, treeNode.val! + total)
    }
    
    func makeTreeNode(_ list : [Int?], _ index : Int) -> TreeNode? {
        
        if index >= list.count {
            return nil
        }
        
        let newNode = TreeNode(list[index])
        
        newNode.left = makeTreeNode(list, index * 2)
        newNode.right = makeTreeNode(list, index * 2 + 1)
        
        return newNode
    
    }
}

let list : [Int?] = [0,5,4,8, 11, nil, 13,4,7,2, nil, 1]
let tree = Solution().makeTreeNode(list, 1)
print(Solution().hasPathSum(tree, 22))
