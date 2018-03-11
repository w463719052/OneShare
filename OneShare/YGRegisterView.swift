//
//  YGRegisterView.swift
//  OneShare
//
//  Created by zccl2 on 16/3/31.
//  Copyright © 2016年 Wyg. All rights reserved.
//

import UIKit

protocol YGRegisterDelegate:NSObjectProtocol{
    
    func YGRegisterCommunityButtonPressed(_ registerView:YGRegisterView)
    
}

typealias sendValueClosure=(_ string:String)->Void
typealias sendValueCollect=()->Void

class YGRegisterView: UIView {
    let imgViewWidh:CGFloat = 120
    let imgViewTop:CGFloat = 60
    let nameCharacterWidh:CGFloat = 200
    let buttonHeight:CGFloat = 40
    let buttonTop:CGFloat = 300
    let buttonMarge:CGFloat = 60

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.black
        
        let img: UIImage = UIImage.sd_animatedGIFNamed("558ea923b18e4")
        let imgview: UIImageView = UIImageView(image: img)
        imgview.frame = CGRect(x: (self.frame.size.width - imgViewWidh) / 2, y: imgViewTop, width: imgViewWidh, height: img.size.height * imgViewWidh / img.size.width)
        self.addSubview(imgview)
        let nameCharacter: UILabel = UILabel(frame: CGRect(x: (self.frame.size.width - nameCharacterWidh) / 2, y: imgview.frame.maxY, width: nameCharacterWidh, height: 40))
        nameCharacter.text = "S H A R E"
        nameCharacter.font = UIFont(name: "Zapfino", size: 12)
        nameCharacter.textColor = UIColor.white
        nameCharacter.textAlignment = .center
        self.addSubview(nameCharacter)
        
        let community: UIButton = UIButton(type: .roundedRect)
        community.frame = CGRect(x: buttonMarge, y: buttonTop, width: self.frame.size.width - buttonMarge*2, height: buttonHeight)
        community.setTitle("每   日   分   享", for: UIControlState())
        community.titleLabel?.font = UIFont(name: "经典行楷简", size: 20)
        community.setTitleColor(UIColor.white, for: UIControlState())
        community.layer.cornerRadius = buttonHeight/2
        community.layer.borderWidth = 2
        community.layer.borderColor = UIColor.white.cgColor
        community.addTarget(self, action: #selector(YGRegisterView.communityButtonPressed), for: .touchUpInside)
        self.addSubview(community)

        
        let collect: UIButton = UIButton(type: .roundedRect)
        collect.frame = CGRect(x: buttonMarge, y: community.frame.maxY + buttonMarge, width: self.frame.size.width - buttonMarge*2, height: buttonHeight)
        collect.titleLabel?.font = UIFont(name: "经典行楷简", size: 20)
        collect.setTitle("作   者   简   介", for: UIControlState())
        collect.setTitleColor(UIColor.white, for: UIControlState())
        collect.layer.cornerRadius = buttonHeight/2
        collect.layer.borderWidth = 2
        collect.layer.borderColor = UIColor.white.cgColor
        collect.addTarget(self, action: #selector(YGRegisterView.collectButtonPressed), for: .touchUpInside)
        self.addSubview(collect)

    }
   
    
    var myClosure:sendValueClosure?
    
    weak var delegate:YGRegisterDelegate!
    func communityButtonPressed() {
        if (myClosure != nil) {
            myClosure!("hhhe")
        }
            delegate?.YGRegisterCommunityButtonPressed(self);
    }
    
    var myCollect:sendValueCollect?
    
    func collectButtonPressed() {
        if (myCollect != nil) {
            myCollect!()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
