//
//  main.swift
//  BOJ_11055
//
//  Created by yoon tae soo on 2020/07/03.
//  Copyright © 2020 yoon tae soo. All rights reserved.
//

import Foundation

let N = Int(readLine()!)!

let list = readLine()?.components(separatedBy: " ").map({ item -> Int in
    return Int(item)!
})

func getLowerBound(_ find : Int ,_ containList : [Int]) -> Int{
    
    var start = 0
    var end = containList.count - 1
    var mid = (start + end) / 2
    
    while start < end {
        
         mid = (start + end) / 2
        
        if containList[mid] < find {

            start = mid + 1
        }
        else {

            end = mid
            
        }
        
    }
    
    return end
    
}


func solution() -> Int{
     
    
    var containList : [Int] = []
    
    for item in list! {
        
        if containList.isEmpty {
            containList.append(item)
        }
        else {
            
            if containList[containList.count - 1] < item {
                    containList.append(item)
            }
            else {
                
                let location = getLowerBound(item, containList)
                
                containList[location] = item

            }
            
        }
        
    }
    
    return containList.count
}

print(solution())






