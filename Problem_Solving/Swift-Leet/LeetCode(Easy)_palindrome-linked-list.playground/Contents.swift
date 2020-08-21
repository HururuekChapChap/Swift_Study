import UIKit

class ListNode{
    
    var val : Int
    var next : ListNode?
    
    init(){
        self.val = 0
        self.next = nil
    }
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
        
    }
    
    init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
    
}

class Solution {
    
    func returnList(_ list : ListNode?) -> [Int]{
        
        var arrayList : [Int] = []
        
        guard var list = list else {
            return []
        }
        
        while true {
            
            arrayList.append(list.val)
            
            if let next = list.next {
                list = next
            }
            else{
                break
            }
    
        }
        
        return arrayList
    }
    
    func isPalindrome2(_ head: ListNode?) -> Bool {
    
        guard var head = head else {return true}
        
        var list : [Int] = []
        
        while true {
            
            list.append(head.val)
            
            if head.next == nil {
                break
            }
              
            head = head.next!
            
        }
        
        var start = 0
        var end = list.count - 1
        
        while start < end {
            
            if list[start] != list[end]{
                return false
            }
            start += 1
            end -= 1
        }
        
        return true
    }
    
    func isPalindrome(_ head: ListNode?) -> Bool {
    
        guard var head = head else {return true}
        
        guard let centerLocation : ListNode = getCenter(head) else {return true}
        
        var reversedListNode = reverseListNode(centerLocation)
        print(returnList(reversedListNode))
        
        while reversedListNode != nil {
            
            if head.val != reversedListNode?.val {
                return false
            }
            
            head = head.next!
            reversedListNode = reversedListNode?.next
            
        }
        
        return true
        
    }
    
    func getCenter(_ head : ListNode) -> ListNode?{
        
        var moveSlow : ListNode? = head
        var moveSlowCnt = 0
        
        var moveFastCnt = 0
        var moveFast : ListNode? = head
        
        while moveFast != nil {
            
            moveFast = moveFast?.next?.next
            moveFastCnt += 2
            moveSlow = moveSlow?.next
            moveSlowCnt += 1
        }
        
        print(" 이동한 횟수 : \(moveSlowCnt) , \(moveFastCnt)")
        return moveSlow
    }
    
    func reverseListNode(_ head : ListNode?) -> ListNode?{
        
        var head = head
        
        var reversed : ListNode? = nil
        var new : ListNode? = nil
        while head != nil {
                
            if reversed == nil {
                reversed = ListNode(head!.val)
            }
            else{
                new = ListNode(head!.val)
                new?.next = reversed
                reversed = new
            }
            
            head = head?.next
        }
        
        return reversed
    }
    
    
}


let listNode = ListNode(1,ListNode(3,ListNode(2,ListNode(4,ListNode(3,ListNode(2,ListNode(1)))))))

print(Solution().isPalindrome(listNode))
