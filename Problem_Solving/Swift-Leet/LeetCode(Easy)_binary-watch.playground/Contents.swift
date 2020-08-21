import UIKit

class Solution {
    
    let hourList : [Int] = [1,2,4,8]
    var hourcheck : [Int] = Array(repeating: 0, count: 4)
    let minutesList : [Int] = [1,2,4,8,16,32]
    var minutescheck : [Int] = Array(repeating: 0, count: 6)
    
    var answer : [String] = []
    
    func readBinaryWatch(_ num: Int) -> [String] {
        
        hourCombination(0, num, 0, 0)
        
        return answer
    }
    
    func hourCombination(_ cnt : Int, _ last : Int,_ currentIndex : Int , _ totalHours : Int){
        
        if cnt == last {
            minuteCombination(0, 0 , String(totalHours), 0, 0)
        }
        else{
            
            minuteCombination(0, last - cnt , String(totalHours), 0, 0)
            if currentIndex > 3 {return}
            for index in currentIndex...3{
                
                let nextHour = totalHours + hourList[index]
                
                if nextHour <= 11 && hourcheck[index] == 0 {
                    hourcheck[index] = 1
                    hourCombination(cnt + 1, last, index + 1, nextHour)
                    hourcheck[index] = 0
                }
                
            }
            
        }
        
        
    }
    
    func minuteCombination(_ cnt : Int , _ last : Int, _ hour : String,_ currentIndex : Int , _ totalMinutes : Int){
        
        if cnt == last {
            
          let stringMin = String(totalMinutes)
            
            if stringMin.count < 2 {
                let temp = "\(hour):0\(stringMin)"
                answer.append(temp)
            }
            else{
                let temp = "\(hour):\(stringMin)"
                answer.append(temp)
            }
            
        }
        else{
            
            if currentIndex > 5 {return}
            
            for index in currentIndex...5{
                
               let nextMinutes = totalMinutes + minutesList[index]
                
                if nextMinutes <= 59 && minutescheck[index] == 0 {
                    
                    minutescheck[index] = 1
                    minuteCombination(cnt + 1, last, hour, index + 1 ,nextMinutes)
                    minutescheck[index] = 0
                    
                }
                
            }
            
        }
        
    }
    
    
}

//print(Solution().readBinaryWatch(0))

func readBinaryWatch(_ num: Int) -> [String] {
    var res = [String]()

    func findLEDs(_ h: Int, _ m: Int) -> Int {
        let hc = Array(String(h, radix: 2)).filter { $0 == "1" }.count
        let mc = Array(String(m, radix: 2)).filter { $0 == "1" }.count
        return hc + mc
    }

    for h in 0...11 {
        for m in 0...59 {
            if findLEDs(h, m) == num {
                res.append(String(format: "%d:%02d", h, m))
            }
        }
    }

    return res
}

readBinaryWatch(0)

