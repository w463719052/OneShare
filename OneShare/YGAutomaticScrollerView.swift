//
//  YGAutomaticScrollerView.swift
//  OneShare
//
//  Created by zccl2 on 16/5/17.
//  Copyright © 2016年 Wyg. All rights reserved.
//

import UIKit

class YGAutomaticScrollerView: UIView,UIScrollViewDelegate {

    var timer = Timer()
    var myScrollerView = UIScrollView()
    var rollPictureArray = NSArray()
    var page = NSInteger()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(YGAutomaticScrollerView.runtimer), userInfo: nil, repeats: true)
        myScrollerView = UIScrollView(frame: self.bounds)
        myScrollerView.delegate = self
        myScrollerView.isPagingEnabled = true
        myScrollerView.showsHorizontalScrollIndicator = false
        myScrollerView.showsVerticalScrollIndicator = false
        myScrollerView.bounces = false
        self.addSubview(myScrollerView)
        
    }
    
    func setPictureArray(_ pictureArray:NSArray) {
        rollPictureArray = pictureArray
        for i in 0 ..< rollPictureArray.count {
            let rollPictureImg: UIImageView = UIImageView(image: UIImage(named: rollPictureArray[i] as! String))
            rollPictureImg.frame = CGRect(x: self.frame.size.width * CGFloat(i + 1), y: 0, width: self.frame.size.width, height: self.frame.size.height)
            myScrollerView.addSubview(rollPictureImg)
        }
        let rollPictureImg1: UIImageView = UIImageView(image: UIImage(named: rollPictureArray[rollPictureArray.count - 1] as! String))
        rollPictureImg1.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: frame.size.height)
        myScrollerView.addSubview(rollPictureImg1)
        let rollPictureImg2: UIImageView = UIImageView(image: UIImage(named: rollPictureArray[0] as! String))
        rollPictureImg2.frame = CGRect(x: self.frame.size.width * CGFloat(rollPictureArray.count + 1), y: 0, width: self.frame.size.width, height: frame.size.height)
        myScrollerView.addSubview(rollPictureImg2)
        myScrollerView.contentOffset = CGPoint(x: self.frame.size.width, y: 0)
        myScrollerView.contentSize = CGSize(width: self.frame.size.width * CGFloat(rollPictureArray.count + 2), height: frame.size.height)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth: CGFloat = myScrollerView.frame.size.width
        let page: CGFloat = CGFloat((myScrollerView.contentOffset.x - pageWidth) / pageWidth + CGFloat(1))
        self.page = NSInteger(page)
    }

    
    func runtimer() {
        var page: Int = self.page
        page += 1
        page = page > self.rollPictureArray.count ? 1 : page
        self.page = page
        myScrollerView.scrollRectToVisible(CGRect(x: self.frame.size.width * CGFloat(page), y: 0, width: self.frame.size.width, height: self.bounds.size.height), animated: false)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth: CGFloat = myScrollerView.frame.size.width
        let page: CGFloat = CGFloat((myScrollerView.contentOffset.x - pageWidth) / pageWidth + CGFloat(1))
        if NSInteger(page) > rollPictureArray.count {
            myScrollerView.contentOffset = CGPoint(x: self.frame.size.width, y: 0)
        }
        else if page < 1 {
            myScrollerView.contentOffset = CGPoint(x: self.frame.size.width * CGFloat(self.rollPictureArray.count), y: 0)
        }
        
    }
    
    func startTimer() {
        timer.fireDate = Date.distantPast
    }
    
    func stopTimer() {
        timer.fireDate = Date.distantFuture
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
