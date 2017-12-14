//
//  ViewController.swift
//  head2head
//
//  Created by John Lee on 12/12/17.
//  Copyright © 2017 John Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var teamOne: UITextField!
    @IBOutlet weak var teamTwo: UITextField!
    
    
    @IBAction func submit(_ sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Rotate to Landscape
        func shouldAutorotate() -> Bool {
            return true
        }
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        
        
        restartGame()
        
        print(GameState.teamOne["name"])
        // Shuffle Array
        if(GameState.categoryPointer == 0){
            for _ in GameState.categories["random"]!{
                // generate random indexes that will be swapped
                var (a, b) = (Int(arc4random_uniform(UInt32(GameState.categories["random"]!.count - 1))), Int(arc4random_uniform(UInt32(GameState.categories["random"]!.count - 1))))
                if a == b { // if the same indexes are generated swap the first and last
                    a = 0
                    b = GameState.categories["random"]!.count - 1
                }
                GameState.categories["random"]!.swapAt(a, b)
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(teamOne.text! != "") {
            GameState.teamOne["name"] = teamOne.text!
        }
        
        if(teamTwo.text! != "") {
            GameState.teamTwo["name"] = teamTwo.text!
        }
    }
    
    func restartGame(){
        GameState.teamOne["name"] = "Team1"
        GameState.teamOne["points"] = "0"
        GameState.teamTwo["name"] = "Team2"
        GameState.teamTwo["points"] = "0"
        GameState.turnNumber = 1
    }
    
    
    //keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // close keyboard when user touches outside the keyboard.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

