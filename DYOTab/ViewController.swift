//
//  ViewController.swift
//  DYOTab
//
//  Created by AUGMENTe on 2/20/17.
//  Copyright © 2017 augmente. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPageViewControllerDelegate,firstTabContentDelegate,secondTabContentDelegate,thirdTabContentDelegate {

    @IBOutlet weak var holderView: UIView!
    
    @IBOutlet weak var sectionViewOne: ArrowView!
    @IBOutlet weak var sectionViewTwo: ArrowView!
    @IBOutlet weak var sectionViewThree: ArrowView!
    
    @IBOutlet weak var widthConstraintSectionOne: NSLayoutConstraint!
    @IBOutlet weak var widthConstraintSectionTwo: NSLayoutConstraint!
    @IBOutlet weak var widthConstraintSectionThree: NSLayoutConstraint!
    
    @IBOutlet weak var heightConstraintForSectionOne: NSLayoutConstraint!
    @IBOutlet weak var heightConstraintForSectionTwo: NSLayoutConstraint!
    @IBOutlet weak var heightConstraintForSectionThree: NSLayoutConstraint!
    
    var selectedTab = 1
    
    var selectedTabWidth : CGFloat = 0
    var unselectedTabWidth : CGFloat = 0
    
    var selectedTabHeight : CGFloat = 0
    var unSelectedTabHeight : CGFloat = 0
    
    
    //PageViewController Variables
    var tabContentPageViewController : UIPageViewController?
    
    private var tabLayoutItems : [UIViewController] = []
    private var identifiersArray : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setPageViewControllerContentViews()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setTabView()

    }

    func setTabView(){
        
        calculateTabsWidth(holderViewWidth: self.holderView.frame.size.width)
        selectedTab(tag: selectedTab, selectedTabWidth: selectedTabWidth, unselectedTabWidth: unselectedTabWidth)

    }
    
    func resetTabView(holderViewWidth : CGFloat){
        
        calculateTabsWidth(holderViewWidth: holderViewWidth)
        selectedTab(tag: selectedTab, selectedTabWidth: selectedTabWidth, unselectedTabWidth: unselectedTabWidth)
    }
    
    func calculateTabsWidth(holderViewWidth : CGFloat){
        
        let tabsTotalWidth = holderViewWidth + 16
        
        selectedTabWidth = tabsTotalWidth * 0.5
        unselectedTabWidth = tabsTotalWidth * 0.25
        
        selectedTabHeight = self.holderView.frame.size.height - 5
        unSelectedTabHeight = self.holderView.frame.size.height - 10
        
    }
    
    func selectedTab(tag : Int,selectedTabWidth : CGFloat,unselectedTabWidth : CGFloat){
        
        if tag == 1 {
            
            UIView.animate(withDuration: 0.2, animations: {
                
                self.widthConstraintSectionTwo.constant = unselectedTabWidth
                self.widthConstraintSectionThree.constant = unselectedTabWidth
                
                self.widthConstraintSectionOne.constant = selectedTabWidth
                
                self.view.layoutIfNeeded()

            }, completion: { (Bool) in
                
                self.sectionViewOne.handleSelection(isSelected: true)
                self.sectionViewTwo.handleSelection(isSelected: false)
                self.sectionViewThree.handleSelection(isSelected: false)

            })
            
            self.heightConstraintForSectionOne.constant = self.selectedTabHeight
            self.heightConstraintForSectionTwo.constant = self.unSelectedTabHeight
            self.heightConstraintForSectionThree.constant = self.unSelectedTabHeight

            
        }else if tag == 2 {
            
            UIView.animate(withDuration: 0.2, animations: {
                
                
                self.widthConstraintSectionOne.constant = unselectedTabWidth
                self.widthConstraintSectionThree.constant = unselectedTabWidth
                
                self.widthConstraintSectionTwo.constant = selectedTabWidth

                self.view.layoutIfNeeded()
            }, completion: { (Bool) in
                
                self.sectionViewTwo.handleSelection(isSelected: true)
                self.sectionViewOne.handleSelection(isSelected: false)
                self.sectionViewThree.handleSelection(isSelected: false)
                
            })
            
            self.heightConstraintForSectionOne.constant = self.unSelectedTabHeight
            self.heightConstraintForSectionTwo.constant = self.selectedTabHeight
            self.heightConstraintForSectionThree.constant = self.unSelectedTabHeight

           
        }else if tag == 3 {

            UIView.animate(withDuration: 0.2, animations: {
                
                self.widthConstraintSectionOne.constant = unselectedTabWidth
                self.widthConstraintSectionTwo.constant = unselectedTabWidth
                
                self.widthConstraintSectionThree.constant = selectedTabWidth
                
                self.view.layoutIfNeeded()
            }, completion: { (Bool) in
                
                self.sectionViewThree.handleSelection(isSelected: true)
                self.sectionViewOne.handleSelection(isSelected: false)
                self.sectionViewTwo.handleSelection(isSelected: false)
                
            })
            
            self.heightConstraintForSectionOne.constant = self.unSelectedTabHeight
            self.heightConstraintForSectionTwo.constant = self.unSelectedTabHeight
            self.heightConstraintForSectionThree.constant = self.unSelectedTabHeight

        }
    }
    
    @IBAction func tabSelceted(_ sender: UIButton) {
        
//        setCurrentTab(tabIndex: sender.tag)
    }
    
    func setCurrentTab(tabIndex : Int){
        
        selectedTab = tabIndex
        selectedTab(tag: selectedTab, selectedTabWidth: selectedTabWidth, unselectedTabWidth: unselectedTabWidth)

    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        resetTabView(holderViewWidth: self.view.frame.height - 10)
    }
    
    
    //MARK: - Segue Methods
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "TabContentPageViewSegue"{
            self.tabContentPageViewController = segue.destination as? UIPageViewController
            self.tabContentPageViewController?.delegate = self
//            self.tabContentPageViewController?.dataSource = self
        }
    }
    
    //MARK: - UIPageViewController Methods
    func setPageViewControllerContentViews(){
        
        let firstTabContentViewController = storyboard?.instantiateViewController(withIdentifier: "FirstTabContentViewController") as! FirstTabContentViewController
        firstTabContentViewController.delegate = self
        tabLayoutItems.append(firstTabContentViewController)
        identifiersArray.append("FirstTabContentViewController")
        
        let secondTabContentViewController = storyboard?.instantiateViewController(withIdentifier: "SecondTabContentViewController") as! SecondTabContentViewController
        secondTabContentViewController.delegate = self
        tabLayoutItems.append(secondTabContentViewController)
        identifiersArray.append("SecondTabContentViewController")
        
        let thirdTabContentViewController = storyboard?.instantiateViewController(withIdentifier: "ThirdTabContentViewController") as! ThirdTabContentViewController
        thirdTabContentViewController.delegate = self
        tabLayoutItems.append(thirdTabContentViewController)
        identifiersArray.append("ThirdTabContentViewController")
        
        createTabLayoutContentViews()
        
    }
    
    func createTabLayoutContentViews(){
        
        if self.tabLayoutItems.count > 0 {
            
            self.tabContentPageViewController?.setViewControllers([self.tabLayoutItems[0]], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
        }
    }
    
    func getTabLayoutItemController(itemIndex : Int) -> UIViewController?{
        
        if itemIndex < self.tabLayoutItems.count {
            
            return self.tabLayoutItems[itemIndex]
            
        }
        
        return nil
    }

    func moveTo(page: Int) {
        
        let pageIndex = page - 1
        
        if self.tabLayoutItems.count > pageIndex {
            
            if selectedTab <  page {
                
                self.tabContentPageViewController?.setViewControllers([self.tabLayoutItems[pageIndex]], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
            }else{
                self.tabContentPageViewController?.setViewControllers([self.tabLayoutItems[pageIndex]], direction: UIPageViewControllerNavigationDirection.reverse, animated: true, completion: nil)
            }
            
            setCurrentTab(tabIndex: page)

        }

    }
    
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        
//        if tabLayoutItems.count > 0{
//            
//            let identifier = viewController.restorationIdentifier
//            let index = self.identifiersArray.index(of: identifier!)
//            
//            if index == 0 {
//                
//                return nil
//            }
//            
//            //decrement the index to get the viewController before the current index
//            return self.getTabLayoutItemController(itemIndex: index! - 1)
//            
//        }
//        
//        return nil
//    }
//    
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//       
//        if tabLayoutItems.count > 0{
//            
//            let identifier = viewController.restorationIdentifier
//            let index = self.identifiersArray.index(of: identifier!)
//            
//            if index == identifiersArray.count - 1 {
//                
//                return nil
//            }
//            
//            //increment the index to get the viewController after the current index
//            return self.getTabLayoutItemController(itemIndex: index! + 1)
//            
//            
//        }
//        
//        return nil
//
//    }
}

