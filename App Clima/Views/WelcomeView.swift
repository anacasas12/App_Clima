//
//  WelcomeView.swift
//  App Clima
//
//  Created by Jorge Herrera Jara on 2/12/22.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Bienvenido a Last Climate")
                    .bold().font(.title)
                            
                Text("Comparte tu ubicación actual para obtener el ultimo clima en tu área")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            //LocationButton, nos permite solicitar ubicacion
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()

            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
