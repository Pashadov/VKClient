//
//  FriendsImageController.swift
//  VKClient
//
//  Created by Macbook Air on 10.11.2019.
//  Copyright © 2019 Pavlo. All rights reserved.
//

import UIKit

class FriendsImageController: UICollectionViewController {
    var friend: User!
    var likeControl: LikeControl = LikeControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(friend != nil)
        
        title = "\(friend.firstName) \(friend.lastName)"
        
        likeControl.addTarget(self, action: #selector(likedChanged), for: .valueChanged)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    @objc func likedChanged(){
        if likeControl.isLiked{
            print("like +1")
        } else{
            print("like -1")
        }
        
    }

    override func collectionView(_ collectionView: UICollectionView,  numberOfItemsInSection section: Int) -> Int {
        return friend.photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView,  cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userImageCell", for: indexPath) as! UserImageCell
        cell.userImage.image = friend.photos[indexPath.item]
        
        return cell
    }
}
