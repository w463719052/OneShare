//
//  YGAuthorView.swift
//  OneShare
//
//  Created by zccl2 on 16/5/13.
//  Copyright © 2016年 Wyg. All rights reserved.
//

import UIKit

@available(iOS 8.0, *)
class YGAuthorView: UIView {
    
    var topScorllerView = YGAutomaticScrollerView()
    var imageView = UIImageView()
    let imageViewWidth:CGFloat = 60
    var messageLbl = UILabel()
    var titleLbl = UILabel()
    
    var myWebView = YGAuthorWebView()
    
    let kViewH:Float = 60
    let kMargin:Float = 20
    
    let textArray = ["作  者  主  页","联  系  方  式","扫  码  下  载"]
    
    var backImageView = UIImageView()
    var authorPassWordView = YGAuthorPassWordView()
    
    var viewArray = NSMutableArray()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
        
        topScorllerView = YGAutomaticScrollerView(frame: CGRect(x: 0, y: 20, width: self.frame.size.width , height: self.frame.size.width*2/3))
        topScorllerView.tag = 11
        topScorllerView.setPictureArray(["1","2","3","4"])
        topScorllerView.backgroundColor = UIColor.white
        self.addSubview(topScorllerView)
        
        imageView = UIImageView(frame: CGRect(x: self.frame.size.width/2-30, y: self.frame.size.width*2/3+40, width: imageViewWidth, height: imageViewWidth))
        imageView.tag = 22
        imageView.backgroundColor = UIColor.white
        imageView.layer.cornerRadius = imageViewWidth/2
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "logo")
        self.addSubview(imageView)
        
        for i in 0 ..< textArray.count {
            let view: UILabel = UILabel(frame: CGRect(x: self.frame.size.width, y: CGFloat(Float(i) * kViewH)+self.frame.size.width*2/3+100, width: self.frame.size.width-40, height: CGFloat(kViewH - 2)))
            view.tag = Int(i)
            view.textColor = UIColor.white
            view.textAlignment = .center
            view.text = textArray[Int(i)]
            view.font = UIFont(name: "经典行楷简", size: 20)
            view.layer.anchorPoint = CGPoint(x: 0, y: 0)
            self.addSubview(view)
            viewArray.add(view)
            
        }
        
        messageLbl = UILabel(frame: CGRect(x: self.frame.size.width-100-20, y: self.frame.size.height-50-20, width: 100, height: 50))
        messageLbl.tag = 33
        messageLbl.text = "王 用 桂 \n2016-05-17"
        messageLbl.textAlignment = .center
        messageLbl.textColor = UIColor.white
        messageLbl.numberOfLines = 2
        messageLbl.layer.cornerRadius = 10
        messageLbl.layer.masksToBounds = true
        messageLbl.font = UIFont(name: "经典行楷简", size: 16)
        messageLbl.isUserInteractionEnabled = true
        self.addSubview(messageLbl)
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(YGAuthorView.longPressMessageView))
        messageLbl.addGestureRecognizer(longPress)
        
        backImageView = UIImageView(frame: self.frame)
        backImageView.tag = 44
        backImageView.backgroundColor = UIColor(red: 37/255, green: 37/255, blue: 37/255, alpha: 0.6)
        backImageView.isUserInteractionEnabled = true
        self.addSubview(backImageView)
        backImageView.alpha = 0
        
        let backTap = UITapGestureRecognizer(target: self, action: #selector(YGAuthorView.backTapPress))
        backImageView.addGestureRecognizer(backTap)
        
        authorPassWordView = YGAuthorPassWordView(frame: CGRect(x: self.frame.size.width/2-110, y: self.frame.size.width*2/3+20, width: 220, height: 150))
        authorPassWordView.tag = 55
        authorPassWordView.backgroundColor = UIColor.black
        authorPassWordView.layer.cornerRadius = 10
        authorPassWordView.layer.masksToBounds = true
        backImageView.addSubview(authorPassWordView)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(YGAuthorView.enterAuthorView(_:)))
        authorPassWordView.logoImageView.addGestureRecognizer(tap)
        
    }
    func enterAuthorView(_ send:UITapGestureRecognizer) -> Void {
        if authorPassWordView.passWordField.text!.isEqual("wyg123") {
            let backgoundView = UIView(frame:self.frame)
            backgoundView.backgroundColor = UIColor.white
            self.addSubview(backgoundView)
      
            
            
            let textView = UITextView(frame: CGRect(x: 0, y: -self.frame.size.height-20, width: self.frame.size.width, height: self.frame.size.height-20))
            textView.backgroundColor = UIColor.white
            UIView.animate(withDuration: 0.5, animations: {
                textView.frame = CGRect(x: 0, y: 20, width: self.frame.size.width, height: self.frame.size.height-20)
                self.addSubview(textView)
            })
            
        }
    }
    
    func backTapPress() {
        UIView.animate(withDuration: 0.6, animations: {
            self.authorPassWordView.frame = CGRect(x: self.frame.size.width/2-110, y: self.frame.size.width*2/3+20, width: 220, height: 150)
            self.backImageView.alpha = 0
        }) 
    }
    
    func longPressMessageView() {
        UIView.animate(withDuration: 0.6, animations: {
            self.authorPassWordView.frame = CGRect(x: self.frame.size.width/2-110, y: self.frame.size.width*2/3+10, width: 220, height: 150)
            self.backImageView.alpha = 1
            self.authorPassWordView.passWordField.becomeFirstResponder()
        }) 
    }
    
    func loadTextView() {
        for i in 0 ..< textArray.count {
            self.perform(#selector(YGAuthorView.animationWithIndex(_:)), with: "\(i)", afterDelay: 0.2 * Double(i))
        }
    }
    
    func removeTextView() {
        for view: UIView in self.subviews {
            if view.tag < 10 {
                view.isHidden = true
            }
        }
    }
    
    func animationWithIndex(_ iString: String) {
        let i:Float = CFloat(iString)!
        let view:UIView = viewArray[Int(i)] as! UIView
        view.isHidden = false
        let animation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "position")
        animation.duration = 1.0
        let value1: NSValue = NSValue(cgPoint: CGPoint(x: self.frame.size.width, y: CGFloat(i * kViewH)+self.frame.size.width*2/3+100))
        let value2: NSValue = NSValue(cgPoint: CGPoint(x: CGFloat(20-kMargin), y: CGFloat(i * kViewH)+self.frame.size.width*2/3+100))
        let value3: NSValue = NSValue(cgPoint: CGPoint(x: CGFloat(20+kMargin), y: CGFloat(i * kViewH)+self.frame.size.width*2/3+100))
        let value4: NSValue = NSValue(cgPoint: CGPoint(x: 20, y: CGFloat(i * kViewH)+self.frame.size.width*2/3+100))
        animation.values = [value1, value2, value3, value4]
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        view.layer.add(animation, forKey: nil)
    
        let button1:UIButton = UIButton()
            
        button1.frame = CGRect(x: 20, y: CGFloat(i * kViewH)+self.frame.size.width*2/3+100,width: self.frame.size.width-40, height: CGFloat(kViewH - 2))
        button1.addTarget(self, action: #selector(YGAuthorView.tapPress(_:)), for: .touchUpInside)
        button1.tag = Int(i)
        self.addSubview(button1)
    }
    
    func tapPress(_ send:UIButton) -> Void {
        if send.tag == 0 {
            myWebView = YGAuthorWebView(frame:self.frame)
            let backButton = UIButton(frame:CGRect(x: 0, y: 0, width: 40, height: 40))
            backButton.setTitle("返回", for: UIControlState())
            backButton.titleLabel?.font = UIFont .systemFont(ofSize: 8)
            backButton.addTarget(self, action: #selector(YGAuthorView.backButtonPress), for: .touchUpInside)
            myWebView.addSubview(backButton)
            self.addSubview(myWebView)
            let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(YGAuthorView.leftSwipe(_:)))
            myWebView .addGestureRecognizer(leftSwipe)
        } else if send.tag == 1 {
            let tokeView = YGContactInformationView(frame:self.frame)
            tokeView.backgroundColor = UIColor.black
            self.addSubview(tokeView)
            let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(YGAuthorView.leftSwipe(_:)))
            tokeView .addGestureRecognizer(leftSwipe)
            
        } else if send.tag == 2 {
            let twoCodeView = UIView(frame:self.frame)
            twoCodeView.backgroundColor = UIColor.black
            let codeImageView = UIImageView(frame:CGRect(x: self.frame.size.width/2-60, y: self.frame.size.height/2-60, width: 120, height: 120))
            codeImageView.image = UIImage(named: "1464012244")
            twoCodeView.addSubview(codeImageView)
            self.addSubview(twoCodeView)
            
            let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(YGAuthorView.leftSwipe(_:)))
            twoCodeView .addGestureRecognizer(leftSwipe)
            
        }
    }
    func backButtonPress() -> Void {
        let transition = CATransition()
        transition.type = "oglFlip"
        transition.subtype = kCATransitionFromBottom
        transition.duration = 1.5
        self.layer.add(transition, forKey: nil)
        myWebView.removeFromSuperview()
    }
    
    func leftSwipe(_ send:UISwipeGestureRecognizer) {
        let transition = CATransition()
        transition.type = "oglFlip"
        transition.subtype = kCATransitionFromBottom
        transition.duration = 1.5
        self.layer.add(transition, forKey: nil)
        send.view!.removeFromSuperview()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}
