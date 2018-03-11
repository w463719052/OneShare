//
//  ViewController.swift
//  OneShare
//
//  Created by 王用桂 on 16/3/31.
//  Copyright © 2016年 Wyg. All rights reserved.
//

import UIKit

@available(iOS 8.0, *)
class ViewController: UIViewController,YGRegisterDelegate {
    var shareView = YGShareView()
    var registerView = YGRegisterView()
    var authorView = YGAuthorView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.black
        registerView = YGRegisterView(frame: self.view.bounds)
        registerView.delegate = self
        registerView.myClosure = sendValueClosure
        registerView.myCollect = sendValueCollect
        self.view.addSubview(registerView)
        
        shareView = YGShareView(frame: self.view.bounds)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.leftSwipe(_:)))
        shareView .addGestureRecognizer(leftSwipe)
    
        authorView = YGAuthorView(frame: self.view.bounds)
        let leftSwipe1 = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.leftSwipe(_:)))
        authorView .addGestureRecognizer(leftSwipe1)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func leftSwipe(_ send:UISwipeGestureRecognizer) {
        let transition = CATransition()
        transition.type = "oglFlip"
        transition.subtype = kCATransitionFromBottom
        transition.duration = 1.5
        self.view.layer.add(transition, forKey: nil)
        self.view.addSubview(registerView)
        send.view!.removeFromSuperview()
        if send.view == authorView {
            authorView.removeTextView()
        }
    }
    
    func sendValueClosure(_ string:String)->Void{
        let transition = CATransition()
        transition.type = "rippleEffect"
        transition.subtype = kCATransitionFromBottom
        transition.duration = 1.5
        self.view.layer.add(transition, forKey: nil)
        self.view.addSubview(shareView)
        registerView.removeFromSuperview()
        shareView.showText()
    }
    
    func  sendValueCollect()->Void {
        let transition = CATransition()
        transition.type = "rippleEffect"
        transition.subtype = kCATransitionFromBottom
        transition.duration = 1.5
        self.view.layer.add(transition, forKey: nil)
        self.view.addSubview(authorView)
        registerView.removeFromSuperview()
        self.perform(#selector(ViewController.addAuthorView), with: nil, afterDelay: 1)
    }
    
    func addAuthorView () {
        authorView.loadTextView()
    }
    
    
    func YGRegisterCommunityButtonPressed(_ registerView: YGRegisterView) {
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

