import UIKit

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    
    var ranking :[(rate : Double , index : Int)] = []
    
    let sortedStages = stages.sorted(by: <)
    
    var cnt : Int = 0
    var index = 0
    
    for stage in 1...N{
    
        while index < sortedStages.count && stage >= sortedStages[index]{
            cnt += 1
            index += 1
        }
        
        
        ranking.append((rate: Double(cnt) / Double(cnt + sortedStages.count - index ), index: stage))
        cnt = 0
        
    }
    ranking = ranking.sorted(by: { (element1, element2) -> Bool in
        
        if element1.rate == element2.rate {
            return element1.index < element2.index
        }
        
        return element1.rate > element2.rate
    })
    
    return ranking.map { (element) -> Int in
        return element.index
    }
    
}

let N : Int = 4
let stages : [Int] = [4,4,4,4,4]
print(solution(N, stages))


