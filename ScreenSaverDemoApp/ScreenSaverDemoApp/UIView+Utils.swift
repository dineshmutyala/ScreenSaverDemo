//
//  BaseView.swift
//  ScreenSaverDemoApp
//
//  Created by Dinesh Kumar Mutyala on 11/26/19.
//  Copyright © 2019 Dinesh Kumar Mutyala. All rights reserved.
//

import Cocoa
import Foundation

extension NSView{
    func drawFrame(_ color: NSColor) {
        drawFrame(color,bounds)
    }
    func drawFrame(_ color: NSColor, _ rect: CGRect) {
        let path = NSBezierPath(rect: rect)
        drawFrame(color,path)
    }
    func drawFrame(_ color: NSColor, _ path: NSBezierPath) {
        color.setStroke()
        path.lineWidth = 1.0
        path.stroke()
    }
}
