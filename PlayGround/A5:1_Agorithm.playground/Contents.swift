import UIKit

struct A5_KeyStream{

    var x : [Int] = []
    var y : [Int] = []
    var z : [Int] = []

    var initX : Int
    var initY : Int
    var initZ : Int
    
    var checkX = [13, 15 , 17, 18]
    var checkY = [20 , 21]
    var checkZ = [7, 20, 21, 22]
    
    var repeatCnt : Int
    
    var keyStream : [Int] = []
    
    init(x : Int, y : Int, z : Int, plaintext : Int){
        self.initX = x
        self.initY = y
        self.initZ = z
        self.repeatCnt = plaintext
        
        generateXYX()
    }
    
    private mutating func generateXYX(){

        for i in 0..<23{
            
            if i < 19 {
                x.append(Int.random(in: 0...1))
                y.append(Int.random(in: 0...1))
            }
            else if i < 22 {
                y.append(Int.random(in: 0...1))
            }
            
            z.append(Int.random(in: 0...1))
            
        }

    }
    
    private func maj() -> Int{
        
        var zero : Int = 0
        var one : Int = 0
        
        if x[initX] == 0 {
            zero += 1
        }
        else { one += 1}
        
        if y[initY] == 0 {
            zero += 1
        }
        else { one += 1}
        
        if z[initZ] == 0 {
            zero += 1
        }
        else { one += 1}
        
        
        return zero > one ? 0 : 1
    }
    
    private mutating func makeKeyStream() -> Int{
        
        let majNum = maj()
        
        if x[initX] == majNum {
            xorCalcu(step: &x, list: checkX)
        }
        
        if y[initY] == majNum {
            xorCalcu(step: &y, list: checkY)
        }
        
        if z[initZ] == majNum {
            xorCalcu(step: &z, list: checkZ)
        }
        
        //마지막 XOR 연산
        
        return x[x.count - 1] ^ y[y.count - 1] ^ z[z.count - 1]
        
    }
    
    private func xorCalcu(step : inout [Int] , list : [Int]){
        
        var num = step[list[0]]
        
        for index in 1..<list.count{
            
            num = num ^ step[list[index]]
            
        }
        
        //shift
        
        for index in stride(from: step.count - 2, to: -1, by: -1){
            step.swapAt(index, index + 1)
        }
            
        step[0] = num
        
    }
    
    mutating func returnKeyStream() -> [Int] {
        
        for _ in 0..<repeatCnt{
            let num = makeKeyStream()
            keyStream.append(num)
        }
        
        return keyStream
        
    }
    
    func makeChiperText(inputText : String) -> Int{
        
        var inputText = inputText
        
        guard !keyStream.isEmpty else {return -1}
        
        if inputText.count < repeatCnt {
            let temp = String(repeating: "0", count: repeatCnt - inputText.count)
            inputText = temp + inputText
        }
        
        let binaryText = inputText.map { (char) -> Int in
            return Int(String(char))!
        }
        
        var answer : String = ""
        
        for index in 0..<repeatCnt{
            let num = binaryText[index] ^ keyStream[index]
            answer += String(num)
        }
                
        return Int(answer , radix: 2)!
        
    }
        
}

var plainText : String = String(20, radix: 2)

var A5 = A5_KeyStream(x: 8, y: 10, z: 10, plaintext: plainText.count )

A5.x
A5.y
A5.z

let keyStream = A5.returnKeyStream()

A5.x
A5.y
A5.z

let 암호문 = A5.makeChiperText(inputText: plainText)

let 해독문 = A5.makeChiperText(inputText: String(암호문, radix: 2))

