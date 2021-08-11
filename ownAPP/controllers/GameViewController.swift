import UIKit

// White Game
class GameViewController: UIViewController {

    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var labelUser: UILabel!
    
    @IBOutlet weak var labelCurentValue: UILabel!
    
    
    @IBOutlet var gameButtons: [UIButton]!
    
    let player = CurentUser.shared
    var newGame = GameModelIncease()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        labelUser.text = player.userName
        timer.text = "\(newGame.timeForPlay)"
        labelCurentValue.text = "CurentValue"
        
        startGame()
    }
    
    
    @IBAction func onChoseNumber(_ sender: UIButton) {
      
        
    }
    
    func startGame(){
        newGame = GameModelIncease()
        newGame.restartGame(count: gameButtons.count)
        
        
        var index = 0
        for button in newGame.playButtons {
            gameButtons[index].isHidden = !button.visible
            gameButtons[index].setTitle(button.text, for: .normal)
            index += 1
        }
        
    }
}


