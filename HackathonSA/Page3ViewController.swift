//
//  Page3ViewController.swift
//  HackathonSA
//
//  Created by Ailton Lessa on 05/08/18.
//  Copyright © 2018 Pregnant Places. All rights reserved.
//

import UIKit

class Page3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func finishOnboarding(_ sender: Any) {
        performSegue(withIdentifier: "finishOnboardingSegue", sender: nil)
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
