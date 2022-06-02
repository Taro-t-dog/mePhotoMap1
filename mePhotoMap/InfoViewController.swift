//
//  InfoViewController.swift
//  mePhotoMap
//
//  Created by 瀬川太朗 on 2022/05/22.
//

import UIKit
import  MapKit
import RealmSwift
class InfoViewController: UIViewController {
    let realm = try! Realm()
 
    
     
    
    let photoInfo = PhotoInfo()
    
    @IBOutlet var dateLabel: UILabel!
    
    var addressString:String = "ww"
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var latitudeLabel: UILabel!
    
    @IBOutlet weak var longtitudeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //getInfoData()
        
        longtitudeLabel.text = ("北\(photoInfo.latitude)")
        latitudeLabel.text = ("東\(photoInfo.longtitude)")
        
        
       
      
      
        

        // Do any additional setup after loading the view.
}
    @IBAction func onToppedUPloadButton() {
        if photoImageView.image != nil {
            let activityVC = UIActivityViewController(activityItems: [photoImageView!,"#mePhotoMap"], applicationActivities: nil)
            self.present(activityVC,animated: true,completion: nil)
        }else{
            print("画像がありません")
        }
    }
    
    
    
    func getImage() {
        if let imageFileName = photoInfo.imageFileName {
                  let path = getImageURL(fileName: imageFileName).path // 画像のパスを取得
                  if FileManager.default.fileExists(atPath: path) { // pathにファイルが存在しているかチェック
                      if let imageData = UIImage(contentsOfFile: path) { // pathに保存されている画像を取得
                          photoImageView.image = imageData
                      } else {
                          print("Failed to load the image. path = ", path)
                      }
                  } else {
                      print("Image file not found. path = ", path)
                  }
              }

          }

    func getImageURL(fileName: String) -> URL {
           let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
           return docDir.appendingPathComponent(fileName)
       }
    


    }
   
    
    
    
    
    
    
//    func convert(latitude: CLLocationDegrees, longtitude: CLLocationDegrees) -> String{
//        let photoInfoArray = realm.objects(PhotoInfo.self)
//         for photoInfo in photoInfoArray {
//            let longtitude = photoInfo.longtitude
//            let latitude = photoInfo.latitude
//            let geocorder = CLGeocoder()
//            let location = CLLocation(latitude: latitude, longitude: longtitude)
//
//
//            geocorder.reverseGeocodeLocation(location) { (placeMarks, error) in
//                if let placeMark = placeMarks?.first {
//                    self.addressString = """
//                    郵便番号：\(placeMark.postalCode ?? "検出不可")
//                    名前：\(placeMark.name ?? "検出不可")
//                    都道府県：\(placeMark.administrativeArea ?? "検出不可")
//                    市区町村：\(placeMark.locality ?? "検出不可")
//                """
//                   self.addressLabel.text = self.addressString
//                }
//            }
//        }
//        return addressString
//
//    }
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
     
    */



