//
//  ContentView.swift
//  BeaconsDetector
//
//  Created by Amr Hesham on 10/10/2021.
//

import SwiftUI
import Combine
import CoreLocation

struct ContentView: View {
    @State private var detector = BeaconDetector()
    var body: some View {
        BeaconStateView(beaconState: detector.lastDistance, beaconRssi: detector.rssi)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
