//
//  ViewController.swift
//  NetworkReachabilityByFramework
//
//  Created by Sanjeev Gautam on 04/12/20.
//

import UIKit

class ViewController: UIViewController, NetworkReachabilityProtocol {
    var networkPathMonitor: NetworkPathMonitor?
    
    func networkStatusChanged(isConnected: Bool) {
        print("networkStatusChanged called - \(isConnected)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.startNetworkMonitoring()
    }
    
    deinit {
        self.stopNetworkMonitoring()
    }

    @IBAction func checkNetworkStatus(_ sender: UIButton) {
        if self.isNetworkAvailable() {
            print("===== Network is Available =====")
        } else {
            print("===== Network is Not Available =====")
        }
    }
}

