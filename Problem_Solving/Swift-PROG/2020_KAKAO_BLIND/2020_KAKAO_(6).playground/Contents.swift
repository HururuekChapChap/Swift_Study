import UIKit

var dict : [Int : [Int]] = [:]


for i in 0...10{
    
    if let exist = dict[1]{
        
        print(exist)
        dict[1]?.append(i)
        
    }
    else{
    
    dict[1] = [i]
        
    }
}

print(dict[1])
