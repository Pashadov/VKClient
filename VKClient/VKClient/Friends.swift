//
//  Friends.swift
//  VKClient
//
//  Created by Macbook Air on 31.10.2019.
//  Copyright © 2019 Pavlo. All rights reserved.
//


import UIKit

struct Friend {
    let avatar: UIImage
    let name: String
    let surname: String
    
    let photos: [Photo]
    
}

struct Photo {
    let image: UIImage
    let likes: Int
    let comments: [String]
}
