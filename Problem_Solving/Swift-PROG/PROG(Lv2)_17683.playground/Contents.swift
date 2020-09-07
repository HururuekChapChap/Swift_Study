import UIKit

func solution(_ m:String, _ musicinfos:[String]) -> String {
    
    var answer : [(time: Int, name : String, index : Int)] = []
    
    //실제로 재생된 음악을 가져오자
    var musicList : [(start : String, end : String, name : String, rithym : String)] = []
    
    let newMusicinfos = musicinfos.map { (element) -> [String] in
        return element.components(separatedBy: ",")
    }
    
    
    for element in newMusicinfos {
    
            let start = element[0]
            let end = element[1]
            let name = element[2]
            let rithym = element[3]
            
            musicList.append((start, end, name, rithym))
 
    }
    
    
    //음을 나눠준다.
    let temp = Array(m).map { (char) -> String in
        return String(char)
    }
    
    let rememberMusic = makeMlist(temp)
    
    print(rememberMusic)
//    print(musicList)
    
    
    for element in musicList {
        
        
        let start = element.start.components(separatedBy: ":")
        let end = element.end.components(separatedBy: ":")
        let name = element.name
        let rithym = element.rithym.map { (char) -> String in
            return String(char)
        }
    
        //시간 계산
        let minute = (Int(end[0])! * 60 + Int(end[1])!) - (Int(start[0])! * 60 + Int(start[1])!)
//        print(minute , rithym.count)
        
        
        var originMusict = makeMlist(rithym)
            
        if minute - originMusict.count > 0 {
            originMusict = makeMusic(minute, originMusict)
        }

        print(originMusict)
        var flag = false
        for (index, single) in originMusict.enumerated() {
            
            if single == rememberMusic[0] && originMusict.count - index >= rememberMusic.count {
               
                var go = index
                
                for go2 in 0..<rememberMusic.count {
                    
                    if originMusict[go] != rememberMusic[go2] {
//                        print("go : \(go) \(originMusict[go]) \(rememberMusic[go2])")
                        break
                    }
                    
                    if go2 == rememberMusic.count - 1{
//                        print("YES")
                        
                        answer.append((minute, name, answer.count))
                        flag = true
                    }
                    
                    go += 1
                    
                }
                
            }
            
            if flag {
                break
            }
            
        }
        
        
    }
    
    answer = answer.sorted(by: { (element1, element2) -> Bool in
        return element1.time > element2.time

    })

    print(answer)
    
    return !answer.isEmpty ? answer.first!.name : "(None)"
    
}

func makeMusic(_ minute : Int ,_ origin : [String]) -> [String] {
    
    var newRithym : [String] = []
    
    let repeatCnt = minute / origin.count
    
    for _ in 0..<repeatCnt {
        newRithym += origin
    }
    
    
     newRithym += origin[0..<(minute % origin.count)]
    
    return newRithym
    
}


func makeMlist(_ temp : [String]) -> [String] {
    
    var mList : [String] = []
    
    var index = 0
    while index < temp.count {
        
        var twoWord = ""
        
        if index < temp.count - 1 {
        
            twoWord = temp[index] + temp[index + 1]
    
        }
        else{
            twoWord = temp[index]
        }
        
        if twoWord == "C#" || twoWord == "D#" || twoWord == "F#" || twoWord == "G#" || twoWord == "A#" {
            
            mList.append(twoWord)
            
            index += 2
        }
        else{
            
            mList.append(temp[index])
            index += 1
        }
        
        
    }
    
    return mList
    
}


let m = "cdcdf"

let musicinfo = ["04:00,04:02,ZERO,cdcdcdf"]

print(solution(m, musicinfo))




