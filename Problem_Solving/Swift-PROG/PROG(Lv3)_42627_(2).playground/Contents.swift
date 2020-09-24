import UIKit

typealias sequence = (start : Int , time : Int)

func makeMAX(list : inout [sequence], element : sequence){
    
    var start = 0
    var end = list.count - 1
    
    if list.isEmpty {
        list.append(element)
        return
    }
    
    while start <= end {
        
        let mid = (start + end) / 2
        
        if list[mid].time < element.time {
            start = mid + 1
        }
        else{
            end = mid - 1
        }
        
    }
    
    list.insert(element, at: start)
    
}

func makeMIN(list : inout [sequence], element : sequence){
    
    var start = 0
    var end = list.count - 1
    
    if list.isEmpty {
        list.append(element)
        return
    }
    
    while start <= end {
        
        let mid = (start + end) / 2
        
        if list[mid].time < element.time {
            end = mid - 1
        }
        else{
            start = mid + 1
        }
    }
    
    list.insert(element, at: start)
    
}

func solution(_ jobs:[[Int]]) -> Int {
    
    var PriorityQueue : [sequence] = []
    var jobsIndex = 0
    
    let jobs = jobs.sorted { (lhs, rhs) -> Bool in
        
        if lhs[0] == rhs[0]{
            return lhs[1]<rhs[1]
        }
        
        return lhs[0] < rhs[0]
    }
    
    var currentTime = jobs[0][0]
        
    for (index, element) in jobs.enumerated(){
        
        if element[0] == currentTime {
            makeMIN(list: &PriorityQueue, element: (element[0],element[1]))
            jobsIndex = index + 1
        }
        
    }
    
    var answer = 0
    
    while !PriorityQueue.isEmpty {
        
        let minElement = PriorityQueue.removeLast()
        
        let totalTime = currentTime + minElement.time - minElement.start
        answer += totalTime
        currentTime = currentTime + minElement.time
                
        while jobsIndex < jobs.count && jobs[jobsIndex][0] <= currentTime {
            makeMIN(list: &PriorityQueue, element: ( jobs[jobsIndex][0] , jobs[jobsIndex][1] ))
            jobsIndex += 1
        }
        
        if PriorityQueue.isEmpty && jobsIndex < jobs.count {
            currentTime = jobs[jobsIndex][0]
            
            while jobsIndex < jobs.count && jobs[jobsIndex][0] <= currentTime {
                makeMIN(list: &PriorityQueue, element: ( jobs[jobsIndex][0] , jobs[jobsIndex][1] ))
                jobsIndex += 1
            }
            
        }
        
 
    }
    
    return answer / jobs.count
}

let jobs = [[0, 3], [1, 9], [2, 6] , [20,1]]

solution(jobs)



