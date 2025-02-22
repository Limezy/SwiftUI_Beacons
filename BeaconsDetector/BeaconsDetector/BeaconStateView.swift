//
//  BeaconStateView.swift
//  BeaconsDetector
//
//  Created by Amr Hesham on 10/10/2021.
//

import SwiftUI
import CoreLocation

struct BeaconStateView: View {
    var beaconState: CLProximity
    var beaconRssi: Int
    var label: String {
        switch beaconState {
        case .unknown:
            "Unknown"
        case .immediate:
            "Immediate"
        case .near:
            "Near"
        case .far:
            "Far"
        @unknown default:
            "Default"
        }
        
    }
    var body: some View {
        VStack {
            Text(label)
            Text(String(beaconRssi))
        }
        .font(Font.system(size: 56, design: .rounded))
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.gray)
        .edgesIgnoringSafeArea(.all)
    }
}

struct BeaconStateView_Previews: PreviewProvider {
    static var previews: some View {
        BeaconStateView(beaconState: .far, beaconRssi: 0)
    }
}
