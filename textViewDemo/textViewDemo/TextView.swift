//
//  textView.swift
//  textViewDemo
//
//  Created by Lee on 2019/7/30.
//  Copyright © 2019 demo. All rights reserved.
//

import Cocoa

class TextView: NSTextView {
    private var insertionPointWidth: CGFloat = 2;
    required init?(coder: NSCoder) {
        super.init(coder: coder);
        self.layoutManager?.allowsNonContiguousLayout = true;
        self.font = NSFont.systemFont(ofSize: 16);//.AppleSystemUIFont
    }
    
    override func drawInsertionPoint(in rect: NSRect, color: NSColor, turnedOn flag: Bool) {
        var newRect = rect;
        newRect.size.width = self.insertionPointWidth;
        newRect.origin.x -= self.insertionPointWidth / 2;
        super.drawInsertionPoint(in: newRect, color: color, turnedOn: flag);
    }
    
    override func setNeedsDisplay(_ rect: NSRect, avoidAdditionalLayout flag: Bool) {
        var newInvalidRect = rect;
        newInvalidRect.size.width += self.insertionPointWidth - 1;
        newInvalidRect.origin.x -= self.insertionPointWidth / 2;
        super.setNeedsDisplay(newInvalidRect, avoidAdditionalLayout: flag);
    }
}
