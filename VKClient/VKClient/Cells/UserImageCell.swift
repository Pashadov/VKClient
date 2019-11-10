//
//  UserImageCell.swift
//  VKClient
//
//  Created by Macbook Air on 10.11.2019.
//  Copyright © 2019 Pavlo. All rights reserved.
//

import UIKit

class UserImageCell: UICollectionViewCell {
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var likesTextCount: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        userImage.image = nil
        likesTextCount.text = nil
    }
}
