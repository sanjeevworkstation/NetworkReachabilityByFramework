//
//  NetworkReachabilityProtocol.swift
//  NetworkReachabilityByFramework
//
//  Created by Sanjeev Gautam on 04/12/20.
//

import Foundation
import Network

typealias NetworkPathMonitor = NWPathMonitor

protocol NetworkReachabilityProtocol: AnyObject {
    var networkPathMonitor: NetworkPathMonitor? { get set }
    func networkStatusChanged(isConnected: Bool)
    
    // To check network status
    func isNetworkAvailable() -> Bool
    
    // Start & Stop network monitoring
    func startNetworkMonitoring()
    func stopNetworkMonitoring()
}

extension NetworkReachabilityProtocol {
    func isNetworkAvailable() -> Bool {
        if self.networkPathMonitor?.currentPath.status == .satisfied {
            return true
        } else {
            return false
        }
    }
}

extension NetworkReachabilityProtocol {
    func startNetworkMonitoring() {
        if self.networkPathMonitor == nil {
            self.networkPathMonitor = NWPathMonitor()
        }
        
        let queue = DispatchQueue(label: "NetworkMonitoring")
        self.networkPathMonitor?.pathUpdateHandler = { [weak self] (path) in
            if self?.networkPathMonitor?.currentPath.status == .satisfied {
                self?.networkStatusChanged(isConnected: true)
            } else {
                self?.networkStatusChanged(isConnected: false)
            }
        }
        self.networkPathMonitor?.start(queue: queue)
    }
}

extension NetworkReachabilityProtocol {
    func stopNetworkMonitoring() {
        self.networkPathMonitor?.cancel()
        self.networkPathMonitor = nil
    }
}
