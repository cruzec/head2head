//
//  ViewController5.swift
//  head2head
//
//  Created by John Lee on 12/13/17.
//  Copyright © 2017 John Lee. All rights reserved.
//

import UIKit

class ViewController5: UIViewController {

    @IBOutlet weak var displayTeam: UILabel!
    
    @IBOutlet weak var displayTeam1: UILabel!
    @IBOutlet weak var displayTeam1Points: UILabel!
    @IBOutlet weak var displayTeam2: UILabel!
    @IBOutlet weak var displayTeam2Points: UILabel!
    
    var timer = Timer()
    var time = 3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var teamOnePoints = Int(GameState.teamOne["points"]!)!
        var teamTwoPoints = Int(GameState.teamTwo["points"]!)!
        
        if(teamOnePoints > teamTwoPoints){
            displayTeam.text = GameState.teamOne["name"]! + " wins!"
        }
        else if (teamTwoPoints > teamOnePoints) {
            displayTeam.text = GameState.teamTwo["name"]! + " wins!"
        }
        else {
            displayTeam.text = "TIE"
        }
        
        displayTeam1.text = GameState.teamOne["name"]
        displayTeam1Points.text = GameState.teamOne["points"]
        displayTeam2.text = GameState.teamTwo["name"]
        displayTeam2Points.text = GameState.teamTwo["points"]
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
    }
    
    
    @objc func processTimer() {
        if time == 0 {
            timer.invalidate()
            self.performSegue(withIdentifier: "goSix", sender: self)
        }
        else{
            time -= 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
