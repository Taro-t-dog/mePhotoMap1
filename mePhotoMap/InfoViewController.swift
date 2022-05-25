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
    
     var photoInfos = [PhotoInfo]()
    
    @IBOutlet var dateLabel: UILabel!
    
    var addressString:String = ""
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var longtitudeAndLatitude: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPhotoInfoData()
        

        // Do any additional setup after loading the view.
    }
    func getPhotoInfoData() {
        photoInfos = Array(realm.objects(PhotoInfo.self)).reversed()
        
    }
    func getImageURL(fileName: String) -> URL {
           let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
           return docDir.appendingPathComponent(fileName)
       }
    
    
    
    
    func convert(latitude: CLLocationDegrees, longtitude: CLLocationDegrees){
            let geocorder = CLGeocoder()
            let location = CLLocation(latitude: latitude, longitude: longtitude)
            

            geocorder.reverseGeocodeLocation(location) { (placeMarks, error) in
                if let placeMark = placeMarks?.first {
                    self.addressString = """
                    郵便番号：\(placeMark.postalCode ?? "検出不可")
                    名前：\(placeMark.name ?? "検出不可")
                    都道府県：\(placeMark.administrativeArea ?? "検出不可")
                    市区町村：\(placeMark.locality ?? "検出不可")
                """
                    self.addressLabel.text = self.addressString
                }
            }
        }
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
