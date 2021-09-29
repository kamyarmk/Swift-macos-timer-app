//
//  ViewController.swift
//  test-timer
//
//  Created by Kamyar on 9/26/21.
//  Copyright © 2021 Kamyar. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var CountHolder: NSTextField!
    
    @IBOutlet weak var CounterFlag: NSButton!
    
    var timer = Timer()
    var runCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        
        }
    }
    
    @objc func SecCounter(timer: TimeInterval){
        print("Timer fired!")
        runCount += 1
        CountHolder.stringValue = String(runCount)
    }

    @IBAction func CounterStart(_ sender: Any) {
        if(CounterFlag.intValue == 1){
            timer = Timer.scheduledTimer(
                timeInterval: 1.0, target: self, selector: #selector(SecCounter),
                userInfo: nil, repeats: true)
        }else{
            timer.invalidate();
        }
    }
    
}

