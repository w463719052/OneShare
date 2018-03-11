//
//  YGAuthorPassWordView.swift
//  OneShare
//
//  Created by zccl2 on 16/5/18.
//  Copyright © 2016年 Wyg. All rights reserved.
//

import UIKit

class YGAuthorPassWordView: UIView {
    var logoImageView = UIImageView()
    var passWordField = UITextField()
    override init(frame: CGRect) {
        super.init(frame: frame)
        logoImageView = UIImageView(frame: CGRect(x: frame.size.width/2-30, y: 20, width: 60, height: 60))
        logoImageView.image = UIImage(named: "logo")
        logoImageView.layer.cornerRadius = 30
        logoImageView.layer.masksToBounds = true
        logoImageView.isUserInteractionEnabled = true
        self.addSubview(logoImageView)
        
        passWordField = UITextField(frame: CGRect(x: 20, y: 100, width: frame.size.width-40, height: 40))
        passWordField.borderStyle = .roundedRect
        passWordField.isSecureTextEntry = true
        passWordField.font = UIFont(name: "经典行楷简", size: 20)
        self.addSubview(passWordField)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
