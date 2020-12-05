//
//  ThirdViewController.swift
//  NetworkReachabilityByFramework
//
//  Created by Sanjeev Gautam on 04/12/20.
//

import UIKit

class ThirdViewController: UIViewController, NetworkReachabilityProtocol {
    var networkPathMonitor: NetworkPathMonitor?
    
    func networkStatusChanged(isConnected: Bool) {
        print("3 Network status changed: \(isConnected)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.startNetworkMonitoring()
    }
    
    deinit {
        self.stopNetworkMonitoring()
        print("ThirdViewController deinit called")
    }
    
    @IBAction func checkNetworkStatus(_ sender: UIButton) {
        if self.isNetworkAvailable() {
            print("3 ===== Network is Available =====")
        } else {
            print("3 ===== Network is Not Available =====")
        }
    }
}
