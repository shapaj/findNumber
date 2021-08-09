//
//  StartViewController.swift
//  ownAPP
//
//  Created by Ihor Shovkoplias on 30.07.2021.
//

import UIKit

class StartViewController: UIViewController {

    
    let player = CurentUser.shared
    @IBOutlet weak var loginTextFild: UITextField!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var startWhiteGameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
    }
    
    @IBAction func ChangeLogin(_ sender: UITextField) {
        player.userName = sender.text ?? ""
    }
    @IBAction func changeTime(_ sender: UISlider) {
        player.timeFoPlay = sender.value
    }
    @IBAction func startWiteGame(_ sender: UIButton) {
        
    }
    
}
