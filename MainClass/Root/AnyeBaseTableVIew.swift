//
//  AnyeBaseTableVIew.swift
//  AnyeProject
//
//  Created by 赵传保 on 2017/11/24.
//  Copyright © 2017年 赵传保. All rights reserved.
//

import UIKit

class AnyeBaseTableVIew: UITableView {

    
    
    override init(frame: CGRect, style: UITableViewStyle) {
        
        super.init(frame: frame, style: style)
        
        if #available(iOS 11.0, *) {
            self.contentInsetAdjustmentBehavior = contentInsetAdjustmentBehavior
        } else {
            // Fallback on earlier versions
        };
        
        self.estimatedRowHeight = 0
        self.estimatedSectionFooterHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
