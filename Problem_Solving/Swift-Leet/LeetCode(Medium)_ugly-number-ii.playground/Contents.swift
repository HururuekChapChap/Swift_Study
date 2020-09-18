import UIKit

struct Heapify<T> {
    
    var element : [T] = []
    
    var isEmpty : Bool {return element.isEmpty}
    var size : Int {return element.count}
    var isOrdered : (T,T) -> Bool
    
    public init(sort : @escaping (T,T) -> Bool){
        self.isOrdered = sort
    }
    
    private func getParent(_ index : Int) -> Int{
        return (index - 1) / 2
    }
    
    private func getRightChild(_ index : Int) -> Int{
        return (index * 2) + 2
    }
    
    private func getLeftChild(_ index : Int) -> Int{
        return (index * 2) + 1
    }
    
    mutating func heapifyDown(_ index : Int){
        
        let leftIndex = getLeftChild(index)
        let rightIndex = getRightChild(index)
        
        if leftIndex < element.count && isOrdered(element[leftIndex] , element[index]) {
            
            if rightIndex < element.count && isOrdered(element[rightIndex] , element[leftIndex]){
//                print("right Swap : \(index) \(rightIndex)")
                element.swapAt(index, rightIndex)
                heapifyDown(rightIndex)
            }
            else{
//                print("left Swap : \(index) \(leftIndex)")
                element.swapAt(index, leftIndex)
                heapifyDown(leftIndex)
            }
            
        }
        
    }
    
    mutating func buildHeap(inputArray : [T]){
        element = inputArray
        
        for i in stride(from: element.count / 2 - 1, to: -1, by: -1){
            heapifyDown(i)
        }
        
    }
    
    mutating func heapifyUp(_ index : Int){
        
        let parentIndex = getParent(index)
        
        if parentIndex >= 0 && isOrdered(element[index], element[parentIndex]){
            element.swapAt(parentIndex, index)
            heapifyUp(parentIndex)
        }
        
    }
    
    public mutating func insert(item : T){
        element.append(item)
        heapifyUp(element.count - 1)
    }
    
    public mutating func remove() -> T?{
        
        if self.isEmpty {return nil}
        
        let rootItem = element[0]
        element.swapAt(0, element.count - 1)
        element.removeLast()
        
        heapifyDown(0)
        
        return rootItem
    }
    
}


class Solution {
    
    func nthUglyNumber2(_ n: Int) -> Int {
        
        var cnt = 1
        var dp = Array(repeating: 0, count: n)
        
        dp[0] = 1
        
        var p2 = 0
        var p3 = 0
        var p5 = 0
        
        while cnt < n{
        
            dp[cnt] = min(dp[p2]*2 , dp[p3] * 3, dp[p5]*5)
            
            if dp[cnt] == dp[p2]*2{
                p2 += 1
            }
            
            if dp[cnt] == dp[p3]*3{
                p3 += 1
            }
            
            if dp[cnt] == dp[p5]*5{
                p5 += 1
            }
            
            cnt += 1
            
        }
        
        print(dp)
        
        return dp[cnt - 1]
    }
    
    func nthUglyNumber(_ n: Int) -> Int {
           
        var cnt = 1
        var visited = Set([1])
        var heap = Heapify<Int>.init(sort: <)
        var answer = 1
        
        heap.buildHeap(inputArray: [1])
        
        while cnt <= n {
                
            let smallest = heap.remove()!
            
            if cnt == n {
                answer = smallest
            }
            
            cnt += 1
            
            for item in [2,3,5]{
                
                let number = item * smallest
                
                if !visited.contains(number) {
                    heap.insert(item: number)
                    visited.insert(number)
                }
                
            }
            
            
        }
        
        return answer
       }
    
    
}

print(Solution().nthUglyNumber(1690))
