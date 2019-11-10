//
//  UIBezierPath.swift
//  VKClient
//
//  Created by Macbook Air on 10.11.2019.
//  Copyright © 2019 Pavlo. All rights reserved.
//

import UIKit

extension UIBezierPath {
    convenience init(heartIn rect: CGRect) {
        self.init()
    }
}
extension Int {
    var degreesToRadians: CGFloat { return CGFloat(self) * .pi / 180 }
}
