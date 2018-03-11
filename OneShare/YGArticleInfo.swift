//
//  YGArticleInfo.swift
//  OneShare
//
//  Created by zccl2 on 16/4/1.
//  Copyright © 2016年 Wyg. All rights reserved.
//

import UIKit

var myFont = UIFont(name: "经典行楷简", size: 16)

class YGArticleInfo: NSObject {
    var contentString = NSMutableAttributedString()
    var contentStringHeight = CGFloat()
    var date = NSString()
    
    
    func contentInfoWithString(_ info:BmobObject) {
        let myString = info.objectForKey("text")!
        let attributeString = NSMutableAttributedString(string: myString as! String)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        attributeString .addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, myString.length))
        contentString = attributeString
        contentStringHeight = self.getLabelHeight(attributeString, font: myFont!)
        
        date = (info.objectForKey("updatedAt") as? NSString)!
    }
    
    func getLabelHeight(_ text:NSMutableAttributedString,font:UIFont)->CGFloat {
        if text.length == 0 {
            return 30
        } else {
            let textWidth: CGFloat = UIScreen.main.bounds.size.width - 100
            let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: textWidth, height: 0))
            lbl.numberOfLines = 0
            lbl.font = font
            lbl.attributedText = text
            lbl.sizeToFit()
            return lbl.frame.size.height
            
//            let txtFrame: CGRect = text.boundingRectWithSize(CGSizeMake(textWidth, UIScreen.mainScreen().bounds.size.width), options: [.UsesLineFragmentOrigin, .UsesFontLeading], attributes: [NSFontAttributeName: font], context: nil)
//            return txtFrame.size.height
        }
    }
}
