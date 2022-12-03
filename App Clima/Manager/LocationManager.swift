//
//  LocationManager.swift
//  App Clima
//
//  Created by Jorge Herrera Jara on 2/12/22.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    // Creando una instancia de CLLocationManager, obtendremos las coordenadas
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init(){
        super.init()
        // Asignar un delegate a nuestra instancia de CLLocationManager
        manager.delegate = self
    }
    // Solicita la entrega única de la ubicación actual del usuario
    func requestLocation(){
        isLoading = true
        manager.requestLocation()
    }
    // Establece las coordenadas de ubicación en la variable location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate
        isLoading = false
    }
    // Esta función será llamada si nos encontramos con un error
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error en obtener la ubicacion", error)
        isLoading = false
    }
}
