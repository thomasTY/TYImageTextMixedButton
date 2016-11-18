//
//  ComposeMenuButton.swift
//  TYImageTextMixedButton
//
//  Created by thomasTY on 16/11/16.
//  Copyright © 2016年 thomasTY. All rights reserved.
//

import UIKit
class MenuButton: UIButton
{

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - 高亮效果影响按钮的形变动画，会让动画畸形
    override var isHighlighted: Bool
    {
        get
        {
            return false
        }
        set
        {
            
        }
    }
    private func setupUI()
    {
        imageView?.contentMode = .center
        titleLabel?.textAlignment = .center
        setTitleColor(UIColor.darkGray, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 15)
    }

    override func layoutSubviews()
    {
        super.layoutSubviews()
        //自定义图片
        imageView?.frame.size.width = self.frame.size.width
        imageView?.frame.size.height = self.frame.size.width
        imageView?.frame.origin.x = 0
        imageView?.frame.origin.y = 0
        
        //自定义文字
        titleLabel?.frame.size.width = self.frame.size.width
        titleLabel?.frame.size.height = self.frame.size.height - self.frame.size.width
        titleLabel?.frame.origin.x = 0
        titleLabel?.frame.origin.y = self.frame.size.width
    }
}
