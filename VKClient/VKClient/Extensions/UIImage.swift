//
//  UIImage.swift
//  VKClient
//
//  Created by Macbook Air on 10.11.2019.
//  Copyright © 2019 Pavlo. All rights reserved.
//

import UIKit


extension UIImage {
    
    static var empty: UIImage {
        return UIGraphicsImageRenderer(size: CGSize.zero).image { _ in }
    }
    
}

