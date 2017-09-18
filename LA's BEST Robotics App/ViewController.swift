//
//  ViewController.swift
//  LA's BEST Robotics App
//
//  Created by Peter Kaminski on 8/28/17.
//  Copyright © 2017 LA's BEST. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mediumMotorButton(_ sender: UIButton) {
        let json = JSON(["type": "Medium Motor", "power": 50, "rotations": 5, "brake": false])
        let result = json.description
        NSLog(result)
        //let data = result.data(using: String.Encoding.utf8)!
    }
    
    @IBAction func largeMotorButton(_ sender: UIButton) {
        let json = JSON(["type": "Large Motor", "power": 50, "rotations": 5, "brake": false])
        let result = json.description
        NSLog(result)
        //let data = result.data(using: String.Encoding.utf8)!
    }
    
    @IBAction func moveSteeringButton(_ sender: UIButton) {
        let json = JSON(["type": "Move Steering", "steering": 0, "power": 50, "rotations": 5, "brake": false])
        let result = json.description
        NSLog(result)
        //let data = result.data(using: String.Encoding.utf8)!
    }

    @IBAction func moveTankButton(_ sender: UIButton) {
        let json = JSON(["type": "Move Steering", "powerLeft": 50, "powerRight": 50, "rotations": 5, "brake": false])
        let result = json.description
        NSLog(result)
        //let data = result.data(using: String.Encoding.utf8)!
    }
    
    @IBAction func displayButton(_ sender: UIButton) {
        let json = JSON(["type": "Display", "clearScreen": true, "x": 0, "y": 0])
        let result = json.description
        NSLog(result)
        //let data = result.data(using: String.Encoding.utf8)!
    }
    
    @IBAction func soundButton(_ sender: UIButton) {
        let json = JSON(["type": "Sound", "volume": 100, "playType": "repeat"])
        let result = json.description
        NSLog(result)
        //let data = result.data(using: String.Encoding.utf8)!
    }
    
    
}

