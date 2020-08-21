import UIKit

class ListNode {
    public var val : Int
    public var next : ListNode?
    
    public init(){
        self.val = 0
        self.next = nil
    }
    
    public init(_ val : Int){
        self.val = val
        self.next = nil
    }
    
    public init(_ val : Int, _ next : ListNode?){
        self.val = val
        self.next = next
    }
    
}

class Solution{
    
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
    
 
    
    func makeList(_ arrayList : [Int]) -> ListNode? {
        
        var returnListNode : ListNode? = nil
        
//        returnListNode = ListNode(1)
//        returnListNode!.next = ListNode(2)
//        let temp = returnListNode!.next
//        temp!.next = ListNode(3)
//        let temp2 = temp?.next
//        temp2?.next = ListNode(4)
//
        var next : ListNode? = nil
        
        for item in arrayList{
            
            if returnListNode == nil {
                returnListNode = ListNode(item)
                next = returnListNode!
            }
            else{
                next!.next = ListNode(item)
                next = next!.next
            }
            
        }
        
        return returnListNode ?? nil
        
    }
    
    func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
     
        if l1 == nil {
            return l2
        }
        else if l2 == nil {
            return l1
        }
        else if l1 == nil && l2 == nil{
            return nil
        }
        
        let arrayOne = returnList(l1)
        let arrayTwo = returnList(l2)
        
        let mergeTwoArray = (arrayOne + arrayTwo).sorted(by : <)
        
        print(returnList(makeList(mergeTwoArray)))
        
        return makeList(mergeTwoArray)
    }
    
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
     
        guard let l1 = l1 else {return l2}
        guard let l2 = l2 else {return l1}
        var answer : ListNode? = nil
        
        if l1.val <= l2.val{
            answer = l1
            answer?.next = mergeTwoLists(l1.next, l2)
        }
        else {
            answer = l2
            answer?.next = mergeTwoLists(l1, l2.next)
        }
        
        return answer
        
    }
    
}
let indexOne = ListNode(1, ListNode(2, ListNode(4)))
let indexTwo = ListNode(1, ListNode(3, ListNode(4)))

let solution = Solution()

solution.returnList( solution.mergeTwoLists(indexOne, indexTwo) )



