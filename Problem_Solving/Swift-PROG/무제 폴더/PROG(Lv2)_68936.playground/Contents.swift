import UIKit

typealias range = (from_x : Int , to_x : Int,from_y : Int, to_y : Int)

var zero = 0
var one = 0

func split(_ start_x : Int,_ end_x : Int,_ start_y : Int , _ end_y : Int , split_num : Int , _ map : [[Int]]){
    
    let list : [range] = [
        (start_x , start_x + split_num, start_y , start_y + split_num),
        (start_x + split_num, end_x, start_y ,  start_y + split_num),
        (start_x , start_x + split_num, start_y + split_num , end_y),
        (start_x + split_num, end_x, start_y + split_num ,  end_y)
    ]
    
//    print(list)
    
    for element in list{
        
        let first_item = map[element.from_y][element.from_x]
        
//        print("split_num : \(split_num) first_item : ", first_item)
        var flag = true
        for y in element.from_y..<element.to_y{
            
            for x in element.from_x..<element.to_x{
                
                if map[y][x] != first_item {
                    flag = false
                    split(element.from_x, element.to_x, element.from_y, element.to_y, split_num: split_num / 2, map)
                    break
                }
                
            }
            
            if !flag {
                break
            }
            
        }
        
        if flag {
            
            if first_item == 0 {
                zero += 1
            }
            else{
                one += 1
            }
            
        }
        
        
    }
    
    
//    print("All Done")
    
}



func solution(_ arr:[[Int]]) -> [Int] {
    
    let len = arr.count
    
   let total =  arr.flatMap { (list) ->  [Int] in
        return list
   }.reduce(0, +)
    
    if total == len * len {
        return [0,1]
    }
    else if total == 0 {
        return [1,0]
    }
    
    split(0, len, 0, len, split_num: len / 2, arr)
    
    return [zero, one]
}

let arr : [[Int]] = [
    [1,1,1,1],
    [1,1,1,1],
    [1,1,1,1],[1,1,1,1]
]

print(solution(arr))
