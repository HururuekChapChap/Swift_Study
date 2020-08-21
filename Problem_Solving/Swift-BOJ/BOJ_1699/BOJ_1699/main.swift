//
//  main.swift
//  BOJ_1699
//
//  Created by yoon tae soo on 2020/07/03.
//  Copyright © 2020 yoon tae soo. All rights reserved.
//

import Foundation

let input = Int(readLine()!)!

var cnt : Int = 1

var list : [Int] = [0]

for index in 1...input{
    
    if cnt * cnt == index {
        list.append(1)
        cnt += 1
        continue
    }
    
    var inputNum = index
    var start = 1
    
    while start * start < index {
        inputNum = min(inputNum, list[index - start * start] + 1)
        start += 1
    }
    
//    var temp = index - 1
//    var inputNum = index
//
//    while temp >= (index / 2) {
//
//        inputNum = min(inputNum, list[temp] + list[index - temp])
//        temp -= 1
//    }
    
    list.append(inputNum)
    
}

print(list[input])





