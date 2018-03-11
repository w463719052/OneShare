//
//  YGPictureCell.swift
//  OneShare
//
//  Created by zccl2 on 16/4/5.
//  Copyright © 2016年 Wyg. All rights reserved.
//

import UIKit

class YGPictureCell: UITableViewCell {
    var myImageView = UIImageView()
    var mySateLabel = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width - 35, height: 0))
        myImageView.layer.cornerRadius = 3
        myImageView.backgroundColor = UIColor.white
        myImageView.layer.masksToBounds = true
        myImageView.contentMode = .scaleAspectFill
        self.addSubview(myImageView)
        
        mySateLabel.font = myFont
        mySateLabel.textColor = UIColor.white
        mySateLabel.textAlignment = .right
        self.addSubview(mySateLabel)
    }
    
    func setContentViewInfo(_ info:YGPictureInfo) {
        myImageView.frame.size.height = CGFloat(info.contentImageHeight+10)
        myImageView.sd_setImageWithURL(URL(string: info.bmobInfo!.url))
        
        mySateLabel.frame = CGRect(x: self.frame.size.width-35-100, y: myImageView.frame.height, width: 100, height: 20)
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
