//
//  HomePageCollectionViewCell.swift
//  AddToBasket
//
//  Created by Amarena Software on 30.07.2021.
//

import UIKit

class HomePageCollectionViewCell: UICollectionViewCell {
    var addToBasketButtonAction : (() -> ())?
        
    @IBOutlet weak var product_img: UIImageView!
    
    
    @IBOutlet weak var productName_lbl: UILabel!
    
    @IBOutlet weak var productPrice_lbl: UILabel!
    
    
    @IBOutlet weak var addToBasket_btn: UIButton!
    
    @IBAction func addToBasket_btn(_ sender: Any) {
        addToBasketButtonAction?()
    }
    
 
  
    
        override func awakeFromNib() {
            super.awakeFromNib()
         
            
            self.addToBasket_btn.addTarget(self, action: #selector(addToBasket_btn(_:)), for: .touchUpInside)
            // Initialization code
        }
    
}
