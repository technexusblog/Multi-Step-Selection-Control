//
//  CustomView.swift
//  DYOTab
//
//  Created by AUGMENTe on 2/20/17.
//  Copyright © 2017 augmente. All rights reserved.
//

import UIKit

class CustomView : UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        let size = self.bounds.size
        let w = size.width * 0.85      // adjust the multiplier to taste
        
        // calculate the 5 points of the pentagon
//        let newRect = self.bounds.insetBy(dx: 2, dy: 2)
        
//        let p1 = self.bounds.origin
//        let p2 = CGPoint(x:p1.x , y:p1.y + size.height)
//        let p3 = CGPoint(x:p2.x + w, y:p2.y)
//        let p4 = CGPoint(x:size.width, y:size.height/2)
//        let p5 = CGPoint(x:p1.x + w, y:p1.y)
        
        let p1 = self.bounds.origin
        let p2 = CGPoint(x:p1.x , y:p1.y + size.height)
        let p3 = CGPoint(x:p2.x + size.width, y:p2.y)
        let p4 = CGPoint(x:p3.x, y:p1.y)
//        let p5 = CGPoint(x:p1.x + w, y:p1.y)

        
        // create the path
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.addLine(to: p4)
//        path.addLine(to: p5)
//        path.lineWidth  = 2.0
        path.close()
        
        // fill the path
//        UIColor.red.set()
//        path.fill()
        
        UIColor.red.setStroke()
        path.stroke()
    }
}
