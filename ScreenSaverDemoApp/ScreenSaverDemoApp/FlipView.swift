//
//  FlipView.swift
//  ScreenSaverDemoApp
//
//  Created by Dinesh Kumar Mutyala on 11/26/19.
//  Copyright © 2019 Dinesh Kumar Mutyala. All rights reserved.
//
import Cocoa
import Foundation

class FlipView : NSView{
    var boundingRect : CGRect!
    var font: NSFont?
    var strValue: String!
    override func draw(_ dirtyRect: NSRect) {
        guard let font = font else{
            return
        }
        NSGradient(colorsAndLocations: (NSColor.black, 0.7), (NSColor.darkGray, 1))?
            .draw(in: bounds, angle: boundingRect.origin.y >= 0 ? 90 : 270)
        strValue.draw(
            with: boundingRect,
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: [.foregroundColor : NSColor.white,
                         .font : font],
            context: nil)
        drawFrame(.white, NSBezierPath(roundedRect: bounds, xRadius: 5, yRadius: 5))
    }
    
    func setValue(value: String, font: NSFont, boundingRect: CGRect){
        self.strValue = value
        self.boundingRect = boundingRect
        self.font = font
    }
}
