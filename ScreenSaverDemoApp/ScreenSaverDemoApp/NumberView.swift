//
//  NumberView.swift
//  ScreenSaverDemoApp
//
//  Created by Dinesh Kumar Mutyala on 11/26/19.
//  Copyright © 2019 Dinesh Kumar Mutyala. All rights reserved.
//

import Foundation
import Cocoa

class NumberView : NSView{
    var value = 0
    var boundingRect : CGRect!
    var font: NSFont?
    var strValue: String!
    var animationDuration: TimeInterval = 2
    
    var topFlipView = FlipView()
    var topFlipViewClone = FlipView()
    var bottomFlipView = FlipView()
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.addSubview(topFlipView)
        self.addSubview(bottomFlipView)
        self.addSubview(topFlipViewClone)
    }
    
    override func draw(_ dirtyRect: NSRect) {
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setValue(value: Int){
        self.value = value
        strValue = String(value)
        font = NSFont.bestFittingFont(for: strValue,
                                      in: bounds,
                                      fontDescriptor: NSFontDescriptor(
                                        fontAttributes: [.name : "Monaco"]))
        
        let infiniteBounds = CGSize(width: CGFloat.infinity, height: CGFloat.infinity)
        boundingRect = strValue.boundingRect(with: infiniteBounds,
                                             options: [.usesLineFragmentOrigin, .usesFontLeading],
                                             attributes: [.font : font!], context: nil)
        
        let slice = boundingRect.divided(atDistance: boundingRect.height / 2, from: .minYEdge)
        
        topFlipView.setValue(value: strValue, font: font!, boundingRect: boundingRect.applying(CGAffineTransform(translationX: 0, y: -boundingRect.height / 2)))
        topFlipView.frame = slice.remainder.insetBy(dx: 1, dy: 2)
        topFlipViewClone.frame = topFlipView.frame
        bottomFlipView.setValue(value: strValue, font: font!, boundingRect: boundingRect)
        bottomFlipView.frame = slice.slice.insetBy(dx: 1, dy: 2)
        dropTop()
    }
    
    private func dropTop(){
        NSAnimationContext.runAnimationGroup({_ in
            
            NSAnimationContext.current.duration = self.animationDuration
            
            topFlipViewClone.animator().setFrameOrigin(NSPoint(x: 0, y: -3 * topFlipViewClone.frame.height))
            
        }, completionHandler:{
            
            self.topFlipViewClone.setValue(value: self.strValue,
                                           font: self.font!,
                                           boundingRect: self.boundingRect.applying(
                                            CGAffineTransform(translationX: 0, y: -self.boundingRect.height / 2)))
        })
    }
}
