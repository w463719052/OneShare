//
//  YGAuthorWebView.swift
//  OneShare
//
//  Created by 王用桂 on 16/5/23.
//  Copyright © 2016年 Wyg. All rights reserved.
//

import UIKit
import WebKit

class YGAuthorWebView: UIView {
    
    var webView = WKWebView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        //创建wkwebview
        webView = WKWebView(frame: frame)
        webView.scrollView.bounces = false
        //添加wkwebview
        self.addSubview(webView)
        self.loadLocalHTMLFileToUIWebView()
    }
    
    func loadLocalHTMLFileToUIWebView() {
        let docPath:String = Bundle.main.bundlePath
        var draftPath:String = docPath + "/Htlm5"
        let newDraftPath:String = draftPath + "/呵呵呵.html"
        let htmlString:String = try! String(contentsOfFile: newDraftPath, encoding: String.Encoding.utf8)
        
        draftPath = draftPath.replacingOccurrences(of: "/", with: "//")
        draftPath = draftPath.replacingOccurrences(of: " ", with: "%20")
        let myUrl = URL(string: "file:/"+draftPath+"//")
        webView.loadHTMLString(htmlString, baseURL: myUrl)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
