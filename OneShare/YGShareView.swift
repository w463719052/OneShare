//
//  YGShareView.swift
//  OneShare
//
//  Created by zccl2 on 16/4/1.
//  Copyright © 2016年 Wyg. All rights reserved.
//

import UIKit

class YGShareView: UIView,UITableViewDataSource,UITableViewDelegate {
    let ScreenWidth = UIScreen.main.bounds.size.width
    let ScreenHeight = UIScreen.main.bounds.size.height
    let buttonWidth:CGFloat = 60
    var myTableView = UITableView()
    var infoArray = NSMutableArray()
    var picInfoArray = NSMutableArray()
    var bookInfoArray = NSMutableArray()
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    
    var normalImages = NSMutableArray()
    var refreshImages = NSMutableArray()
    
    
    var articleButton = UIButton()
    var pictureButton = UIButton()
    var bookButton = UIButton()
    
    var myTextLbl = UILabel()
    
    var myImageView = UIImageView()
    
    var backColor = UIColor(red: 37/255, green: 37/255, blue: 37/255, alpha: 1)
    
    var articText = "字里行间值深思"
    var pictureText = "图说天下美无边"
    var bookText = "书中自有颜如玉"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = backColor
        
        articleButton = UIButton(type: .custom)
        articleButton.frame = CGRect(x: 10, y: 20, width: buttonWidth, height: buttonWidth)
        articleButton.setTitle("雅句", for: UIControlState())
        articleButton.titleLabel?.font = UIFont(name: "经典行楷简", size: 25)
        articleButton.setTitleColor(UIColor.white, for: UIControlState())
        articleButton.setTitleColor(UIColor.black, for: .selected)
        articleButton.layer.cornerRadius = buttonWidth/2
        articleButton.layer.borderWidth = 2
        articleButton.layer.borderColor = UIColor.white.cgColor
        articleButton.tag = 1
        articleButton.backgroundColor = UIColor.white
        articleButton.addTarget(self, action: #selector(YGShareView.reloadTable(_:)), for: .touchUpInside)
        articleButton.isSelected = true
        self.addSubview(articleButton)
        
        let label = UILabel(frame: CGRect(x: 10+(buttonWidth-1)/2, y: articleButton.frame.maxY+30, width: 1, height: 60))
        label.backgroundColor = UIColor.white
        self.addSubview(label)
        
        pictureButton = UIButton(type: .custom)
        pictureButton.frame = CGRect(x: 10, y: 200, width: buttonWidth, height: buttonWidth)
        pictureButton.setTitle("佳图", for: UIControlState())
        pictureButton.titleLabel?.font = UIFont(name: "经典行楷简", size: 25)
        pictureButton.setTitleColor(UIColor.white, for: UIControlState())
        pictureButton.setTitleColor(UIColor.black, for: .selected)
        pictureButton.layer.cornerRadius = buttonWidth/2
        pictureButton.layer.borderWidth = 2
        pictureButton.layer.borderColor = UIColor.white.cgColor
        pictureButton.tag = 2
        pictureButton.addTarget(self, action: #selector(YGShareView.reloadTable(_:)), for: .touchUpInside)
        self.addSubview(pictureButton)
        
        let label1 = UILabel(frame: CGRect(x: 10+(buttonWidth-1)/2, y: pictureButton.frame.maxY+30, width: 1, height: 60))
        label1.backgroundColor = UIColor.white
        self.addSubview(label1)
        
        bookButton = UIButton(type: .custom)
        bookButton.frame = CGRect(x: 10, y: 380, width: buttonWidth, height: buttonWidth)
        bookButton.setTitle("好书", for: UIControlState())
        bookButton.titleLabel?.font = UIFont(name: "经典行楷简", size: 25)
        bookButton.setTitleColor(UIColor.white, for: UIControlState())
        bookButton.setTitleColor(UIColor.black, for: .selected)
        bookButton.layer.cornerRadius = buttonWidth/2
        bookButton.layer.borderWidth = 2
        bookButton.layer.borderColor = UIColor.white.cgColor
        bookButton.tag = 3
        bookButton.addTarget(self, action: #selector(YGShareView.reloadTable(_:)), for: .touchUpInside)
        self.addSubview(bookButton)
        
        
        myTextLbl.frame = CGRect(x: 30, y: 450, width: 20, height: 200)
        myTextLbl.numberOfLines = 0
        myTextLbl.textColor = UIColor.white
        myTextLbl.font = UIFont(name: "经典行楷简", size: 20)
        self.myTextLbl.text = articText
        self.myTextLbl.alpha = 0
        self.addSubview(myTextLbl)
        
        myImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 200)
        myImageView.backgroundColor = backColor
        myTextLbl.addSubview(myImageView)
        
        myTableView = UITableView(frame: CGRect(x: 80, y: 20, width: ScreenWidth-80, height: ScreenHeight-20))
        myTableView.backgroundColor = UIColor.clear
        myTableView.showsHorizontalScrollIndicator = false
        myTableView.showsVerticalScrollIndicator = false
        myTableView.separatorStyle = .none
        myTableView.allowsSelection = false
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.tag = 1
        header.setRefreshingTarget(self, refreshingAction: #selector(YGShareView.headerRefresh))
        header.lastUpdatedTimeLabel?.hidden = true
        header.stateLabel?.hidden = true
        myTableView.mj_header = header
        
        self.addSubview(myTableView)
        
        
        
        self.queryObj();
        self.imageQueryObj()
        self.bookQueryObj()
        
    }

    func headerRefresh(){
        switch myTableView.tag {
        case 1 :
            self.infoArray.removeAllObjects()
            self.queryObj()
        case 2 :
            self.picInfoArray.removeAllObjects()
            self.imageQueryObj()
        case 3 :
            self.bookInfoArray.removeAllObjects()
            self.bookQueryObj()
        default :
            break
        }
    }
    
    func showText () {
        switch myTableView.tag {
        case 1 :
            self.myTextLbl.text = articText
        case 2 :
            self.myTextLbl.text = pictureText
        case 3 :
            self.myTextLbl.text = bookText
        default :
            break
        }
        
        self.myTextLbl.alpha = 0;
        self.myImageView.frame = CGRect(x: 0, y: 0, width: 20, height: 200)
        UIView.animate(withDuration: 1.5, animations: { () -> Void in
            self.myImageView.frame = CGRect(x: 0, y: 200, width: 20, height: 0)
            self.myTextLbl.alpha = 1;
        }) 

    }
    
    func reloadTable(_ send:UIButton) {
        if myTableView.tag == send.tag {
            return
        } else {
            myTableView.tag = send.tag
            let transition = CATransition()
            transition.type = "suckEffect"
            transition.subtype = kCATransitionFromBottom
            transition.duration = 0.5
            self.layer.add(transition, forKey: nil)
            myTableView.reloadData()
            
            self.showText()
        }
        
        articleButton.isSelected = false
        articleButton.backgroundColor = UIColor.clear
        pictureButton.isSelected = false
        pictureButton.backgroundColor = UIColor.clear
        bookButton.isSelected = false
        bookButton.backgroundColor = UIColor.clear
        send.isSelected = true
        send.backgroundColor = UIColor.white
    }
    
    func queryObj(){
        let query:BmobQuery = BmobQuery(className:"Article")
        query.limit = 30
        query.orderByDescending("updatedAt")
        query.findObjectsInBackgroundWithBlock({array,error in
            self.infoArray = NSMutableArray(array: array);
            self.myTableView.mj_header.endRefreshing()
            self.myTableView.reloadData()
            }
        )
    }
    
    func imageQueryObj(){
        let query:BmobQuery = BmobQuery(className:"Picture")
        query.limit = 30
        query.orderByDescending("updatedAt")
        query.findObjectsInBackgroundWithBlock({array,error in
            self.picInfoArray = NSMutableArray(array: array);
            self.myTableView.mj_header.endRefreshing()
            self.myTableView.reloadData()
            }
        )
    }
    
    func bookQueryObj(){
        let query:BmobQuery = BmobQuery(className:"Book")
        query.limit = 30
        query.orderByDescending("updatedAt")
        query.findObjectsInBackgroundWithBlock({array,error in
            self.bookInfoArray = NSMutableArray(array: array);
            self.myTableView.mj_header.endRefreshing()
            self.myTableView.reloadData()
            }
        )
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
        case 1 :
            return infoArray.count
        case 2 :
            return picInfoArray.count
        case 3 :
            return bookInfoArray.count
        default :
            return 0
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView.tag {
        case 1 :
            let info = YGArticleInfo()
            info.contentInfoWithString(infoArray[indexPath.row] as! BmobObject)
            return info.contentStringHeight+60
        case 2 :
            let picInfo = YGPictureInfo()
            picInfo.contentInfoWithImage(picInfoArray[indexPath.row] as! BmobObject)
            return CGFloat(picInfo.contentImageHeight+45)
        case 3 :
            return 195
        default :
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 1 {
            let cellIdentifier: String = "MyCell1"
            let cell = YGArticleCell(style: .default, reuseIdentifier: cellIdentifier)
            let info = YGArticleInfo()
            info.contentInfoWithString(infoArray[indexPath.row] as! BmobObject)
            cell.setContentViewInfo(info)
            return cell
        } else if tableView.tag == 2 {
            let cellIdentifier: String = "MyCell2"
            let cell = YGPictureCell(style: .default, reuseIdentifier: cellIdentifier)
            let info = YGPictureInfo()
            info.contentInfoWithImage(picInfoArray[indexPath.row] as! BmobObject)
            cell.setContentViewInfo(info)
            return cell
        } else {
            let cellIdentifier: String = "MyCell3"
            let cell = YGBookCell(style: .default, reuseIdentifier: cellIdentifier)
            cell.setContentViewInfo(bookInfoArray[indexPath.row] as! BmobObject)
            return cell
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
