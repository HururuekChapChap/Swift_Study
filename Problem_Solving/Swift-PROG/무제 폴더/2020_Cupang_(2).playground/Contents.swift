import UIKit

typealias tuple = (using : Bool,cnt : Int)
var kioasDict : [Int : String] = [:]

func solution(_ n : Int , _ customers : [String]) -> Int{
    
    var kioas : [tuple] = Array(repeating: (true , 0), count: n)
    
    var splitData : [[String]] = []
    
    for element in customers{
        
        let temp = element.components(separatedBy: " ")
        splitData.append(temp)
        
    }
    
    for element in splitData{
        
        let arriveMon = element[0].components(separatedBy: "/")
        let time = element[1].components(separatedBy: ":")
        let takeTime = element[2]
        
        
        //빈 키오스 탐색
        var kioasIndex = -1
        
        for i in 0..<n{
            
            if kioas[i].using == true {
                kioasIndex = i
                break
            }
            
        }
        
        //빈 키오스 존재
        if kioasIndex != -1 {
            
            //계산
            let result = timeCalcu(arriveMon, time, take: takeTime)
            
            kioasDict[kioasIndex] = result
            kioas[kioasIndex].cnt += 1
            kioas[kioasIndex].using = false
            
        }
        //존재 안함
        else{
            
            // 키오스가 가장 빨리 끝나는거
            let mostSmall = kioasSmall()
            
            //키오스의 시간을 가진다
            if timeDiff(arriveMon, time, kioas: kioasDict[mostSmall]!) {
                
                let kioasInt = kioasDict[mostSmall]!.components(separatedBy: " ")
                
                let reult = timeCalcu([kioasInt[0],kioasInt[1]], [kioasInt[2],kioasInt[3],kioasInt[4]], take: takeTime)
                
                kioasDict[mostSmall] = reult
                kioas[mostSmall].cnt += 1
                
            }
            //고객의 시간을 가진다
            else{
                
                let result = timeCalcu(arriveMon, time, take: takeTime)
                
                kioasDict[mostSmall] = result
                kioas[mostSmall].cnt += 1
                
            }
            
            
        }
        
    }
    
    var maxValue = 0
    
    for element in kioas{
        
        if element.cnt > maxValue {
            maxValue = element.cnt
        }
        
    }
    
    return maxValue
}

func kioasSmall() -> Int{
    
    var stack : [(Int , Int64)] = []
    
    for element in kioasDict {
        
        let kioasInt = element.value.components(separatedBy: " ").map { (char) -> Int in
            return Int(char)!
        }
        
        let kioasSec : Int64 = Int64(( kioasInt[0] * 1000000000 )) + Int64((kioasInt[1] * 10000000)) + Int64((kioasInt[2]*60*60) + (kioasInt[3]*60) + kioasInt[4])
        
        stack.append((element.key , kioasSec))
    }
    
    stack = stack.sorted(by: { (ele1, ele2) -> Bool in
        return ele1.1 < ele2.1
    })
    
    return stack[0].0
}

func timeDiff(_ month: [String], _ time : [String], kioas : String) -> Bool{
    
    let monthInt = month.map { (char) -> Int in
        return Int(char)!
    }
    let timeInt = time.map { (char) -> Int in
        return Int(char)!
    }
    
    let kioasInt = kioas.components(separatedBy: " ").map { (char) -> Int in
        return Int(char)!
    }
    
    let clientSec = (timeInt[0]*60*60) + (timeInt[1]*60) + timeInt[2]
    let kioasSec = (kioasInt[2]*60*60) + (kioasInt[3]*60) + kioasInt[4]
    
    let clientMon = ( monthInt[0] * 100 ) + monthInt[1]
    let kioasMon = ( kioasInt[0] * 100 ) + kioasInt[1]
    
    //고객이 기다리니 키오스의 시간을 가진다.
    if clientMon <= kioasMon {
        return true
    }
    //키오스의 작업이 끝났다 (고객의 시간으로 가진다.)
    else if clientMon > kioasMon {
        return false
    }
    else {
        
        //고객이 키오스의 시간을 가지게 된다.
        if clientSec <= kioasSec {
            return true
        }
        //고객의 시간으로 가진다.
        else{
            return false
        }
        
    }
    
}

func timeCalcu(_ month: [String], _ time : [String], take : String) -> String{
    
    var monthInt = month.map { (char) -> Int in
        return Int(char)!
    }
    var timeInt = time.map { (char) -> Int in
        return Int(char)!
    }
    
    timeInt[1] += Int(take)!
    
    if timeInt[1] >= 60 {
        timeInt[0] += 1
        timeInt[1] -= 60
    }
    
    if timeInt[0] >= 24 {
        timeInt[0] -= 24
        monthInt[1] += 1
    }
    
    if monthInt[0] == 2 {
        
        if monthInt[1] > 28 {
            monthInt[0] = 3
            monthInt[1] = 1
        }
        
    }
    else if monthInt[0] == 12{
        
        if monthInt[1] > 31 {
            monthInt[0] = 1
            monthInt[1] = 1
        }
        
    }
    else if monthInt[0] == 1 || monthInt[0] == 3 || monthInt[0] == 5 || monthInt[0] == 7 || monthInt[0] == 8 || monthInt[0] == 10 {
        
        if monthInt[1] > 31 {
            monthInt[0] += 1
            monthInt[1] = 1
        }
        
    }
    else{
        
        if monthInt[1] > 30 {
            monthInt[0] += 1
            monthInt[1] = 1
        }
        
        
    }
    
    let result = "\(monthInt[0]) \(monthInt[1]) \(timeInt[0]) \(timeInt[1]) \(timeInt[2])"
 
    
    return result
}

let n = 2

let customers : [String] = ["10/01 23:20:25 30", "10/01 23:25:50 26", "10/01 23:31:00 05", "10/01 23:33:17 24", "10/01 23:50:25 13", "10/01 23:55:45 20", "10/01 23:59:39 03", "10/02 00:10:00 10"]

print(solution(n, customers))


//print(timeCalcu(["12","31"], ["23","50","25"], take: "13"))

//print(timeDiff(["02","01"], ["00","03","25"], kioas: "2 1 0 3 25"))
