//
//  ArrowView.swift
//  CustomShape
//
//  Created by Sundar Moorthi on 2/20/17.
//  Copyright © 2017 Sundar Moorthi. All rights reserved.
//

import UIKit

class ArrowView: UIView {
    
    @IBInspectable var FrontCornerEnable : Bool = true
    @IBInspectable var BackCornerEnable : Bool = false
    
    @IBOutlet weak var tabbutton : UIButton!
    
    let arrowLayer = CAShapeLayer()
    
    /*
     Only override draw() if you perform custom drawing.
     An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
         Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        arrowLayer.frame = self.bounds
        self.layer.addSublayer(arrowLayer)
        
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        arrowLayer.frame = self.bounds
        updateArrowLayer()
        
        bringSubview(toFront: tabbutton)

    }
    
    func updateArrowLayer(){
       
        let size = self.bounds.size
        
        let w = size.width - 20//size.width * 0.9      // adjust the multiplier to taste
        
        let p1 = self.bounds.origin
        let pBackMiddle = CGPoint(x: 20, y: size.height/2)
        let p2 = CGPoint(x:p1.x , y:p1.y + size.height)
        var p3 = CGPoint(x:p2.x + w, y:p2.y)
        let pFrontMiddle = CGPoint(x:size.width, y:size.height/2)
        var p4 = CGPoint(x:p1.x + w, y:p1.y)
        
        // create the path
        let path = UIBezierPath()
        path.move(to: p1)
        
        if BackCornerEnable{
            path.addLine(to: pBackMiddle)

        }
        
        path.addLine(to: p2)
        
        
        if FrontCornerEnable{
            path.addLine(to: p3)
            path.addLine(to: pFrontMiddle)
            path.addLine(to: p4)

        }else{
            p3 = CGPoint(x: p2.x + size.width, y:p2.y )
            p4 = CGPoint(x: p1.x + size.width, y: p1.y)
            
            path.addLine(to: p3)
            path.addLine(to: p4)
        }
        
        path.lineWidth  = 2.0
        path.close()
        
        arrowLayer.path = path.cgPath
        arrowLayer.strokeColor = UIColor.gray.cgColor
        arrowLayer.lineWidth = 2
        
        arrowLayer.fillColor = UIColor.clear.cgColor
        
    }
    
    func handleSelection(isSelected : Bool){
        
        if !isSelected {
            self.arrowLayer.fillColor = UIColor.gray.cgColor
        }else{
            self.arrowLayer.fillColor = UIColor.clear.cgColor
        }
        
    }

}
