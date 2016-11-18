//
//  ComposeView.swift
//  TYImageTextMixedButton
//
//  Created by thomasTY on 16/11/16.
//  Copyright © 2016年 thomasTY. All rights reserved.
//

import UIKit

let screenW = UIScreen.main.bounds.size.width;
let screenH = UIScreen.main.bounds.size.height;

class MenuView: UIView
{
    //接收目标控制器
    fileprivate var target:UIViewController?
    //保存菜单按钮
    private var buttonArray: [MenuButton] = [MenuButton]()
    // 保存按钮模型
    fileprivate lazy var composeMenuArray: [ComposeMenu] = self.loadComposeData()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.frame.size = CGSize(width: screenW, height: screenH)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI()
    {
        addChildButton()
    }
    //MARK: -  添加6个菜单按钮
    private func addChildButton()
    {
        let buttonWidth: CGFloat = 80
        let buttonHeight: CGFloat = 110
        let buttonMargin: CGFloat = (self.bounds.width - 3 * buttonWidth) / 4
        
        for i in 0..<composeMenuArray.count
        {
            let colIndex = i % 3
            let rowIndex = i / 3
            let model = composeMenuArray[i]
            let button = MenuButton()
            
            button.setImage(UIImage(named:model.icon!), for: UIControlState.normal)
            button.setTitle(model.title!, for: UIControlState.normal)
            
            button.frame.size = CGSize(width: buttonWidth, height: buttonHeight)
            let buttonX = CGFloat(colIndex) * buttonWidth + CGFloat(colIndex + 1) * buttonMargin
            let buttonY = CGFloat(rowIndex) * buttonMargin + CGFloat(rowIndex) * buttonHeight
            button.frame.origin = CGPoint(x: buttonX, y: buttonY)
            
            button.addTarget(self, action: #selector(buttonAction(btn:)), for: UIControlEvents.touchUpInside)
            
            button.tag = i
            addSubview(button)
            buttonArray.append(button)
        }
    }
    
    
    //MARK: - 菜单按钮点击事件
    @objc private func buttonAction(btn:UIButton)
    {
        let model = self.composeMenuArray[btn.tag]
        let classType = NSClassFromString(model.className!) as! UIViewController.Type
        let vc = classType.init()
        let nav = UINavigationController(rootViewController: vc)
        self.target?.present(nav, animated: true, completion: nil)
    }
    
    
    
    //MARK: - 加载plist文件，数据转模型
    fileprivate func loadComposeData()-> [ComposeMenu]
    {
        let path = Bundle.main.path(forResource: "compose.plist", ofType: nil)!
        let dictArray = NSArray(contentsOfFile: path) as! [[String:Any]]
        var modelArray = [ComposeMenu]();
        for dict in dictArray
        {
            let model:ComposeMenu = ComposeMenu(dict: dict)
            modelArray.append(model)
        }
        
        return modelArray
    }
    
    func show(target: UIViewController)
    {
        self.target = target
        target.view.addSubview(self)
    }
}
