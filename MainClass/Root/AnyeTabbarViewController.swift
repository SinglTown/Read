//
//  AnyeTabbarViewController.swift
//  AnyeProject
//
//  Created by 赵传保 on 2017/7/19.
//  Copyright © 2017年 赵传保. All rights reserved.
//

import UIKit

class AnyeTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        setAllViewControllsOfAnye()
        
        let str = "gagaga"
        
        printLog(str)
    }
    
    
    private func setAllViewControllsOfAnye() {
        
        //书架
        addBitViewController(childViewController: AnyeBookShelfVC(), title: "书架", normaImageStr: "bottom nav bar_icon_bookshelves_normal", selectedImageStr: "bottom nav bar_icon_bookshelves_pressed")
        //精选
        addBitViewController(childViewController: AnyeBestChoiceVC(), title: "书城", normaImageStr: "bottom nav bar_icon_choice_normal", selectedImageStr: "bottom nav bar_icon_choice_pressed")
        //发现
        addBitViewController(childViewController: AnyeDiscoverVC(), title: "发现", normaImageStr: "bottom nav bar_icon_discover_normal", selectedImageStr: "bottom nav bar_icon_discover_pressed")
        //账户
        addBitViewController(childViewController: AnyeMyAccountVC(), title: "账户", normaImageStr: "bar_icon_account_normal", selectedImageStr: "bottom nav bar_icon_account_pressed")
    }
    
    func addBitViewController(childViewController:UIViewController,title:String,normaImageStr:String,selectedImageStr:String) {
        childViewController.title = title
        tabBar.tintColor = kRGBColorFromHex(0xD14100)
        tabBar.barTintColor = UIColor.white
        childViewController.tabBarItem.image = UIImage(named: normaImageStr)
        childViewController.tabBarItem.selectedImage = UIImage(named: selectedImageStr)
        addChildViewController(AnyeBaseNavigationController(rootViewController: childViewController))
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
        let bitindex = tabBar.items?.index(of: item)
        
        self.tabbarShowAnimationWithIndex(index: bitindex!)
    }
    
    //MARK
    func tabbarShowAnimationWithIndex(index:NSInteger){
        printLog(index)
        
        let tabbarBtnArray = NSMutableArray.init()
        for tabbarBtn in self.tabBar.subviews {
            if tabbarBtn.isKind(of: NSClassFromString("UITabBarButton")!){
                tabbarBtnArray.add(tabbarBtn)
            }
        }
        
        let animation = CAKeyframeAnimation()
        animation.keyPath = "transform.scale"
        animation.values = [1.0,1.1,0.9,1.0]
        animation.duration = 0.3
        animation.calculationMode = kCAAnimationCubic
        
        let showImageView = tabbarBtnArray[index] as AnyObject
        showImageView.layer.add(animation, forKey: "animation")
        
        
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
