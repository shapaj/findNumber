//
//  GameViewController.swift
//  FindNumbers
//
//  Created by Ihor Shovkoplias on 13.07.2021.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var buttonRestart: UIButton!
    @IBOutlet weak var curentValue: UILabel!
    
    @IBOutlet weak var timerLable: UILabel!
    @IBOutlet var buttons: [UIButton]!
  

    lazy var newGame = NewGame(countItems: buttons.count, timeForGame: 30) { [weak self] status  , time in
        
        guard let self = self else{return}
        self.timerLable.text = "\(time)"
    }
      
    
    //@IBOutlet weak var button1: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
            
        setUpScreen()
        
    }
    
    @IBAction func pressRestart(_ sender: Any) {
      
        newGame = NewGame(countItems: buttons.count, timeForGame: 30) { [weak self] status  , time in
            
            guard let self = self else{return}
            self.timerLable.text = "\(time)"
        }
        viewDidLoad()
        
    }
    
    @IBAction func pressButton(_ sender: UIButton) {
        
        guard let index = buttons.firstIndex(of: sender) else {return}
        guard let title:String = sender.currentTitle else {return}
        
        sender.isHidden = newGame.checkItem(index: index, title: title)
        
       //if buttons[index].currentTitle == newGame.currentItem?.title
        if newGame.victory{
            curentValue.text = "victory"
            
        }else{
            curentValue.text = newGame.currentItem?.title
        }
   
    }
   

    private func setUpScreen(){
     
        let items = newGame.items
        curentValue.text = newGame.currentItem?.title
        for index in newGame.items.indices{
            
            let title:String = String(items[index].title)
           
            buttons[index].setTitle(title, for: .normal)
           
            buttons[index].isHidden = false
        }
        
        
    }
}
