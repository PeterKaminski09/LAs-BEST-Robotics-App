//
//  SocketIOManager.swift
//  LA's BEST Robotics App
//
//  Created by Erick Chong on 9/20/17.
//  Copyright © 2017 LA's BEST. All rights reserved.
//

import UIKit
import SocketIO

class SocketIOManager: NSObject {
    static let socketIO = SocketIOManager()
    var socket: SocketIOClient = SocketIOClient(socketURL: URL(string: "http://192.168.1.XXX:3000")!)
    
    override init() {
        super.init()
    }
    
    func establishConnection() {
        socket.connect()
    }
    
    func closeConnection() {
        socket.disconnect()
    }
}
