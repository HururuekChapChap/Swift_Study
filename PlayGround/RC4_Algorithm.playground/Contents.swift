import UIKit

var S : [Int] = Array(0..<256)
var K : [String] = []

var key = "RC4"
var inputText = "Homework"

var key_StreamBytes : [Int] = []


func 초기화함수(){
    
    let keyList = Array(key).map { (char) -> String in
        return String(char)
    }
    
    for i in 0..<256 {
        
        K.append(  keyList[i % keyList.count ] )
        
    }
    
    print("Key문을 반복해서 255개의 Key 배열 생성")
    print(K)
    print()
    
    셔플함수()
    
}

func 셔플함수(){
    
    var j = 0
    
    for i in 0..<256 {
        
        j = (j + S[i] + Int(Character( K[i] ).asciiValue!) ) % 256
        
        S.swapAt(i, j)
    }
    
    print("Key 글자 하나하나를 중심으로 S를 섞음 ")
    print(S)
    print()
    
}

func 대칭키만들기함수(){
    
    var i = 0
    var j = 0
    
    for _ in 0..<inputText.count {
        
        i = (i + 1) % 256
        j = (j + S[i] ) % 256
        S.swapAt(i, j)
        
        let t = (S[i] + S[j] ) % 256
        
        key_StreamBytes.append(S[t])
        
    }
    
    print("암호문과 복호문의 대칭키인 KeyStream을 만듬")
    print(key_StreamBytes)
    print()
    
}

func 암호화함수() -> [Int]{
    
    var counter = 0
    let plainText = Array(inputText)
    var 암호코드 : [Int] = []
    var 암호문 : String = ""
    
    for element in key_StreamBytes{
        
        암호코드.append( Int(plainText[counter].asciiValue!) ^ S[element] )
        암호문 += String (UnicodeScalar(암호코드[counter])!)
        counter += 1
    }
    
    print("암호문 : \(암호문)")
    
    return 암호코드
    
}

func 복호화함수(암호코드 : [Int] ){
    
    var counter = 0
    var 복호문 : String = ""
    for element in key_StreamBytes {
        
        let 복호코드 = 암호코드[counter] ^ S[element]
        복호문 += String (UnicodeScalar(복호코드)!)
        
        counter += 1
    }
    
    print("복호문 : \(복호문)")
    
}

초기화함수()
대칭키만들기함수()

let 암호코드 = 암호화함수()
복호화함수(암호코드: 암호코드)


