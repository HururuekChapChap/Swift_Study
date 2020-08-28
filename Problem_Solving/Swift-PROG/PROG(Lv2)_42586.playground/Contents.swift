import UIKit

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var days : [Int] = []
    
    for (index, element)in progresses.enumerated() {
    
        let leftDay =  Int(ceil( Double(100 - element) / Double( speeds[index] ) ))
        
        days.append(leftDay)
    }
    
    print(days)
    var maxDay = days[0]
    var cnt = 0
    var answer : [Int] = []
    
    for index in 0..<days.count {
        
        cnt += 1
        
        if index + 1 == days.count {
        
            answer.append(cnt)
            
        }
        else if  maxDay < days[index + 1] {
            
            answer.append(cnt)
            cnt = 0
            maxDay = days[index + 1]
            
        }
        
    }

        
    return answer
}

let progresses = [1,1,1,1,1,1,2]
let speeds = [1, 1, 1, 1, 1, 1,1]
print(solution(progresses, speeds))


func solution2(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var lastReleaseDate: Int = 0
    var numOfReleases: [Int] = []
    for i in 0..<progresses.count {
        let progress = Double(progresses[i])
        let speed = Double(speeds[i])
        let day = Int(ceil((100 - progress) / speed))
        if day > lastReleaseDate {
            lastReleaseDate = day
            numOfReleases.append(1)
        } else {
            numOfReleases[numOfReleases.count - 1] += 1
        }
    }
    return numOfReleases
}
