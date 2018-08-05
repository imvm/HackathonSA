//
//  ViewController.swift
//  HackathonSA
//
//  Created by Ian Manor on 04/08/18.
//  Copyright © 2018 Pregnant Places. All rights reserved.
//

import UIKit
import CoreLocation
import RxSwift
import RxCocoa
import Moya
import Hero

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager!
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var beachImageView: UIImageView!
    
    @IBOutlet weak var checkBeachButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        beachImageView.hero.id = "beachIcon"
        checkBeachButton.hero.id = "beachLabel"
        
        NotificationCenter.default.addObserver(self, selector: #selector(checkLocationPermission), name: Notification.Name.UIApplicationWillEnterForeground, object: nil)
    }
    
    @objc func checkLocationPermission() {
        if CLLocationManager.locationServicesEnabled() {
            getCurrentLocation()
        } else {
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GPSNotAvailableView") as UIViewController
            /*
            let aObjNavi = UINavigationController(rootViewController: viewController)
            
            self.present(aObjNavi, animated: true) {
                
            }
            */
            
            //self.navigationController?.pushViewController(viewController, animated: false)
            
            self.present(viewController, animated: false, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        checkLocationPermission()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getCurrentLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        
        print("user latitude = \(latitude)")
        print("user longitude = \(longitude)")

        let provider = MoyaProvider<BathingQualityService>()
        provider.rx.request(.getNearestBathingSpots(latitude: latitude, longitude: longitude))
            .filterSuccessfulStatusCodes()
            .mapJSON()
            .subscribe({ event in
            switch event {
            case .success(let json):
                print(json)
            case .error(let error):
                print(error)
            }
        })
        .disposed(by: disposeBag)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
    @IBAction func checkBeach(_ sender: Any) {
        performSegue(withIdentifier: "negativeResultSegue", sender: nil)
    }
    
}

