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
    @IBOutlet weak var TimersStack: NSStackView!
    
    @IBOutlet weak var CounterFlag: NSButton!
    
    var timer = Timer()
    var runCount = 0;
    var isStart = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        
        }
    }
    
    @objc func SecCounter(timer: TimeInterval){
        print("Timer Pressed!")
        runCount += 1
        CountHolder.stringValue = String(runCount)
    }

    @IBAction func CounterStart(_ sender: Any) {
        CounterFlag.intValue = 1;
        if(!isStart){
            timer = Timer.scheduledTimer(
                timeInterval: 1.0, target: self, selector: #selector(SecCounter),
                userInfo: nil, repeats: true)
            isStart = true;
        }
    }
    @IBAction func CounterPause(_ sender: Any) {
        CounterFlag.intValue = 1;
        timer.invalidate();
        isStart = false;
    }
    
    @IBAction func CounterStop(_ sender: Any) {
        CounterFlag.intValue = 0;
        timer.invalidate();
        runCount = 0;
        isStart = false;
    }
}

