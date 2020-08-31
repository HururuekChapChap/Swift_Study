import UIKit


class Solution2 {
    
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        
        var currentX : Int = 0
        var currentY : Int = 0
        var direction : String = "N"
        
        var maxEuclid : Int = 0
        
        for element in commands {
            
            if element == -1 {
                
                if direction == "N"{
                    direction = "E"
                }
                else if direction == "S"{
                    direction = "W"
                }
                else if direction == "W"{
                    direction = "N"
                    
                }
                else if direction == "E"{
                    direction = "S"
                }
                
                
            }
            else if element == -2{
                
                if direction == "N"{
                    direction = "W"
                }
                else if direction == "S"{
                    direction = "E"
                }
                else if direction == "W"{
                    direction = "S"
                }
                else if direction == "E"{
                    direction = "N"
                }
                
            }
            else{
                
                if direction == "N"{
                    movePoint(element, "N", &currentX, &currentY, obstacles)
                }
                else if direction == "S"{
                    movePoint(element, "S", &currentX, &currentY, obstacles)
                }
                else if direction == "W"{
                    movePoint(element, "W", &currentX, &currentY, obstacles)
                }
                else if direction == "E"{
                    movePoint(element, "E", &currentX, &currentY, obstacles)
                }
                
                
            }
            
            print(currentX , currentY , direction)
            
            maxEuclid = max(maxEuclid ,  currentX * currentX + currentY * currentY)
            
        }
        
            
        return maxEuclid
    }
    
    func movePoint(_ times : Int,_ command : String , _ X : inout Int , _ Y : inout Int ,_ obstacles : [[Int]]){
        
        var endX : Int = X
        var endY : Int = Y
        
        var minX = 0
        var maxX = 0
               
        var minY = 0
        var maxY = 0
        
             if command == "N"{
                   endY = Y + times
                
                minX = min(X,endX)
                maxX = max(X, endX)
                       
                 minY = min(Y + 1,endY)
                 maxY = max(Y + 1,endY)
                  }
             else if command == "S"{
                    endY = Y - times
                
                minX = min(X,endX)
                maxX = max(X, endX)
                                      
                minY = min(Y - 1,endY)
                maxY = max(Y - 1,endY)
                  }
             else if command == "W"{
                     endX = X - times
                minX = min(X - 1,endX)
                maxX = max(X - 1, endX)
                                      
                minY = min(Y,endY)
                maxY = max(Y,endY)
                  }
             else if command == "E"{
                    endX = X + times
                minX = min(X + 1,endX)
                maxX = max(X + 1, endX)
                                      
                minY = min(Y,endY)
                maxY = max(Y,endY)
                  }

        // print(minX , maxX , minY , maxY)
        
        for element in obstacles {
            
            if element[0] >= minX && element[0] <= maxX && element[1] >= minY && element[1] <= maxY {
                
                
                if command == "N"{
                        Y = element[1] - 1
                }
                else if command == "S"{
                        Y = element[1] + 1
                }
                else if command == "W"{
                        X = element[0]  + 1
                }
                else if command == "E"{
                        X = element[0] - 1
                }
        
                return
            }
            
        }
        
        X = endX
        Y = endY
    }
    
}




class Solution {
    
    func robotSim(_ commands: [Int], _ obstacles: [[Int]]) -> Int {
        
        var currentX : Int = 0
        var currentY : Int = 0
        var direction : String = "N"
        
        var maxEuclid : Int = 0
        
        var obx:[Int:[Int]] = [:]
        var oby:[Int:[Int]] = [:]
               
        for array in obstacles{
            
                   if obx[array[0]] == nil{
                       obx[array[0]] = [array[1]]
                   }else{
                       obx[array[0]]?.append(array[1])
                   }
            
                   if oby[array[1]] == nil{
                       oby[array[1]] = [array[0]]
                   }else{
                       oby[array[1]]?.append(array[0])
                   }
        }
        
        for element in commands {
            
            if element == -1 {
                
                if direction == "N"{
                    direction = "E"
                }
                else if direction == "S"{
                    direction = "W"
                }
                else if direction == "W"{
                    direction = "N"
                    
                }
                else if direction == "E"{
                    direction = "S"
                }
                
                
            }
            else if element == -2{
                
                if direction == "N"{
                    direction = "W"
                }
                else if direction == "S"{
                    direction = "E"
                }
                else if direction == "W"{
                    direction = "S"
                }
                else if direction == "E"{
                    direction = "N"
                }
                
            }
            else{
                
                if direction == "N"{
                    movePoint(element, "N", &currentX, &currentY, obx , oby)
                }
                else if direction == "S"{
                    movePoint(element, "S", &currentX, &currentY,  obx , oby)
                }
                else if direction == "W"{
                    movePoint(element, "W", &currentX, &currentY,  obx , oby)
                }
                else if direction == "E"{
                    movePoint(element, "E", &currentX, &currentY,  obx , oby)
                }
                
                
            }
            
//           print(currentX , currentY , direction)
            
            maxEuclid = max(maxEuclid ,  currentX * currentX + currentY * currentY)
            
        }
        
            
        return maxEuclid
    }
    
    func movePoint(_ times : Int,_ command : String , _ X : inout Int , _ Y : inout Int ,_ obx:[Int:[Int]] = [:], _ oby:[Int:[Int]] = [:]){
        
             if command == "N"{
                
                let filter = obx[X]?.filter({ (element) -> Bool in
                    return element > Y
                    }).sorted(by: <).first
//                print(filter)
                if filter != nil && Y + times >= filter!{
                    Y = filter! - 1
                }
                else{
                    Y = Y + times
                }
              
                
                  }
             else if command == "S"{
                
                  let filter = obx[X]?.filter({ (element) -> Bool in
                      return element < Y
                      }).sorted(by: >).first
//                  print(Y , filter)
                  if filter != nil && Y - times <= filter!{
                      Y = filter! + 1
                  }
                  else{
                      Y = Y - times
                  }
                
                  }
             else if command == "W"{
                
                  let filter = oby[Y]?.filter({ (element) -> Bool in
                      return element < X
                      }).sorted(by: >).first
//                  print(filter)
                  if filter != nil && X - times <= filter!{
                      X = filter! + 1
                  }
                  else{
                      X = X - times
                  }
                
                  }
             else if command == "E"{

               let filter = oby[Y]?.filter({ (element) -> Bool in
                return element > X
                               }).sorted(by: <).first
//                print(filter)
                           if filter != nil && X + times >= filter!{
                               X = filter! - 1
                           }
                           else{
                               X = X + times
                           }
                  }

    }
    
}




let commands : [Int] = [5,4,-1,8,3,4,-1,-1,-2,5,6,-2,6,-1,7,2,8,7,7,9,-1,4,6,9,4,9,3,-2,-2,4,1,2,-1,9,-1,-1,3,-1,6,3,3,1,-1,9,-1,-1,2,8,6,1,9,-2,4,3,9,-2,7,-1,3,9,2,-2,7,3,9,9,9,7,3,2,1,9,-1,8,-1,1,3,2,6,-2,1,3,5,-2,3,6,-1,4,3,6,5,1,2,3,3,5,-1,-1,1,4]
let obstacles : [[Int]] = [[-14,-73],[78,46],[75,20],[-93,-75],[38,-50],[-52,4],[-87,-14],[52,93],[61,-21],[15,7],[-60,-38],[-93,-38],[-37,-76],[-80,-50],[-85,-74],[46,43],[-19,-74],[33,-2],[32,70],[65,58],[-49,-34],[79,-94],[24,17],[-4,-72],[-40,83],[-1,52],[91,-38],[17,41],[72,-7],[-87,20],[37,84],[-9,-96],[-84,-93],[-96,66],[13,-20],[-84,24],[-51,-13],[6,-62],[-65,-61],[-89,64],[77,0],[-60,2],[-29,-83],[-79,33],[26,83],[-66,-34],[66,53],[2,-39],[72,93],[75,61],[78,-39],[86,40],[-85,62],[-73,-8],[-3,-95],[56,-31],[95,-25],[18,20],[-14,-44],[42,59],[84,-38],[-50,90],[-72,90],[82,-22],[-34,-46],[-35,-12],[-24,-69],[41,93],[37,76],[42,-8],[-91,-37],[38,-74],[98,63],[50,53],[98,94],[-65,9],[66,14],[30,33],[-56,-15],[99,-82],[78,-16],[-98,-45],[55,14],[-89,94],[-22,25],[-65,60],[-76,39],[-10,33],[36,-41],[98,-5],[84,-3],[25,-57],[2,-63],[5,66],[-14,86],[-11,-24],[86,51],[-8,22],[30,-46],[2,-68],[18,47],[15,33],[0,21],[-62,35],[88,-63],[-7,29],[-39,39],[-4,35],[50,85],[61,72],[87,54],[-46,-41],[-56,96],[7,-70],[20,22],[73,54],[-69,-5],[-69,-34],[-19,-31],[-20,-100],[-39,21],[-88,-85],[-100,-41],[-41,70],[23,32],[28,27],[69,60],[-65,-27],[-90,8],[57,76],[-6,-36],[-94,18],[81,-18],[15,-81],[24,-94],[-100,57],[-31,58],[32,-88],[-55,-16],[6,93],[78,72],[-12,96],[3,-38],[33,46],[79,-40],[-96,15],[-5,93],[-70,66],[72,-69],[-72,-6],[-90,16],[-79,-33],[15,-84],[-18,53],[11,82],[67,57],[65,-24],[-17,-100],[81,35],[-47,27],[52,94],[83,-88],[64,57],[2,-26],[15,78],[-95,-81],[45,3],[-73,-71],[73,35],[-53,-1],[-30,41],[93,-62],[86,67],[16,99],[-52,-98],[57,50],[49,-67],[-36,90],[64,-23],[-69,71],[-25,-49],[37,77],[49,99],[-42,-39],[84,-74],[60,-85],[-47,-67],[-14,-40],[91,2],[-18,-33],[-49,-12],[87,73],[-27,99],[-37,-36],[-62,-35],[-37,-61],[70,17],[-29,-8],[-33,-17],[68,-59]]

print(Solution().robotSim(commands, obstacles))

print()

//print(Solution2().robotSim(commands, obstacles))


//
//var currentX : Int = 0
//var currentY : Int = 3
//
//Solution().movePoint(5, "W", &currentX, &currentY, obstacles)
//
//print("X : \(currentX)")
//print("Y : \(currentY)")
