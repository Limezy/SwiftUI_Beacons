//
//  BeaconDetector.swift
//  BeaconsDetector
//
//  Created by Amr Hesham on 10/10/2021.
//

import Foundation
import Combine
import CoreLocation

@Observable
class BeaconDetector: NSObject, ObservableObject, CLLocationManagerDelegate {
    //var didChange = PassthroughSubject<Void, Never>()
    var locationManager: CLLocationManager?
    var lastDistance: CLProximity = .unknown
    var rssi: Int = 0
    
    override init() {
        super.init()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }
    
    func startScanning() {
        let uuid = UUID(uuidString: "11111111-2222-2222-2222-333333333333")
        
        guard let uuid = uuid else {
            print("Invalid UUID string")
            return
        }
        
        let constraint = CLBeaconIdentityConstraint(uuid: uuid, major: 123, minor: 456)
        let beaconRegion = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: "MyBeacon")
        
        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(satisfying: constraint)
    }
    
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) {
        if let beacon = beacons.first {
            lastDistance = beacon.proximity
            rssi = beacon.rssi
        } else {
            lastDistance = .unknown
            rssi = 0
        }
    }
}
