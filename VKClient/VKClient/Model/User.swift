//
//  User.swift
//  VKClient
//
//  Created by Macbook Air on 10.11.2019.
//  Copyright © 2019 Pavlo. All rights reserved.
//

import UIKit
class User {
    let firstName: String
    let lastName: String
    let image: UIImage
    let photos: [UIImage]
    
    init(firstName: String, lastName: String, image: UIImage, photos: [UIImage]) {
        self.firstName = firstName
        self.lastName = lastName
        self.image = image
        self.photos = photos
    }
}
