//
//  ViewController4.swift
//  head2head
//
//  Created by John Lee on 12/13/17.
//  Copyright © 2017 John Lee. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {

    @IBOutlet weak var displayResult: UILabel!
    
    @IBOutlet weak var teamOneName: UILabel!
    @IBOutlet weak var teamOnePoints: UILabel!
    
    @IBOutlet weak var teamTwoName: UILabel!
    @IBOutlet weak var teamTwoPoints: UILabel!
    
    var timer = Timer()
    var time = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayResult.text = (GameState.sessionTimeout) ? "Time Out!" : "Good Job!"
        
        teamOneName.text = GameState.teamOne["name"]!
        teamOnePoints.text = GameState.teamOne["points"]!
        teamTwoName.text = GameState.teamTwo["name"]!
        teamTwoPoints.text = GameState.teamTwo["points"]!
        
        
        if(GameState.turnNumber % 2 == 0) {
            self.view.backgroundColor = UIColorFromHex(rgbValue: 0xF25703,alpha: 1)
        }
        else {
            self.view.backgroundColor = UIColorFromHex(rgbValue: 0x4BBBEB,alpha: 1)
        }
        
        GameState.turnNumber += 1
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
    }
    
    @objc func processTimer(){
        if(time == 0) {
            timer.invalidate()
            if((GameState.turnNumber - 1) == 6){
                self.performSegue(withIdentifier: "goFive", sender: self)
            } else {
                self.performSegue(withIdentifier: "goTwo", sender: self)
            }
        } else {
            time -= 1
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func resetGame(_ sender: UIButton) {
    }
    
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    
}
