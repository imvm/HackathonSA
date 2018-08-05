//
//  CheckResultViewController.swift
//  HackathonSA
//
//  Created by Ian Manor on 05/08/18.
//  Copyright © 2018 Pregnant Places. All rights reserved.
//

import UIKit
import Hero

class CheckResultViewController: UIViewController {

    @IBOutlet weak var okToSwimImage: UIImageView!
    
    @IBOutlet weak var okToSwimLabel: UILabel!
    
    @IBOutlet weak var okToSwimTimeLabel: UILabel!
    
    @IBOutlet weak var moreBeachesButton: UIButton!
    
    @IBOutlet weak var moreInformationButton: UIButton!
    
    @IBOutlet weak var reportWasteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        okToSwimImage.hero.id = "beachImage"
        
        okToSwimLabel.hero.id = "beachLabel"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func getViewController(withIdentifier identifier: String) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: identifier)
    }
    
    @IBAction func viewDetails(_ sender: Any) {
        let nextVC = getViewController(withIdentifier: "BathingSpotDetails")
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func viewMoreBeaches(_ sender: Any) {
        let nextVC = getViewController(withIdentifier: "BathingSpotTable")
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @IBAction func reportWaste(_ sender: Any) {
        let nextVC = getViewController(withIdentifier: "ReportWaste")
        self.present(nextVC, animated: true, completion: nil)
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
