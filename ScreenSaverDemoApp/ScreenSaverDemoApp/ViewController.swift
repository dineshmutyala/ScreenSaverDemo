//
//  ViewController.swift
//  ScreenSaverDemoApp
//
//  Created by Dinesh Kumar Mutyala on 11/26/19.
//  Copyright © 2019 Dinesh Kumar Mutyala. All rights reserved.
//

import Cocoa
import ScreenSaver

class ViewController: NSViewController {

    private var saver: ScreenSaverView?
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addScreenSaver()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0/30, repeats: true, block: { [weak self] _ in
            if let saver = self?.saver, let view = self?.view{
                saver.frame = view.frame
                saver.animateOneFrame()
            }
        })
    }

    deinit {
        timer?.invalidate()
    }
    
    func addScreenSaver(){
        if let saver = MyScreenSaverView(frame: view.frame, isPreview: false){
            view.addSubview(saver)
            self.saver = saver

        }
    }
}

