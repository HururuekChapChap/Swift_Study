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
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        guard var head = head else{return nil}
        
        var set = Set<Int>()

        var answer : ListNode? = nil
        var next : ListNode? = nil

        while true {


            if set.contains(head.val) == false{

                set.insert(head.val)

                if answer == nil {
                    answer = ListNode(head.val)
                    next = answer
                }
                else{
                    next!.next = ListNode(head.val)
                    next = next!.next
                }

            }

            if head.next == nil{
                    break
                }

            head = head.next!

        }
        
        return answer
    }
    
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
    
}

let listnode = ListNode(1, ListNode(1, ListNode(1, ListNode(2, ListNode(5)))))

let sol = Solution()
sol.deleteDuplicates(listnode)
