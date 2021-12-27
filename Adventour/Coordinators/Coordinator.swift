//
//  Coordinator.swift
//  Adventour
//
//  Created by Wanyea Barbel on 12/26/21.
//

import Foundation
import MapKit

final class Coordinator: NSObject, MKMapViewDelegate {
    var control: MapView
    
    init(_ control: MapView) {
        self.control = control
    }
    
    
}
