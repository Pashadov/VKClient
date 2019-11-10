//
//  AvatarSetting.swift
//  VKClient
//
//  Created by Macbook Air on 10.11.2019.
//  Copyright © 2019 Pavlo. All rights reserved.
//

import UIKit

struct AvatarSettings {
    
    let tableViewHeight = 66
    var cornerRadius : CGFloat {
        get {
            return CGFloat((tableViewHeight - 20) / 2)
        }
    }
}

let avatarSettings = AvatarSettings()
