//
//  YGArticleCell.swift
//  OneShare
//
//  Created by zccl2 on 16/4/1.
//  Copyright © 2016年 Wyg. All rights reserved.
//

import UIKit

class YGArticleCell: UITableViewCell {
    var myTextLabel = UILabel()
    var mySateLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        myTextLabel.numberOfLines = 0
        myTextLabel.font = myFont
        myTextLabel.textColor = UIColor.white
        self.addSubview(myTextLabel)
        
        mySateLabel.font = myFont
        mySateLabel.textColor = UIColor.white
        mySateLabel.textAlignment = .right
        self.addSubview(mySateLabel)
    }
    
    func setContentViewInfo(_ info:YGArticleInfo) {
        myTextLabel.attributedText = info.contentString
        myTextLabel.frame = CGRect(x: 10, y: 0, width: self.frame.size.width - 35-10, height: info.contentStringHeight+20)
        myTextLabel.sizeToFit()
        
        mySateLabel.frame = CGRect(x: self.frame.size.width-35-10-100, y: myTextLabel.frame.height, width: 100, height: 20)
        mySateLabel.text = info.date.substring(to: 11)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
