import Foundation

let fileURL = Bundle.main.url(forResource: "input", withExtension: "txt")

let test = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)

let array = test.components(separatedBy: .newlines)

for (_ , element) in array.enumerated(){
    
    if element == ""{break}
    
    let input = element.components(separatedBy: " ")
    
        print(input[0])
        print(input[1])
    
    print(Int(input[0])! + Int(input[0])!)
}

