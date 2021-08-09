import UIKit

// White Game
class GameViewController: UIViewController {

    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var labelUser: UILabel!
    
    @IBOutlet weak var labelCurentValue: UILabel!
    
    
    @IBOutlet var gameButtons: [UIButton]!
    
    let player = CurentUser.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        labelUser.text = player.userName
        timer.text = "\(player.timeFoPlay)"
        labelCurentValue.text = ""
        
        startGame()
    }
    
    
    @IBAction func onChoseNumber(_ sender: UIButton) {
      
        
    }
    
    func startGame(){
        let newGame = GameModelIncease()
        newGame.restartGame(count: 16)
        
//        var index = 0
//        for button in newGame.playButtons {
//            gameButtons[index].isHidden = !button.visible
//            gameButtons[index].setTitle(button.text
//                                        , for: .normal)
//            index += 1
//        }
        
    }
}


