import UIKit

struct Heap<Element>
{
    var elements : [Element]
    let priorityFunction : (Element, Element) -> Bool

    init(elements: [Element] = [], priorityFunction: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.priorityFunction = priorityFunction
        buildHeap()
    }

    mutating func buildHeap() {
        for index in (0 ..< count / 2).reversed() {
            siftDown(elementAtIndex: index)
        }
    }

    var isEmpty : Bool { return elements.isEmpty }
    var count : Int { return elements.count }

    func peek() -> Element? {
        return elements.first
    }

    mutating func enqueue(_ element: Element) {
        elements.append(element)
        siftUp(elementAtIndex: count - 1)
    }

    mutating func siftUp(elementAtIndex index: Int) {
        let parent = parentIndex(of: index)
        guard !isRoot(index),
            isHigherPriority(at: index, than: parent)
            else { return }
        swapElement(at: index, with: parent)
        siftUp(elementAtIndex: parent)
    }

    mutating func dequeue() -> Element? {
        guard !isEmpty
            else { return nil }
        swapElement(at: 0, with: count - 1)
        let element = elements.removeLast()
        if !isEmpty {
            siftDown(elementAtIndex: 0)
        }
        return element
    }

    mutating func siftDown(elementAtIndex index: Int) {
        let childIndex = highestPriorityIndex(for: index)
        if index == childIndex {
            return
        }
        swapElement(at: index, with: childIndex)
        siftDown(elementAtIndex: childIndex)
    }

    // Helper functions

    func isRoot(_ index: Int) -> Bool {
        return index == 0
    }

    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }

    func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }

    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }

    func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
        return priorityFunction(elements[firstIndex], elements[secondIndex])
    }

    func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
        guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex)
            else { return parentIndex }
        return childIndex
    }

    func highestPriorityIndex(for parent: Int) -> Int {
        return highestPriorityIndex(of: highestPriorityIndex(of: parent, and: leftChildIndex(of: parent)), and: rightChildIndex(of: parent))
    }

    mutating func swapElement(at firstIndex: Int, with secondIndex: Int) {
        guard firstIndex != secondIndex
            else { return }
        elements.swapAt(firstIndex, secondIndex)
    }
}




func solution(_ jobs:[[Int]]) -> Int {
    
    let jobs = jobs.sorted { (element1, element2) -> Bool in
        
        if element1[0] == element2[0]{
            return element1[1] < element2[1]
        }
        
        return element1[0] < element2[0]
    }
        
    var heap = Heap<(start : Int , cost : Int)>.init { (element1, element2) -> Bool in
        return element1.cost < element2.cost
    }
    
    var currentTime = 0
    var count = 0
    var jobsIndex = 0
    var answer = 0
    
    while count < jobs.count {
        
        while jobsIndex < jobs.count && jobs[jobsIndex][0] <= currentTime {
            heap.enqueue((jobs[jobsIndex][0], jobs[jobsIndex][1]))
            jobsIndex += 1
        }
        
        if heap.isEmpty{
            currentTime = jobs[jobsIndex][0]
        }
        else{
            
            let item = heap.dequeue()!
            
            answer += currentTime + item.cost - item.start
            currentTime += item.cost
            count += 1
            
        }
        
    }

    return answer / jobs.count
}

let jobs : [[Int]] = [[1, 9], [1, 4], [1, 5], [1, 7], [1, 3]]

//print(solution(jobs))


func solution2(_ jobs:[[Int]]) -> Int {

    let jobs = jobs.sorted { (element1, element2) -> Bool in

        if element1[0] == element2[0]{
            return element1[1] < element2[1]
        }

        return element1[0] < element2[0]
    }

    var visited : [Bool] = Array(repeating: true, count: jobs.count)

//    print(jobs)
    
    var heap = Heap<(start : Int , cost : Int)>.init { (element1, element2) -> Bool in

        if element1.cost == element2.cost {
            return element1.start < element2.start
        }

        return element1.cost < element2.cost
    }


    for (index ,element) in jobs.enumerated(){

        if element[0] == jobs[0][0]{
            heap.enqueue((element[0],element[1]))
            visited[index] = false
        }

    }

//    print(queue)


    var currentTime = jobs[0][0]

//    print(heap.element)

    var answer = 0

    while !heap.isEmpty{

        if let item = heap.dequeue() {

            let timeTake = currentTime - item.start + item.cost

            // print(item.start , item.cost ,timeTake)

            answer += timeTake

            currentTime = currentTime + item.cost

            //요청시간이 가능한지 탐색
            for (index , element) in jobs.enumerated(){

                if visited[index] == true {

                    if element[0] <= currentTime {

                        visited[index] = false
                        heap.enqueue((element[0], element[1]))

                    }

                }

            }

        }

        if heap.isEmpty && visited.contains(true){

            var minValue = -1

            //요청시간이 가능한지 탐색
            for (index , element) in jobs.enumerated(){

                if visited[index] == true {

                    if minValue == -1{
                        currentTime = element[0]
                        minValue = element[0]
                        heap.enqueue((element[0], element[1]))
                        visited[index] = false
                    }
                    else{

                        if element[0] == minValue {
                        heap.enqueue((element[0], element[1]))
                        visited[index] = false
                    }

                    }
                }

            }


        }


    }



    return answer / jobs.count
}

print(solution2(jobs))
