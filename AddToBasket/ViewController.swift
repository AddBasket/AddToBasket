//
//  ViewController.swift
//  AddToBasket
//
//  Created by Amarena Software on 30.07.2021.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var collectionview: UICollectionView!
    
    var productList = [ShoppingModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = self
        collectionview.dataSource = self
        
        downloadInformation()
        // Do any additional setup after loading the view.
    }

    
    func downloadInformation(){


              let url = URL(string: "https://nonchalant-fang.glitch.me/listing")!

              var request = URLRequest(url: url)
             request.httpMethod = HTTPMethod.get.rawValue
              request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")

              Alamofire.request(request).responseJSON {
                  (response) in
                  
                  switch response.result{
                      
                  case .success(let value):
                      let json=JSON(value)
                    for i in 0..<json.count
                    {
                        let shopping = ShoppingModel()
                        shopping.id = json[i]["id"].intValue
                        shopping.image = json[i]["image"].stringValue
                        shopping.name = json[i]["name"].stringValue
                        shopping.price = json[i]["price"].stringValue
                        shopping.currency = json[i]["currency"].stringValue
                        shopping.amount = 1
                        self.productList.append(shopping)
                     }
                    self.collectionview.reloadData()
                    
                  case .failure(let error):
                      print("hatalı")
                  }

                  
              }
        
           
       }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate
{
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of items
        return productList.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageIdentifier", for: indexPath) as? HomePageCollectionViewCell
        cell?.product_img.setImageLoad(productLink: productList[indexPath.row].image, productUIImageView: (cell?.product_img)!)
        cell?.productName_lbl.text = productList[indexPath.row].name
        cell?.productPrice_lbl.text = productList[indexPath.row].price + "  " + productList[indexPath.row].currency
        
//        cell!.backgroundColor = UIColor.white
        cell!.layer.borderColor = UIColor.black.cgColor
        cell!.layer.borderWidth = 1
//        cell!.layer.cornerRadius = 8
        cell?.layer.masksToBounds
//        cell?.frame = (cell?.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)))!
        cell!.clipsToBounds = true
        
        cell?.addToBasketButtonAction = {[unowned self] in
            let storyboard :UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MyCartStoryboard") as! MyCartViewController

       
            if userdefaultsProductList.count > 0{
            for i in 0..<userdefaultsProductList.count{

                if userdefaultsProductID.contains(productList[indexPath.row].id)
                {

                    userdefaultsProductList[i].amount += 1
                }
                else{
                    userdefaultsProductList.append(productList[indexPath.row])
                    userdefaultsProductID.append(productList[indexPath.row].id)

                }
            }
            }
            else{
                userdefaultsProductList.append(productList[indexPath.row])
                userdefaultsProductID.append(productList[indexPath.row].id)
               
            }
           
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        
        return cell!
    }
  
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
    
      
        
    }
    
    /*  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
     tableView.deselectRow(at: indexPath, animated: true)
     var user = FUser(_dictionary: Dictionary<String,Any>.init() as NSDictionary)
     user.objectId  = "79XV2GbqDRXDCHVaF6P7T7KNCzm1"
     user.username = "amarena"
     goToChat(user: user)
     // goToChat()
     }*/
    
}

extension ViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2
        let heightPerItem = widthPerItem
       
        return CGSize(width:widthPerItem, height:heightPerItem)
        
        
        //        let bounds = collectionView.bounds
        //        // let width = self.view.frame.width - 16.0 * 2
        //        // let height: CGFloat = 234.0
        //
        //        return CGSize(width: bounds.width/4, height: bounds.height/4)
    }
}




