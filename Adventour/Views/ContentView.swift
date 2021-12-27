//
//  ContentView.swift
//  Adventour
//
//  Created by Wanyea Barbel on 12/19/21.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var viewModel = MapViewModel()
    @State var location: String = ""

    var body: some View {
        
        Text("Good morning Wanyea,")
            .padding()
        
        Text("Where will your next Adventour be?")
            .padding()
        
        VStack(alignment: .leading) {
            TextField("Enter location...", text: $location)
            Text("Your location: \(location)")
        }.padding()
        
        Button("Go!") {
            print("Button tapped!")
        }
        
        //MapView()
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .accentColor(Color(.systemRed))
            .onAppear{
                viewModel.checkIfLocationServicesIsEnabled()
            }
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

