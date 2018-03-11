//
//  YGBookCell.swift
//  OneShare
//
//  Created by zccl2 on 16/4/6.
//  Copyright © 2016年 Wyg. All rights reserved.
//

import UIKit

class YGBookCell: UITableViewCell {

    var myImageView = UIImageView()
    var myTitleView = UILabel()
    var myTextView = UILabel()
    var mySateLabel = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        myImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 145))
        myImageView.layer.cornerRadius = 3
        myImageView.backgroundColor = UIColor.white
        myImageView.layer.masksToBounds = true
        myImageView.contentMode = .scaleAspectFill
        self.addSubview(myImageView)
        
        myTitleView = UILabel(frame: CGRect(x: 105, y: 0, width: self.frame.size.width-135, height: 20))
        myTitleView.font = UIFont(name: "经典行楷简", size: 23)
        myTitleView.textAlignment = .center
        myTitleView.textColor = UIColor.white
        
        self.addSubview(myTitleView)
        
        myTextView = UILabel(frame: CGRect(x: 105, y: 25, width: self.frame.size.width-135, height: 120))
        myTextView.font = UIFont(name: "经典行楷简", size: 15)
        myTextView.textColor = UIColor.white
        myTextView.numberOfLines = 0
        self.addSubview(myTextView)
        
        mySateLabel.frame = CGRect(x: self.frame.size.width-35-100, y: myImageView.frame.height, width: 100, height: 20)
        mySateLabel.font = myFont
        mySateLabel.textColor = UIColor.white
        mySateLabel.textAlignment = .right
        self.addSubview(mySateLabel)
        
    }
    
    func setContentViewInfo(_ info:BmobObject) {
        myImageView.sd_setImageWithURL(URL(string: info.objectForKey("BookImage").url))
        myTitleView.text = info.objectForKey("BookName") as? String
        myTextView.text = info.objectForKey("BriefIntroduction") as? String
        
        let date = info.objectForKey("updatedAt") as? NSString
        mySateLabel.text = date?.substringToIndex(11)
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
