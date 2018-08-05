//
//  GPSNotAvailableViewController.swift
//  HackathonSA
//
//  Created by Ian Manor on 05/08/18.
//  Copyright © 2018 Pregnant Places. All rights reserved.
//

import UIKit
import CoreLocation

class GPSNotAvailableViewController: UIViewController {

    @IBOutlet weak var dismissPermissionViewButton: UIButton!
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(checkLocationPermission), name: Notification.Name.UIApplicationWillEnterForeground, object: nil)

        // Do any additional setup after loading the view.
        locationManager.requestWhenInUseAuthorization()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func checkLocationPermission() {
        if CLLocationManager.locationServicesEnabled() {
            dismissPermissionViewButton.isHidden = false
            self.presentingViewController?.dismiss(animated: false, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissView(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
