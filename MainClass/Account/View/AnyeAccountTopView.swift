//
//  AnyeAccountTopView.swift
//  AnyeProject
//
//  Created by 赵传保 on 2018/7/10.
//  Copyright © 2018年 赵传保. All rights reserved.
//

import UIKit
import YYKit
class AnyeAccountTopView: AnyeBaseView {

    //MARK: - 头像
    lazy var accountAvatarImageView: UIImageView = {
        let tempImageView = UIImageView(frame: CGRect(x: 15, y: 10, width: 60, height: 60))
        tempImageView.backgroundColor = UIColor.white
        tempImageView.layer.cornerRadius = 30;
        tempImageView.clipsToBounds = true
        return tempImageView
    }()
    //昵称
    lazy var accountNickName: UILabel = {
        let tempLabel = UILabel()
        tempLabel.font = SETMyFontWith(15)
        tempLabel.text = "哈哈哈"
        tempLabel.textColor = kRGBColorFromHex(0x333333)
        return tempLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        allViews()
        
        
    }
    
    func allViews() {
        self.addSubview(accountAvatarImageView)
        self.addSubview(accountNickName);
        accountNickName.frame = CGRect(x: accountAvatarImageView.right+10, y: accountAvatarImageView.top+5, width: 150, height: 15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
