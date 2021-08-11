//
//  MyCartTableViewCell.swift
//  AddToBasket
//
//  Created by Amarena Software on 9.08.2021.
//

import UIKit

class MyCartTableViewCell: UITableViewCell {

    var amountPlusButtonAction : (() -> ())?
    var amountMinusButtonAction : (() -> ())?
    var removeButtonAction : (() -> ())?
    @IBOutlet weak var product_img: UIImageView!
    
    
    @IBOutlet weak var productAmount_lbl: UILabel!
    
    @IBOutlet weak var amountMinus_btn: UIButton!
    @IBOutlet weak var productName_lbl: UILabel!
    
    @IBOutlet weak var remove_btn: UIButton!
    @IBOutlet weak var productPrice_lbl: UILabel!
    @IBOutlet weak var amountPlus_btn: UIButton!
    
    @IBAction func remove_btn(_ sender: Any) {
        
        removeButtonAction?()
    }
    
    @IBAction func amountPlus_btn(_ sender: Any) {
        amountPlusButtonAction?()
     
    }
    @IBAction func amountMinus_btn(_ sender: Any) {
        amountMinusButtonAction?()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.amountMinus_btn.addTarget(self, action: #selector(amountMinus_btn(_:)), for: .touchUpInside)
        self.amountMinus_btn.addTarget(self, action: #selector(amountMinus_btn(_:)), for: .touchUpInside)
        self.remove_btn.addTarget(self, action: #selector(remove_btn(_:)), for: .touchUpInside)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
