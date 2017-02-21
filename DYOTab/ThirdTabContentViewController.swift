//
//  ThirdTabContentViewController.swift
//  DYOTab
//
//  Created by AUGMENTe on 2/20/17.
//  Copyright © 2017 augmente. All rights reserved.
//

import UIKit

@objc protocol thirdTabContentDelegate {
    
    func moveTo(page : Int)
}

class ThirdTabContentViewController: UIViewController {
    
    weak var delegate : thirdTabContentDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnClicked(){
        self.delegate?.moveTo(page: 2)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
