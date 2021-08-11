//
//  extension.swift
//  AddToBasket
//
//  Created by Amarena Software on 7.08.2021.
//

import Foundation
import Kingfisher
import UIKit

extension UIImageView {
   
    
    func setImageLoad(productLink:String,productUIImageView:UIImageView)
    {
        
        
//        productUIImageView.layer.cornerRadius = productUIImageView.frame.height/2
//        productUIImageView.layer.masksToBounds = true
        
        productUIImageView.kf.setImage(with: URL(string: productLink),
                                      options: [
                                        .processor(DownsamplingImageProcessor(size: CGSize(width: productUIImageView.frame.size.width * UIScreen.main.scale, height: productUIImageView.frame.size.height * UIScreen.main.scale))),
                                        .scaleFactor(UIScreen.main.scale),
                                        .cacheOriginalImage
                                      ])
        productUIImageView.layer.shouldRasterize = true
        productUIImageView.layer.rasterizationScale = UIScreen.main.scale
        
        
      
        
        
    }
 
  
    
    
    
    
    
}

public var userdefaultsProductList = [ShoppingModel]()
public var userdefaultsProductID:[Int] = []
