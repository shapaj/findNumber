//
//  game.swift
//  FindNumbers
//
//  Created by Ihor Shovkoplias on 14.07.2021.
//

import Foundation
enum StatusGame {
    case started
    case victory
    case lose
}

class NewGame{
    struct Item {
        var title:String
        var isFound:Bool = false
        }
    private var currentStatus:StatusGame = .started{
        didSet{
            if currentStatus != .started{
                endGame()
            }
        }
    }
  
    
    private var timeForGame:Int{
        didSet{
            if timeForGame == 0{
                currentStatus = .lose
            }
            updateTimer(currentStatus, timeForGame)
        }
    }
    private var timer:Timer?
    var victory = false
    
    private let data = Array(1...99)
    var items:[Item] = []
    var currentItem:Item?
    private var rightCombination:[Item] = []
    private var countItems:Int
    
    private var updateTimer:((StatusGame, Int)->Void)
   
    init(countItems:Int, timeForGame:Int, updateTimer:@escaping (StatusGame, Int)->Void) {
        
        self.updateTimer = updateTimer
        self.timeForGame = timeForGame
        self.countItems = countItems
        setupGame()
    }
    
    private func setupGame(){
         
        var index = 0
   
        for digit in data.shuffled(){
            let a:String = String(digit)
            let item = Item(title: a)
           
            items.append(item)
            index += 1
            if index == self.countItems{
                break
            }
            
            
        }
        rightCombination = items.shuffled()
        currentItem = rightCombination.removeLast()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block:{ [weak self](_) in
            self? .timeForGame -= 1
             
        })
    }
    
    func checkItem(index:Int, title:String)->Bool{
        
        if items[index].title == currentItem?.title{
            items[index].isFound = true
            self.victory = rightCombination.count == 0
            
            guard !self.victory else {
                currentItem = nil
                return true
            }
            rightCombination = rightCombination.shuffled()
            currentItem = rightCombination.removeLast()
            return true
        }
        
        return false
 
      
    }
    
    private func endGame(){
        timer?.invalidate()
    }
}

