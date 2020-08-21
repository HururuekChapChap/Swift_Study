import UIKit

var str = "a B Z"
var n = 25


func solution(_ s:String, _ n:Int) -> String {
    
    var answer : String = ""
    let z = UInt8( UnicodeScalar("z").value )
    let Z = UInt8( UnicodeScalar("Z").value )
    
    let convertList =  s.map { (char) -> String in
        
        var temp : String = String(char)
        
        if ("a"..."z").contains(char){
            
            let number = char.asciiValue! + UInt8(n)
            
            if number > z {
                temp = String(UnicodeScalar( 96 + UInt8(number - z) ))
            }
            else{
                temp = String(UnicodeScalar( char.asciiValue! + UInt8(n) ))
            }
            
            
        }
        else if ("A"..."Z").contains(char){
            
            let number  = char.asciiValue! + UInt8(n)
            
            if number > Z {
                temp = String(UnicodeScalar( 64 + UInt8(number - Z) ))
            }
            else {
                temp = String(UnicodeScalar( char.asciiValue! + UInt8(n) ))
            }
            
        }
        
        return temp
    }
    
    for item in convertList{
            answer += item
    }
    
    
    return answer
}

func solution2(_ s:String, _ n:Int) -> String {
    
    let answer = s.utf8.map { (codeUInt) -> String in
        
        var number = Int(codeUInt)
        
        if (65...90).contains(number){
            
            number = (number + n - 65 ) % 26 + 65
            
        }
        else if (97...122).contains(number){
            
            number = (number + n - 97 ) % 26 + 97
        }
        
        return String(UnicodeScalar(number)!)
    }
    
    return answer.joined()
    
}

print(solution2(str,n))
