import UIKit

//방법 1
let closurMultiply_One : (Int,Int) -> Int = { (a : Int, b : Int) -> Int in
    return a*b
}
//방법 2 - 이미 정의했기 때문에 내부에 따로 정의할 필요가 없다.
let closurMultiply_Two : (Int,Int) -> Int = { (a,b) in
    return a*b
}
//방법3 - 내부에서 정의하여 외부에서 정의할 필요가 없다.
let closurMultiply_Three = { (a: Int, b: Int) -> Int in
        return a*b
}
//방법4 - 인자값을 첫번째와 두번째를 곲해서 반환한다.
let closurMultiply_Four : (Int,Int) -> Int = {return $0*$1}

print(closurMultiply_One(1,2))
print(closurMultiply_Two(1,2))
print(closurMultiply_Three(1,2))
print(closurMultiply_Four(1,2))

//클로저를 담는 함수 만들기

func operationNum(a:Int, b:Int, oper : (Int,Int) -> Int) -> Int {
    return oper(a,b)
}

print(operationNum(a: 2, b: 4, oper: closurMultiply_Two))

let closurAdd : (Int,Int)->Int = { (a,b) in
        return a+b
}

print(operationNum(a: 4, b: 2, oper: closurAdd))

print(operationNum(a: 10, b: 2, oper: { (a, b) in
    return a*b
}))
