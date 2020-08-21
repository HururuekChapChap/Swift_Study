import UIKit

/*
let url = URL(string: "https://news.google.com/__i/rss/rd/articles/CBMiL2h0dHBzOi8vd3d3LnpkbmV0LmNvLmtyL3ZpZXcvP25vPTIwMjAwMzI0MDgzNTMz0gEA?oc=5")

if let url = url {
    
    do{
        let contents = try String(contentsOf: url)
        print(contents)
    }
    catch{
        print("Erro")
    }
    
}

let word = "삼성전자가 다음 달 공개할 예정인 차기 갤럭시 S시리즈 중 한 모델로 추정되는 사진(사진)이 유출됐다.해외 개발자 커뮤니티 XDA디벨로퍼는 ‘갤럭시S20플러스’의 실물 사진을 입수했다며 12일(현지시간) 공개했다.."

let letters = Array(word)

var WordList : [String : Int] = [:]

var temp_word : String = ""
for index in 0...letters.count{
    
    
    if index == letters.count{
        
        if(temp_word.count >= 2){
           if let isExist = WordList[temp_word] {
               WordList[temp_word] = isExist + 1
              }
        else{
            WordList[temp_word] = 1
            }
        }
        
    }
    else{
        
        if letters[index] != " "{
            temp_word = temp_word + String(letters[index])
        }
        else{
            
            if(temp_word.count >= 2){
               if let isExist = WordList[temp_word] {
                   WordList[temp_word] = isExist + 1
                  }
            else{
                WordList[temp_word] = 1
                }
            }
            
            temp_word = ""
                       
        }
        
    }
    
    
}

print(WordList)

let temp = WordList.sorted { (first, second) -> Bool in
    
    if first.value == second.value {
        return first.key < second.key
    }
    
    return first.value > second.value
    
}

for word in temp{
    print(word.key)
}

var cnt = 5

for _ in cnt..<10{
    print(cnt)
    cnt = cnt + 1
}
*/

// 정규표현식을 이용하여 값가져오기

let word = "삼성전자가 다음 달 공개할 예정인 차기 갤럭시 S시리즈 중 한 모델로 추정되는 사진(사진)이 유출됐다.해외 개발자 커뮤니티 XDA디벨로퍼는 ‘갤럭시S20플러스’의 실물 사진을 입수했다며 12일(현지시간) 공개했다.."


func RegexArray(word : String) -> [String]{
 
    do {
        
        let regex = try NSRegularExpression(pattern:"[a-zA-Z0-9가-힣][a-zA-Z0-9가-힣]+" , options: .caseInsensitive)
            
        let results = regex.matches(in: word,range: NSRange(word.startIndex..., in: word))
        
        return results.map {
            String(word[Range($0.range, in: word)!])
        }
        
    } catch{
        print("ERR")
    }
    
    return []
    
}

//print(Regex(word: word))


