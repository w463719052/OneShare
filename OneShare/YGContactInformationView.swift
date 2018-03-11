//
//  YGContactInformationView.swift
//  OneShare
//
//  Created by 王用桂 on 16/5/23.
//  Copyright © 2016年 Wyg. All rights reserved.
//

import UIKit

class YGContactInformationView: UIView {
    var emailLbl = UILabel()
    var qqLbl = UILabel()
    var telephoneButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        emailLbl = UILabel(frame:CGRect(x: 20, y: 100 ,width: frame.size.width-40, height: 50))
        emailLbl.textColor = UIColor.white
        emailLbl.textAlignment = .center
        emailLbl.font = UIFont(name: "经典行楷简", size: 20)
        emailLbl.text = "邮 箱：yonggui_w@163.com"
        self.addSubview(emailLbl)
        
        qqLbl = UILabel(frame: CGRect(x: 20, y: 170, width: frame.size.width-40, height: 50))
        qqLbl.textColor = UIColor.white
        qqLbl.textAlignment = .center
        qqLbl.font = UIFont(name: "经典行楷简", size: 20)
        qqLbl.text = "Q Q：463719052"
        self.addSubview(qqLbl)
        
        telephoneButton = UIButton(type: .custom)
        telephoneButton.frame = CGRect(x: 20, y: 240, width: frame.size.width-40, height: 50)
        telephoneButton.titleLabel?.textAlignment = .center
        telephoneButton.titleLabel?.font = UIFont(name: "经典行楷简", size: 20)
        telephoneButton.setTitle("手 机：15559560997", for: UIControlState())
        telephoneButton.setTitleColor(UIColor.white, for: UIControlState())
        telephoneButton.addTarget(self, action: #selector(YGContactInformationView.telephoneButtonPress), for: .touchUpInside)
        self.addSubview(telephoneButton)
    }
    func telephoneButtonPress() -> Void {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
