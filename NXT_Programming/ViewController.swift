//
//  ViewController.swift
//  LA's BEST Robotics App
//
//  Created by Erick Chong on 09/20/17.
//  Copyright © 2017 LA's BEST. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mediumMotorButtonUI: UIButton!
    @IBOutlet weak var largeMotorButtonUI: UIButton!
    @IBOutlet weak var moveSteeringButtonUI: UIButton!
    @IBOutlet weak var moveTankButtonUI: UIButton!
    @IBOutlet weak var soundButtonUI: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        mediumMotorButtonUI.addTarget(self,
                                      action: #selector(dragMM(control:event:)),
                         for: UIControlEvents.touchDragInside)
        mediumMotorButtonUI.addTarget(self,
                                      action: #selector(dragMM(control:event:)),
                         for: [UIControlEvents.touchDragExit,
                               UIControlEvents.touchDragOutside])
        
        largeMotorButtonUI.addTarget(self,
                                      action: #selector(dragLM(control:event:)),
                                      for: UIControlEvents.touchDragInside)
        largeMotorButtonUI.addTarget(self,
                                      action: #selector(dragLM(control:event:)),
                                      for: [UIControlEvents.touchDragExit,
                                            UIControlEvents.touchDragOutside])
        
        moveSteeringButtonUI.addTarget(self,
                                     action: #selector(dragMS(control:event:)),
                                     for: UIControlEvents.touchDragInside)
        moveSteeringButtonUI.addTarget(self,
                                     action: #selector(dragMS(control:event:)),
                                     for: [UIControlEvents.touchDragExit,
                                           UIControlEvents.touchDragOutside])

        moveTankButtonUI.addTarget(self,
                                       action: #selector(dragMT(control:event:)),
                                       for: UIControlEvents.touchDragInside)
        moveTankButtonUI.addTarget(self,
                                       action: #selector(dragMT(control:event:)),
                                       for: [UIControlEvents.touchDragExit,
                                             UIControlEvents.touchDragOutside])
        
        soundButtonUI.addTarget(self,
                                       action: #selector(dragS(control:event:)),
                                       for: UIControlEvents.touchDragInside)
        soundButtonUI.addTarget(self,
                                       action: #selector(dragS(control:event:)),
                                       for: [UIControlEvents.touchDragExit,
                                             UIControlEvents.touchDragOutside])
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
    
    func replaceDraggedButton(type: String, _x: Int, _y: Int) {
        let button = UIButton()
        button.frame = CGRect(x: _x, y: _y, width: 125, height: 100)
        button.setTitle(type, for: UIControlState())
        button.addTarget(self, action: #selector(dragMM(control:event:)), for: UIControlEvents.touchDragInside)
        button.layer.borderColor = UIColor.yellow.cgColor
        button.backgroundColor = UIColor.blue
        button.layer.borderWidth = 1.2
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.tag = 1
        self.view.addSubview(button)
    }
    
    func dragMM(control: UIControl, event: UIEvent) {
        if let center = event.allTouches?.first?.location(in: self.view) {
            control.center = center
        }
        replaceDraggedButton(type: "Medium Motor", _x: 20, _y: 648)
        mediumMotorButton(mediumMotorButtonUI)
    }
    
    func dragLM(control: UIControl, event: UIEvent) {
        if let center = event.allTouches?.first?.location(in: self.view) {
            control.center = center
        }
        replaceDraggedButton(type: "Large Motor", _x: 158, _y: 648)
        largeMotorButton(largeMotorButtonUI)
    }
    
    func dragMS(control: UIControl, event: UIEvent) {
        if let center = event.allTouches?.first?.location(in: self.view) {
            control.center = center
        }
        replaceDraggedButton(type: "Move Steering", _x: 286, _y: 648)
        moveSteeringButton(moveSteeringButtonUI)
    }
    
    func dragMT(control: UIControl, event: UIEvent) {
        if let center = event.allTouches?.first?.location(in: self.view) {
            control.center = center
        }
        replaceDraggedButton(type: "Move Tank", _x: 419, _y: 648)
        moveTankButton(moveSteeringButtonUI)
    }
    func dragS(control: UIControl, event: UIEvent) {
        if let center = event.allTouches?.first?.location(in: self.view) {
            control.center = center
        }
        replaceDraggedButton(type: "Sound", _x: 685, _y: 648)
        soundButton(soundButtonUI)
    }
    
}

