//
//  GameModelIncease.swift
//  ownAPP
//
//  Created by Ihor Shovkoplias on 29.07.2021.
//

//import Foundation
import UIKit

let user = CurentUser.shared

enum GameStatus {
    case New
    case Started
    case Win
    case Lose
    
}

struct PlayButton {
    var visible:Bool = true
    var text:String = ""
    var collor:UIColor
    init(number:Int, collor:UIColor) {
        self.text = "\(number)"
        self.collor = collor
        
    }
}
class GameModelIncease {
   
    var timeForPlay:Int = Int(CurentUser.shared.timeFoPlay)
    
    let numbers = Array(0...100)
    
    var correctNumbers:[Int] = []
    
    var playButtons:[PlayButton] = []
   
    private var timer:Timer?
    
    var gameStatus:GameStatus = .New
    init() {
        
        
    //timeFoPlay
////        self.timer = Timer.scheduledTimer(timeInterval: 0.01, target: T##Any, selector: T##Selector, userInfo: T##Any?, repeats: Bool)
    }
    
    func restartGame(count:Int){
    
        //var correntNumber:Int?
        
        let allNumbers = self.numbers.shuffled()
        for index in 1...count{
            
            
            self.playButtons.append(PlayButton(number: allNumbers[index], collor: .link))
            
            self.correctNumbers.append(allNumbers[index])
            self.correctNumbers.reverse()
            
        }
        
    }
    
    func checkValue (pikedValue:String) -> Bool{
        
        return true
        
    }
    
    
}
