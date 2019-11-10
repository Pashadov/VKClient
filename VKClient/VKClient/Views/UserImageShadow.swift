//
//  UserImageShadow.swift
//  VKClient
//
//  Created by Macbook Air on 10.11.2019.
//  Copyright © 2019 Pavlo. All rights reserved.
//

import UIKit

@IBDesignable class UserImageShadow: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.layer.cornerRadius = 25
        self.layer.shadowColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }

}
