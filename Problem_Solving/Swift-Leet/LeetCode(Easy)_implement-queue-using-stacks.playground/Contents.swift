import UIKit


class Node{
    let data : Int
    var next_node : Node?
    
    init(){
        self.data = 0
        self.next_node = nil
    }
    
    init(_ val : Int){
        self.data = val
        self.next_node = nil
    }
    
}

class MyQueue {
    
    var headNode : Node?
    var tailNode : Node?
    /** Initialize your data structure here. */
    init() {
        self.headNode = nil
        self.tailNode = nil
        
        print("creat headNode")
    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        let newNode = Node(x)
        
        if headNode == nil {
            headNode = newNode
            tailNode = headNode
        }
        else{
            tailNode?.next_node = newNode
            tailNode = tailNode?.next_node
        }
        
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        let num = headNode?.data
        
        headNode = headNode?.next_node
        
        return num!
    }

    /** Get the front element. */
    func peek() -> Int {
        return headNode!.data
    }

    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return headNode == nil ? true : false
    }
}

 let obj = MyQueue()
obj.push(1)
obj.push(2)
obj.peek()
obj.pop()
obj.empty()

