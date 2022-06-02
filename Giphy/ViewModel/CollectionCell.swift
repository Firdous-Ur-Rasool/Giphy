//
//  CollectionCell.swift
//  Giphy
//
//  Created by FIRDOUS UR RASOOL on 01/06/22.
//

import UIKit
//import ImageIO
import SDWebImage
class CollectionCell: UICollectionViewCell {
    @IBOutlet weak var myImage: UIImageView!
  
    // Gif to be displayed.
        var gif: Gif?
        override func layoutSubviews() {
            super.layoutSubviews()
            // Make sure cell has a gif object
            if gif != nil {
                // Grab gif from gif object and display it inside the imageview
                let gifURL = URL(string: gif!.getGifURL())
                myImage.sd_setImage(with: gifURL)
            }
        }
}
