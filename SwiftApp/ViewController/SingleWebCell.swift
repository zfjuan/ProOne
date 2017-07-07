//
//  SingleWebCell.swift
//  SwiftApp
//
//  Created by Zheng FengJuan on 2017/6/21.
//  Copyright © 2017年 Zheng FengJuan. All rights reserved.
//

import UIKit
import WebKit
class SingleWebCell: UITableViewCell,WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler{
 
    @IBOutlet weak var webImageView: UIImageView!
    
    @IBOutlet weak var webUpCon: NSLayoutConstraint!
    
    @IBOutlet weak var webDownCon: NSLayoutConstraint!
    
    var webView:WKWebView = WKWebView()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.createWebView();
    }
    
    
    func createWebView() {

        let webConfiguration = WKWebViewConfiguration()
        let userContent = WKUserContentController()
        userContent.add(self, name: "GoDetailPage")
        webConfiguration.userContentController = userContent
        
//        webConfiguration.allowsInlineMediaPlayback = 
        self.webView = WKWebView(frame: CGRect(x:25,y:self.webUpCon.constant,width:self.frame.size.width,height:self.frame.size.height-self.webUpCon.constant-self.webDownCon.constant), configuration: webConfiguration)
        self.webView.navigationDelegate = self
        self.webView.uiDelegate = self
        self.webView.alpha = 0
        // 设置访问的URL
//        let urlS = NSURL(string: "http://www.jianshu.com")
//        // 根据URL创建请求
//        let requst = NSURLRequest(url:urlS! as URL)
//        // WKWebView加载请求
//        webView.load(requst as URLRequest)
        self.addSubview(self.webView)
        
    }
    
    func loadWebViewWithModel(webStr:String){
        // 设置访问的URL
        let urlS = NSURL(string: webStr)
        // 根据URL创建请求
        let requst = NSURLRequest(url:urlS! as URL)
        // WKWebView加载请求
        webView.load(requst as URLRequest)
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
         UIView.animate(withDuration: 0.3) { 
            self.webView.alpha = 1
         }
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if "GoDetailPage" == message.name {
            if "123" == message.body as!String {
                
            }
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
