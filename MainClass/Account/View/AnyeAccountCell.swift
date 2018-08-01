//
//  AnyeAccountCell.swift
//  AnyeProject
//
//  Created by 赵传保 on 2018/7/12.
//  Copyright © 2018年 赵传保. All rights reserved.
//

import UIKit


let accountCellHeight  = 50



class AnyeAccountCell: UITableViewCell {

    
    
    lazy var leftImageView: UIImageView = {
        let tempImageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 30))
        return tempImageView
    }()
    
    lazy var rightTitle: UILabel = {
        let tempLabel = UILabel(frame: CGRect(x: 30+10+10, y: 10, width: 100, height: 30))
        tempLabel.font = SETMyFontWith(13)
        tempLabel.textColor = kRGBColorFromHex(0x333333)
        return tempLabel
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.allViews()
        
    }
    func allViews(){
        
        self.addSubview(leftImageView)
        self.addSubview(rightTitle)
        
    }
    
    open func setAccountCellData(accountM:HandyModel) {
        leftImageView.image = myImageNamed(accountM.leftImage!)
        rightTitle.text = accountM.rightTitle
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
