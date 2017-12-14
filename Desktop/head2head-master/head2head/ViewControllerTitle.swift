//
//  ViewControllerTitle.swift
//  head2head
//
//  Created by John Lee on 12/13/17.
//  Copyright © 2017 John Lee. All rights reserved.
//

import UIKit

class ViewControllerTitle: UIViewController {

    var timer = Timer()
    var time = 3
    
    @objc func processTimer() {
        if time == 1 {
            timer.invalidate()
            self.performSegue(withIdentifier: "goOne", sender: self)
        }
        else{
            time -= 1
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Rotate to Landscape
//        func shouldAutorotate() -> Bool {
//            return true
//        }
//        let value = UIInterfaceOrientation.landscapeLeft.rawValue
//        UIDevice.current.setValue(value, forKey: "orientation")
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(processTimer), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
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
