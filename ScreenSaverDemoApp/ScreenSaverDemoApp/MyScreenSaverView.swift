//
//  MyScreenSaverView.swift
//  ScreenSaverDemoApp
//
//  Created by Dinesh Kumar Mutyala on 11/26/19.
//  Copyright © 2019 Dinesh Kumar Mutyala. All rights reserved.
//

import ScreenSaver
import CoreGraphics

public class MyScreenSaverView : ScreenSaverView{
    
    var hour10s = 0
    var hour1s = 0
    var minute10s = 0
    var minute1s = 0
    var seconds10s = 0
    var seconds1s = 0

    var prevHour10s = 0
    var prevHour1s = 0
    var prevMinute10s = 0
    var prevMinute1s = 0
    var prevSeconds10s = 0
    var prevSeconds1s = 0

    var frameToDraw : CGRect{
        get{
            return self.frame.insetBy(dx: frame.width * 0.1, dy: frame.height * 0.2)
        }
    }

    var seperatorWidth : CGFloat{
        get{
            return frameToDraw.width * 0.03
        }
    }
    
    var secondsWidth : CGFloat{
        get{
            return frameToDraw.width * 0.17
        }
    }
    
    var remainingWidth : CGFloat{
        get{
            return frameToDraw.width * 0.80
        }
    }

    var hour10sFrame : CGRect{
        get{
            return CGRect(origin: frameToDraw.origin,
                          size: CGSize(width: remainingWidth / 4, height: frameToDraw.height))
        }
    }
    var hour1sFrame : CGRect{
        get{
            return CGRect(origin: hour10sFrame.origin.applying(CGAffineTransform(translationX: hour10sFrame.width, y: 0)),
                          size: hour10sFrame.size)
        }
    }
    
    var seperatorFrame : CGRect{
        get{
             return CGRect(origin: hour1sFrame.origin.applying(CGAffineTransform(translationX: hour1sFrame.width, y: 0)),
                           size: CGSize(width: seperatorWidth, height: frameToDraw.height))
        }
    }
    
    var min10sFrame : CGRect{
        get{
            return CGRect(origin: seperatorFrame.origin.applying(CGAffineTransform(translationX: seperatorFrame.width, y: 0)),
                             size: hour10sFrame.size)
        }
    }

    var min1sFrame : CGRect{
        get{
            return CGRect(origin: min10sFrame.origin.applying(CGAffineTransform(translationX: min10sFrame.width, y: 0)),
                          size: hour10sFrame.size)
        }
    }
    
    var sec10sFrame : CGRect{
        get{
            return CGRect(origin: min1sFrame.origin.applying(CGAffineTransform(translationX: min1sFrame.width, y: 0)),
                             size: CGSize(width: secondsWidth / 2, height: secondsWidth))
        }
    }

    var sec1sFrame : CGRect{
        get{
            return CGRect(origin: sec10sFrame.origin.applying(CGAffineTransform(translationX: sec10sFrame.width, y: 0)),
                          size: sec10sFrame.size)
        }
    }

    var hour10sView = NumberView()
    var hour1sView = NumberView()
    var min10sView = NumberView()
    var min1sView = NumberView()
    var sec10sView = NumberView()
    var sec1sView = NumberView()
    var seperatorView = SeperatorView()

    public override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        self.addSubview(hour10sView)
        self.addSubview(hour1sView)
        self.addSubview(seperatorView)
        self.addSubview(min10sView)
        self.addSubview(min1sView)
        self.addSubview(sec10sView)
        self.addSubview(sec1sView)
        sec1sView.animationDuration = 0.9
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder) is not implemented")
    }
    
    public override func draw(_ rect: NSRect) {
        
        initializeBG(.black)

    }
    
    private func initializeBG(_ color: NSColor){
        let path = NSBezierPath(rect: bounds)
        color.setFill()
        path.fill()
    }

    public override func animateOneFrame() {
        super.animateOneFrame()
        
        let date = Date()
        let calendar = Calendar.current

        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)

        hour10s = hour / 10
        hour1s = hour % 10

        minute10s = minute / 10
        minute1s = minute % 10

        seconds10s = seconds / 10
        seconds1s = seconds % 10
        
        let inset : CGFloat = 0

        updateIfNeeded(prev: &prevHour10s, curr: hour10s, view: hour10sView, frame: hour10sFrame)
        updateIfNeeded(prev: &prevHour1s, curr: hour1s, view: hour1sView, frame: hour1sFrame)

        seperatorView.frame = seperatorFrame.insetBy(dx: inset, dy: inset)
        
        updateIfNeeded(prev: &prevMinute10s, curr: minute10s, view: min10sView, frame: min10sFrame)
        updateIfNeeded(prev: &prevMinute1s, curr: minute1s, view: min1sView, frame: min1sFrame)

        updateIfNeeded(prev: &prevSeconds10s, curr: seconds10s, view: sec10sView, frame: sec10sFrame)
        updateIfNeeded(prev: &prevSeconds1s, curr: seconds1s, view: sec1sView, frame: sec1sFrame, inset: 0)

        setNeedsDisplay(bounds)
    }
    
    private func updateIfNeeded( prev: inout Int, curr: Int, view: NumberView, frame: CGRect, inset: CGFloat = 1){
        if(prev != curr || !view.frame.equalTo(frame.insetBy(dx: inset, dy: inset))){
            prev = curr
            view.frame = frame.insetBy(dx: inset, dy: inset)
            view.setValue(value: curr)
        }
    }
}
