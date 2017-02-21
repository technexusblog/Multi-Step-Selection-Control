//
//  FirstTabContentViewController.swift
//  DYOTab
//
//  Created by AUGMENTe on 2/20/17.
//  Copyright © 2017 augmente. All rights reserved.
//

import UIKit

@objc protocol firstTabContentDelegate {
    
    func moveTo(page : Int)
}

class FirstTabContentViewController: UIViewController {

    weak var delegate : firstTabContentDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextBtnClicked(){
        self.delegate.moveTo(page: 2)
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
