//
//  MapViewModel.swift
//  Adventour
//
//  Created by Wanyea Barbel on 12/27/21.
//

import CoreLocation
import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 28.6024, longitude: -81.2079)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    static let defaultAuthorizedLocationSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation,
                                               span: MapDetails.defaultSpan)
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("You need to enable your location.")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("Your location is restricted likely due to parental controls.")
            case .denied:
                print("You have denied this app location permission. Go into settings to change it.")
            case .authorizedAlways, .authorizedWhenInUse:
                region = MKCoordinateRegion(center: locationManager.location!.coordinate,
                                            span: MapDetails.defaultAuthorizedLocationSpan)
            @unknown default:
                break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}
