//
//  ViewController.swift
//  LA's BEST Robotics App
//
//  Created by Erick Chong on 09/20/17.
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
        let clientController = ClientController()
        clientController.oldSendDataToServerWith(jsonData: json.description)
        // NSLog(json.description)
        //let data = result.data(using: String.Encoding.utf8)!
    }
    
    @IBAction func largeMotorButton(_ sender: UIButton) {
        let json = JSON(["type": "Large Motor", "power": 50, "rotations": 5, "brake": false])
        let clientController = ClientController()
        clientController.oldSendDataToServerWith(jsonData: json.description)
        // NSLog(json.description)
        //let data = result.data(using: String.Encoding.utf8)!
    }
    
    @IBAction func moveSteeringButton(_ sender: UIButton) {
        let json = JSON(["type": "Move Steering", "steering": 0, "power": 50, "rotations": 5, "brake": false])
        let clientController = ClientController()
        clientController.oldSendDataToServerWith(jsonData: json.description)
        // NSLog(json.description)
        //let data = result.data(using: String.Encoding.utf8)!
    }
    
    @IBAction func moveTankButton(_ sender: UIButton) {
        let json = JSON(["type": "Move Tank", "powerLeft": 50, "powerRight": 50, "rotations": 5, "brake": false])
        let clientController = ClientController()
        clientController.oldSendDataToServerWith(jsonData: json.description)
        // NSLog(json.description)
        //let data = result.data(using: String.Encoding.utf8)!
    }
    
    @IBAction func soundButton(_ sender: UIButton) {
        let json = JSON(["type": "sound", "freq": 100, "duration": 475])
        let clientController = ClientController()
        clientController.oldSendDataToServerWith(jsonData: json.description)
        // NSLog(json.description)
        //let data = result.data(using: String.Encoding.utf8)!
    }
    
    @IBAction func sendJSONButton(_ sender: UIButton) {
        let json: JSON =  ["commands": [["type": "sound", "freq": 450, "duration": 100], ["type": "motor_medium", "revolutions": 4, "duration": 50]], "macAddress": "123"]
        let clientController = ClientController()
        clientController.sendDataToServerWith(jsonData: json.description)
    }
}

