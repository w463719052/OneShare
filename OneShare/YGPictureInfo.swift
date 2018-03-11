//
//  YGPictureInfo.swift
//  OneShare
//
//  Created by zccl2 on 16/4/5.
//  Copyright © 2016年 Wyg. All rights reserved.
//

import UIKit

class YGPictureInfo: NSObject {
    var contentImageHeight = Float()
    var bmobInfo = AnyObject?()
    var date = NSString()

    func contentInfoWithImage(_ myImageObjct:BmobObject) {
        bmobInfo = myImageObjct.objectForKey("image");
        let myImageWidth = myImageObjct.objectForKey("imageWidth").floatValue
        let myImageHeight = myImageObjct.objectForKey("imageHeight").floatValue
        contentImageHeight = myImageHeight/myImageWidth*Float(UIScreen.mainScreen().bounds.size.width-55)
        
        date = (myImageObjct.objectForKey("updatedAt") as? NSString)!
    }
}
