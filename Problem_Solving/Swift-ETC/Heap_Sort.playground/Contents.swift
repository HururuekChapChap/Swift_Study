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

let array = [12,3,6,15,45,1,2]
var heap = Heapify<Int>(sort: <)
heap.buildHeap(inputArray: array)

//print(heap.element)
//
//heap.insert(item: 0)
//
//print(heap.element)
//
//while !heap.isEmpty{
//    print(heap.remove() ?? "없음")
//}


var test = Heapify<(a : Int, b :Int)>.init { (element1, element2) -> Bool in
    
    if element1.a == element2.a{
        return element1.b < element2.b
    }
    return element1.a < element2.a
}

let testArray : [(a: Int , b: Int)] = [(1,2),(2,3),(3,4),(1,3),(2,4),(3,5)]

test.buildHeap(inputArray: testArray)

print(test.element)
