import UIKit

func solution(_ purcahse : [String]) -> [Int]{
    
    let cal : [Int] = [0,31,28,31,30,31,30,31,31,30,31,30,31]
    var answer : [Int] = [0,0,0,0,0]
    var dayNmoney : [(day : String , money : Int)] = []
    
    for element in purchase {
        let splitString = element.components(separatedBy: " ")
        dayNmoney.append((splitString[0], Int(splitString[1])!))
    }
  
    for month in 1...12{

        for day in 1...cal[month]{

            var money = 0

            for element in dayNmoney {

                let splitString = element.day.components(separatedBy: "/")
                let splitMonth = Int(splitString[1])!
                let splitDay = Int(splitString[2])!

                var endMonth : Int = splitMonth
                var endDay : Int = splitDay + 29

                if splitDay + 29 > cal[splitMonth] {
                    endMonth = splitMonth + 1
                    endDay = 30 - (cal[splitMonth] - splitDay + 1)
                    

                    if month == splitMonth{
                           
                           if day >= splitDay{
                               money += element.money
                           }
                           
                       }
                       else if month == endMonth{
                           
                           if day <= endDay{
                               money += element.money
                           }
                           
                       }
                    
                }
                else{
                    
                    if month == splitMonth && day >= splitDay && day <= endDay{
                        money += element.money
                    }
                    
                }


            }

            print(month , day , money)

            switch money {
            case 0..<10000:
                answer[0] = answer[0] + 1
            case 10000..<20000:
                answer[1] = answer[1] + 1
            case 20000..<50000:
                answer[2] = answer[2] + 1
            case 50000..<100000:
                answer[3] = answer[3] + 1
            default:
                answer[4] = answer[4] + 1
            }



        }

    }

    print(answer)
    
    
    
    
    return []
}

let purchase : [String] = ["2019/01/30 5000", "2019/04/05 10000", "2019/06/10 20000", "2019/08/15 50000", "2019/12/01 100000"]

solution(purchase)
