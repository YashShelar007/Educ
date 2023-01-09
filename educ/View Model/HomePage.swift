//
//  SecondViewController.swift
//  CSE335GroupProject
//
//  Created by NewUser on 11/30/22.
//

import UIKit
import Foundation
import MapKit

class HomePage: UIViewController {

    
    @IBOutlet weak var wordOfDay: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    var userName:String?
    var userCity:String?
    var lat:Double?
    var lon:Double?
    var time:String?
    
    struct todayWord: Decodable {
           let word: String?
           let definition: String?
           let pronunciation: String?
    }
    
    
    
    struct MyResult: Codable {
        let year: Int16?
        let month: Int16?
        let day: Int16?
        let hour: Int16?
        let minute: Int16?
        let seconds: Int16?
        let milliSeconds: Int16?
        let dateTime: String?
        let data: String?
        let time: String?
        let timeZone: String?
        let dayOfWeek: String?
        let dstActive: Bool?
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
        getData2()
    }
    
    func getData2() {
        let urlAsString2 = "https://random-words-api.vercel.app/word"
                
                //print(urlAsString2)
                
                let url2 = URL(string: urlAsString2)!
                let urlSession2 = URLSession.shared
                
                let jsonQuery = urlSession2.dataTask(with: url2, completionHandler: { data, response, error -> Void in
                    if (error != nil) {
                        print(error!.localizedDescription)
                    }
                    
                    //let jsonData = data.data(encoding: .utf8)!
                    let decoder = JSONDecoder()
                    let jsonResult = try! decoder.decode([todayWord].self, from: data!)
                    
                    print(jsonResult)
                    
                   
                
                    DispatchQueue.main.async {
                        //self.results.text = res
                        self.wordOfDay.text = "\(jsonResult[0].word!): \n \(jsonResult[0].definition!) \n \(jsonResult[0].pronunciation!)"
                    }
            
                })
                
                jsonQuery.resume()
    }
    
    func getdata() {
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = userCity;
        let search = MKLocalSearch(request: request)
        search.start { response, _ in guard let response = response else { return }
           // print( response.mapItems )
            var matchingItems:[MKMapItem] = []
            matchingItems = response.mapItems
            
            for i in 0...matchingItems.count - 1
            {
                let place = matchingItems[i].placemark
                self.lat =  place.location?.coordinate.latitude
                self.lon = place.location?.coordinate.longitude
                let coordinates = CLLocationCoordinate2D( latitude: self.lat!, longitude: self.lon!)
                
                // add an annotation
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinates
                annotation.title = place.name
            }
            var latitude = round(10 * self.lat!) / 10
            var longitude = round(10 * self.lon!) / 10
            
            let urlAsString =
            "https://www.timeapi.io/api/Time/current/coordinate?latitude=\(latitude)&longitude=\(longitude)"
            //print(urlAsString)
            let url = URL(string: urlAsString)!
            
            let urlSession = URLSession.shared
            
            let jsonQuery = urlSession.dataTask(
                with: url,
                completionHandler: { data, response, error -> Void in
                    
                    if error != nil {
                        
                        print(error!.localizedDescription)
                        
                    }
                    
                    //let jsonData = data.data(encoding: .utf8)!
                    
                    let decoder = JSONDecoder()
                    
                    let jsonResult = try! decoder.decode(MyResult.self, from: data!)
                    
                    //print(jsonResult)
                    
                    //self.year = jsonResult.year
                    
                    //self.month = jsonResult.month
                    
                    //self.day = jsonResult.day
                    
                    self.time = jsonResult.time
                    
                    
                    DispatchQueue.main.async {
                        self.welcomeLabel.text = "Hello \(self.userName!) welcome to EDUC \n The time in \(self.userCity!) is \(self.time!)"
                    }
                    
                })
            
            
            
            jsonQuery.resume()
        }
    }
}
