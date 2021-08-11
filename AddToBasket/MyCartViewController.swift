//
//  MyCartViewController.swift
//  AddToBasket
//
//  Created by Amarena Software on 9.08.2021.
//

import UIKit
import Alamofire
import SwiftyJSON

class MyCartViewController: UIViewController {


    
    
    @IBOutlet weak var titel_lbl: UILabel!
    @IBOutlet weak var myCartTableView: UITableView!
    
    @IBOutlet weak var placeHolder_btn: UIButton!
    
    @IBOutlet weak var contunueShopping_btn: UIButton!
    
    @IBAction func placeHolder_btn(_ sender: Any) {
        appedModel()
    }
    @IBAction func contunueShopping_btn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    var user: [String:Any] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        myCartTableView.delegate = self
        myCartTableView.dataSource = self
        titel_lbl.text = "My Cart" + "(" + String(userdefaultsProductList.count) + ")"
       
        myCartTableView.tableFooterView=UIView();

    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        _ = tapGestureRecognizer.view as! UIImageView
//        let newImageView = UIImageView(image: product_img.image)
//        newImageView.frame = UIScreen.main.bounds
//        newImageView.backgroundColor = .systemBackground
//        newImageView.contentMode = .scaleAspectFit
//        newImageView.isUserInteractionEnabled = true
//        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage))
//        newImageView.addGestureRecognizer(tap)
//        self.view.addSubview(newImageView)

    }
    @objc func dismissFullscreenImage(_ sender: UITapGestureRecognizer)
    {
//        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    func appedModel(){
        
        
        var newmodel:[[String:Any]] = [[:]]
        for i in 0..<userdefaultsProductList.count
        {
            newmodel.append(["id":userdefaultsProductList[i].id,"amount":userdefaultsProductList[i].amount])
            if i == userdefaultsProductList.count - 1
            {
                newmodel.removeFirst()
                orderTheproduct(productModel: newmodel)
            }
        }
    }
    func orderTheproduct(productModel:[[String:Any]]){

         let json: [[String:Any]] = productModel
            
       
                  let url = URL(string: "https://nonchalant-fang.glitch.me/order")!
                 // let jsonData = json.data(using: .utf8, allowLossyConversion: false)!
                      let jsonData = try? JSONSerialization.data(withJSONObject: json)


                  var request = URLRequest(url: url)
                 request.httpMethod = HTTPMethod.post.rawValue
                  request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
                  request.httpBody = jsonData

                  Alamofire.request(request).responseJSON {
                      (response) in
                      
                      switch response.result{
                          
                      case .success(let value):
                          let json=JSON(value)
                       
                        if json["status"] == "success"{
                            let alert = UIAlertController(title: "Başarılı", message: "Siparişiniz Başarılı Bir Şekilde Oluşturulmuştur.", preferredStyle: UIAlertController.Style.alert)
                             alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default,  handler: {action in self.HomePage()}))

                             self.present(alert, animated: true, completion: nil)
                        }
                        else if json["status"] == "error"{
                            let alert = UIAlertController(title: "Hata", message: "Siparişiniz Stok Yetersizliği Nedeni İle Oluşturulamamıştır", preferredStyle: UIAlertController.Style.alert)
                             alert.addAction(UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default,  handler: {action in self.HomePage()}))

                             self.present(alert, animated: true, completion: nil)
                        }
            
                        
                      case .failure(let error):
                          print("hatalı")
                      }

                      
                  }
            
               
           
    }
    func HomePage(){
       
        userdefaultsProductList.removeAll()
        userdefaultsProductID.removeAll()
           dismiss(animated: true, completion: nil)
      
        // dismiss(animated: true, completion: nil)
    }


}
extension MyCartViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userdefaultsProductList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCartCell", for: indexPath) as? MyCartTableViewCell
       
       
        cell?.product_img.setImageLoad(productLink: userdefaultsProductList[indexPath.row].image, productUIImageView: (cell?.product_img)!)
        cell?.productName_lbl.text = userdefaultsProductList[indexPath.row].name
        cell?.productPrice_lbl.text = userdefaultsProductList[indexPath.row].price + "  " +  userdefaultsProductList[indexPath.row].currency
        cell?.productAmount_lbl.text = String(userdefaultsProductList[indexPath.row].amount)
        
        cell?.amountMinusButtonAction = { [unowned self] in
         
            userdefaultsProductList[indexPath.row].amount -= 1
            cell?.productAmount_lbl.text = String(userdefaultsProductList[indexPath.row].amount)
            if userdefaultsProductList[indexPath.row].amount < 1
            {
                userdefaultsProductList[indexPath.row].amount = 1
                cell?.productAmount_lbl.text = String(userdefaultsProductList[indexPath.row].amount)
            }
        }
        
        cell?.amountPlusButtonAction = { [unowned self] in
            
            
            userdefaultsProductList[indexPath.row].amount += 1
            cell?.productAmount_lbl.text = String(userdefaultsProductList[indexPath.row].amount)
        }
        
        cell?.removeButtonAction = { [unowned self] in
            
            
        
            if let index = userdefaultsProductID.index(of: userdefaultsProductList[indexPath.row].id) {
                userdefaultsProductID.remove(at: index)
                userdefaultsProductList.remove(at: indexPath.row)
              
            }
          
            myCartTableView.reloadData()
            
        }
        
        return cell!
    }
    
    
}
