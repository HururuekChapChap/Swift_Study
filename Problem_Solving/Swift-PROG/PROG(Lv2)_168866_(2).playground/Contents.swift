import UIKit

func gcd(_ a: Int, _ b: Int) -> Int {
    let mod: Int = a % b
    return 0 == mod ? min(a, b) : gcd(b, mod)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

func solution(_ w:Int, _ h:Int) -> Int64{
    
    let gcdNum = gcd(w, h)

    let newW = w / gcdNum
    let newH = h / gcdNum
    var minBlock : Int = 0
    
    if newH == 1 && newW == 1 {
        minBlock = 1
    }
    else{
        minBlock = min(newW,newH) * 2
    }
    
    return Int64(w*h) - Int64(minBlock * gcdNum)
}

print(solution(8, 12))
