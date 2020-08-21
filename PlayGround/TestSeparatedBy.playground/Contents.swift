import UIKit

var str = "Hello, playground"

var result = str.components(separatedBy: "l")

print(result)

var temp = "{{a},{abc},{}}"

result = temp.components(separatedBy: "},")
var list : [String] = []
for item in result{
    var tempItem = item
     tempItem =  tempItem.replacingOccurrences(of: "{", with: "")
    tempItem = tempItem.replacingOccurrences(of: "}", with: "")
    tempItem = tempItem.replacingOccurrences(of: ",", with: " ")
    list.append(tempItem)
}

print(list)
