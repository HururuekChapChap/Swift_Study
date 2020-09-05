import UIKit

func solve(_ arr : [Int]) -> [Int]{
    
    
    print(arr)
    if arr.count == 2 {
        
        return [arr[0] - arr[1]]
        
    }
    
    
    let minusFoward = arr[0] - solve(Array(arr[1..<arr.count])).min()!
    
    let minusBackward = solve(Array(arr[0..<arr.count - 1])).max()! - arr[arr.count - 1]

    
    if arr.count % 2 == 0 {
        
        let minusMiddle = solve(Array(arr[0..<arr.count/2])).max()! - solve(Array(arr[arr.count/2..<arr.count])).min()!
        
//        print([minusFoward, minusMiddle , minusBackward])
        return [minusFoward, minusMiddle , minusBackward]
    }
    
    print("결과" , [minusFoward , minusBackward])
    return [minusFoward , minusBackward]
}

let array : [Int] = [1, 17, 29, 47, 33]

print(solve(array))

