//
//  ViewController3.swift
//  head2head
//
//  Created by John Lee on 12/12/17.
//  Copyright © 2017 John Lee. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var displayRound: UILabel!
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var gotItButton: UIButton!
    @IBOutlet weak var gameTimer: UILabel!
    var timer = Timer()
    var time = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        word.text = GameState.categories["random"]![GameState.categoryPointer]
        
        // shuffle array if pointer reaches array#count
        if(GameState.categoryPointer + 1 == GameState.categories["random"]!.count){
            GameState.categoryPointer = 0
            
            for _ in GameState.categories["random"]!{
                // generate random indexes that will be swapped
                var (a, b) = (Int(arc4random_uniform(UInt32(GameState.categories["random"]!.count - 1))), Int(arc4random_uniform(UInt32(GameState.categories["random"]!.count - 1))))
                if a == b { // if the same indexes are generated swap the first and last
                    a = 0
                    b = GameState.categories["random"]!.count - 1
                }
                GameState.categories["random"]!.swapAt(a, b)
            }
        } else {
            GameState.categoryPointer += 1
        }
        
        
        displayRound.text = String((GameState.turnNumber + 1)/2)
        
        // set background color and image depending on user
        if(GameState.turnNumber % 2 == 0) {
            self.view.backgroundColor = UIColorFromHex(rgbValue: 0xF25703,alpha: 1)
            gotItButton.setImage(UIImage(named: "GOTITB.png"), for: [])
        }
        else {
            self.view.backgroundColor = UIColorFromHex(rgbValue: 0x4BBBEB,alpha: 1)
            gotItButton.setImage(UIImage(named: "GOTIT.png"), for: [])
        }
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)        
    }
    
    @objc func processTimer(){
        if time == 1 {
            time -= 1
            timer.invalidate()
            self.performSegue(withIdentifier: "goFour", sender: self)
        } else {
            time -= 1
            gameTimer.text = String(time)
        }
    }

    
    @IBAction func addPoint(_ sender: UIButton) {
        timer.invalidate()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(time > 0){
            if(GameState.turnNumber % 2 == 0){
                GameState.teamTwo["points"] = String(Int(GameState.teamTwo["points"]!)! + 1)
            } else {
                GameState.teamOne["points"] = String(Int(GameState.teamOne["points"]!)! + 1)
            }
        }
        
        GameState.sessionTimeout = (time == 0) ? true : false
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
