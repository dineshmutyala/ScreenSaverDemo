//
//  SeperatorView.swift
//  ScreenSaverDemoApp
//
//  Created by Dinesh Kumar Mutyala on 11/26/19.
//  Copyright © 2019 Dinesh Kumar Mutyala. All rights reserved.
//

import Foundation
import Cocoa

class SeperatorView : NSView{

    var bDrawSeperator = true

    var topBlockFrame = CGRect()
    var bottomBlockFrame = CGRect()
    
    
    override func draw(_ dirtyRect: NSRect) {
        //drawFrame(.red)
        /*
        if(bDrawSeperator){
            drawBlock(topBlockFrame)
            drawBlock(bottomBlockFrame)
        }
         */
    }
    
    private func drawBlock(_ rect: CGRect){
        let top = NSBezierPath(rect: rect)
        NSColor.white.withAlphaComponent(0.1).setFill()
        top.fill()
    }
    
    func toggle(){
        bDrawSeperator = !bDrawSeperator
        if(bDrawSeperator){
            topBlockFrame = CGRect(x: self.bounds.width * 0.2, y: self.bounds.height * 0.7,
                                   width: self.bounds.width * 0.6, height: self.bounds.width * 0.6)
            bottomBlockFrame = topBlockFrame.applying(CGAffineTransform(translationX: 0,
                                                                        y: -self.bounds.height * 0.4 - topBlockFrame.height))
            
        }
    }
}
