//
//  AnyeMyAccountVC.swift
//  AnyeProject
//
//  Created by 赵传保 on 2017/10/16.
//  Copyright © 2017年 赵传保. All rights reserved.
//

import UIKit
import SwiftyJSON
class AnyeMyAccountVC: RootViewController{

    
    lazy var accountTopView: AnyeAccountTopView = {
        let tempTopView = AnyeAccountTopView(frame: CGRect(x: 0, y: 0, width: windWidth, height: 150))
        tempTopView.backgroundColor = UIColor.purple
        return tempTopView
    }()
    
    lazy var accountTableView: AnyeBaseTableVIew = {
        let tabviewHeight = windHeight-CGFloat(kTabBarHeight)
        let tempTableView = AnyeBaseTableVIew(frame: CGRect(x: 0,y: 0,width: windWidth,height: tabviewHeight), style: .grouped)
        tempTableView.backgroundColor = MainBackGroundColor
        tempTableView.separatorStyle = .singleLine
        tempTableView.separatorColor = MainBackGroundColor
        tempTableView.delegate = self
        tempTableView.dataSource = self
        return tempTableView
    }()
    
    var myAccountTotalArray = NSMutableArray()
    var firstSectionArray = NSMutableArray()
    var secondSectionArray = NSMutableArray()
    var thirdSectionArray = NSMutableArray()
    var fourSectionArray = NSMutableArray()
    var fiveSectionArray = NSMutableArray()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: - 签到按钮
        let signBtn = UIButton.init(type: .custom)
        signBtn.frame = CGRect(x: 0, y: 0, width: 45, height: 25)
        signBtn.setTitle("签到", for: .normal)
        signBtn.setTitleColor(kMainColor, for: .normal)
        signBtn.titleLabel?.font = SETMyFontWith(13)
        signBtn.layer.borderColor = kMainColor.cgColor
        signBtn.layer.borderWidth = 1
        signBtn.layer.cornerRadius = CGFloat(25/2);
        signBtn.addTarget(self, action: #selector(signBtnClickAction(_ :)), for: .touchUpInside)
        
        let itemBtn = UIBarButtonItem(customView: signBtn)
        self.navigationItem.rightBarButtonItem = itemBtn
        
        //tableview
        
        self.view.addSubview(accountTableView)
        accountTableView.register(AnyeAccountCell.self, forCellReuseIdentifier: "AnyeAccountCellID")
        
        accountTableView.tableHeaderView = accountTopView
        //布局视图
        self.setMyAccountData()
        
        //获取账户页面数据
        NetWorkRequest(target: .accountUserData, completion: { (successInfo) -> (Void) in
            printLog("请求成功: \(successInfo)")
            let dataDic = successInfo["data"]
            var userModel = UserModel()
            
            printLog("请求成功data数据: \(dataDic)")
        }, failed: { (failedInfo) -> (Void) in
            printLog("请求失败: \(failedInfo)")
        }) { () -> (Void) in
            
        }
    }
    //设置列表显示
    func setMyAccountData() {
        
        let firstTitleArr = ["最近阅读","我的订阅","阅读时长"]
        let firstImageArr = ["icon_read","icon_subscription","icon_readlength@2x"]
        
        let secondTitleArr = ["夜间模式"]
        let secondImageArr = ["account_night_mode"]
        
        let thirdTitleArr = ["邀请有奖","填写邀请码","我的余额","我的包书"]
        let thirdImageArr = ["account_invitecode","account_input_invite_code","wodeyueIcon","icon_yearmonth"]
        
        
        let fourTitleArr = ["系统设置","消息通知","使用帮助","意见反馈","关于暗夜"]
        let fourImageArr = ["icon_set","icon_message","icon_help","icon_feedback","icon_about"]
        
        
        self.firstSectionArray = self.getSectionModelArr(firstTitleArr as NSArray, firstImageArr as NSArray)
        self.secondSectionArray = self.getSectionModelArr(secondTitleArr as NSArray, secondImageArr as NSArray)
        self.thirdSectionArray = self.getSectionModelArr(thirdTitleArr as NSArray, thirdImageArr as NSArray)
        self.fourSectionArray = self.getSectionModelArr(fourTitleArr as NSArray, fourImageArr as NSArray)
        
        self.myAccountTotalArray = NSMutableArray(objects: self.firstSectionArray,self.secondSectionArray,self.thirdSectionArray,self.fourSectionArray)
    }
    
    func getSectionModelArr(_ titleArr:NSArray,_ imageArr:NSArray) -> NSMutableArray {
        let sectionDataArr = NSMutableArray()
        for object in titleArr {
            let index = titleArr.index(of: object)
            let titleStr = titleArr[index] as! String
            let imageStr = imageArr[index] as! String
            let model = HandyModel()
            model.leftImage = imageStr
            model.rightTitle = titleStr
            sectionDataArr.add(model)
        }
        return sectionDataArr
    }
    
    //MARK: - 签到点击事件
    func signBtnClickAction(_ sender:UIButton) {
        printLog("签到事件")
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension AnyeMyAccountVC:UITableViewDelegate,UITableViewDataSource{
    //MARK: - 账户tableview代理
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.myAccountTotalArray.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.myAccountTotalArray[section] as AnyObject).count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "AnyeAccountCellID"
        let cell = AnyeAccountCell(style: .default, reuseIdentifier: cellID)
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0)
        
        if self.myAccountTotalArray.count > 0 {
            var sectionArr = self.myAccountTotalArray[indexPath.section] as! [HandyModel]
            let accountModel = sectionArr[indexPath.row]
            cell.setAccountCellData(accountM: accountModel)
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(accountCellHeight)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == self.myAccountTotalArray.count-1 {
            return 8
        }else{
            return 0.01
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

