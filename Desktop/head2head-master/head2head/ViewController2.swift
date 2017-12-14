//
//  ViewController2.swift
//  head2head
//
//  Created by John Lee on 12/12/17.
//  Copyright © 2017 John Lee. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var displayRound: UILabel!
    var timer = Timer()
    var time = 3
    
    @IBOutlet weak var displayTimer: UILabel!
    @IBOutlet weak var teamName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayRound.text = String((GameState.turnNumber + 1)/2)
        
        if(GameState.turnNumber % 2 == 0) {
            teamName.text = GameState.teamTwo["name"]!
            self.view.backgroundColor = UIColorFromHex(rgbValue: 0xF25703,alpha: 1)
        }
        else {
            teamName.text = GameState.teamOne["name"]!
            self.view.backgroundColor = UIColorFromHex(rgbValue: 0x4BBBEB,alpha: 1)
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
    }
    
    @objc func processTimer() {
        if time == 1 {
            timer.invalidate()
            self.performSegue(withIdentifier: "goThree", sender: self)
        }
        else{
            time -= 1
            displayTimer.text = String(time)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
    

}
