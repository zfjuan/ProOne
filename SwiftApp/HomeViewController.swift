//
//  HomeViewController.swift
//  SwiftApp
//
//  Created by Zheng FengJuan on 2017/6/20.
//  Copyright © 2017年 Zheng FengJuan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.createNavigationView()
        self.createTableView()
    }
    // MARK:- loadData
    func loadData() {
//        let urlStr = "q"
////        let dict:Dictionary = Dictionary(["userId":1])
//        var address = urlStr
//        if let dict = dict {
//            for (key,value) in dict {
//                
//            }
//        }
//        let url = URL(string: urlStr.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: url!) { (data, respond, error) in
//            if let data = data {
//               
//            }else {
//            
//            }
//        }
//        dataTask.resume()

    }
    // MARK:- 布局
    func createNavigationView() {
        let navigationView:UIView = UIView(frame: CGRect(x:0,y:0,width:self.view.frame.size.width,height:64))
        navigationView.backgroundColor = UIColor.white
        self.view.addSubview(navigationView)
        let sideButton:UIButton = UIButton(frame: CGRect(x:0,y:0,width:50,height:50))
        sideButton.setImage(UIImage(named: "首页_侧边栏icon_灰"),for: .normal)
        sideButton.addTarget(self, action:#selector(sidebtnClick(_:)), for: .touchUpInside)
        navigationView.addSubview(sideButton)
        
        let iconImageView:UIImageView = UIImageView(frame: CGRect(x: self.view.frame.size.width/2-20, y: 20, width: 40, height: 20))
        iconImageView.image = UIImage(named: "美的你顶部栏_logo")
        navigationView.addSubview(iconImageView)
        
        
    }
    func sidebtnClick(_ button:UIButton) {
        
    }
    func createTableView(){
        self.tableView.frame = CGRect(x:0,y:60,width:self.view.frame.size.width,height:self.view.frame.size.height-60)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: "SingleWebCell", bundle: nil), forCellReuseIdentifier: "SingleWebCell")
        self.view.addSubview(self.tableView)
        
    }
    
    //tableView delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.subtitle,reuseIdentifier: nil)
//        cell.textLabel!.text = String(indexPath.row)
//        cell.detailTextLabel?.text = "da"
//        cell.imageView!.image = UIImage(named:"美妆1")
//        return cell
        
        let cell:SingleWebCell = tableView.dequeueReusableCell(withIdentifier: "SingleWebCell") as! SingleWebCell
        cell.loadWebViewWithModel(webStr: "http://www.jianshu.com")
        return cell
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
              
        }else if section == 1 {
            
        }
        return String(section);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

