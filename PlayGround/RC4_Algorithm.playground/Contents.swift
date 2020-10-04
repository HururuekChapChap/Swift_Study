import UIKit

var S : [Int] = Array(0..<256)
var K : [String] = []

var key = "Ramen"
var inputText = "Rivest"

var key_StreamBytes : [Int] = []


func initRc4(){
    
    let keyList = Array(key).map { (char) -> String in
        return String(char)
    }
    
    for i in 0..<256 {
        
        K.append(  keyList[i % keyList.count ] )
        
    }
    
//    print(K)
    
    shuffleRc4()
    
}

func shuffleRc4(){
    
    var j = 0
    
    for i in 0..<256 {
        
        j = (j + S[i] + Int(Character( K[i] ).asciiValue!) ) % 256
        
        S.swapAt(i, j)
    }
    
//    print(S)
    
}

initRc4()


func makeKeyStreamByte(){
    
    var i = 0
    var j = 0
    
    for counter in 0..<inputText.count {
        
        i = (i + 1) % 256
        j = (j + S[i] ) % 256
        S.swapAt(i, j)
        
        let t = (S[i] + S[j] ) % 256
        
        let key_StreamByte = S[t]
        
        key_StreamBytes.append(S[t])
        
//        let 암호문 =  Int(plainText[counter].asciiValue!) ^ S[key_StreamByte]
//        print( String( UnicodeScalar(암호문)! ) )
        
//        let 복호문 = 암호문 ^ S[key_StreamByte]
//        print( String( UnicodeScalar(복호문)! ) )
//
//        print()
    }
    
}

makeKeyStreamByte()

func Ciper() -> [Character]{
    
    var counter = 0
    let plainText = Array(inputText)
    var 암호문 : [Character] = []
    
    for element in key_StreamBytes{
        
        let 암호코드 =  Int(plainText[counter].asciiValue!) ^ S[element]
        print(UnicodeScalar(암호코드)!)
        암호문.append( Character( UnicodeScalar(암호코드)! ) )
        counter += 1
    }
    
    return 암호문
    
}

let ciper = Ciper()
print(ciper)

func decrypt(암호문 : [Character] ) -> String {
    
    var counter = 0
    var 평문 : String = ""
    
    print(암호문[1].asciiValue)
    
    for element in key_StreamBytes {
        
//        let 평문코드 = Int(ciperText[counter].asciiValue!) ^ S[element]
//        print(평문코드)
//        평문 += String( UnicodeScalar(평문코드)! )
        counter += 1
    }
    
    return 평문
}

print(decrypt(암호문: ciper))
