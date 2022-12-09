//
//  MapView.swift
//  
//
//  Created by Katharina Vujinovic on 04.12.22.
//

import SwiftUI
import MapKit
import Combine

struct NearbyView: View {
    
    @ObservedObject
    var viewModel: NearbyViewModel
    
    @State
    private var region = Configuration.DefaultLocation.region
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region, annotationItems: viewModel.vehicles ?? [], annotationContent: { vehicle in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: vehicle.vehicle.coordinate.latitude, longitude: vehicle.vehicle.coordinate.longitude)) {
                    VehicleMapAnnotationView(vehicle: vehicle)
                }
            }).onChange(of: region, perform: { newRegion in
                self.viewModel.getNearbyVehicles(center: newRegion.center, span: newRegion.span)
            })
                .ignoresSafeArea()
            VStack {
                Spacer()
                ZStack {
                    VehicleListView(viewModel: viewModel)
                        .frame(maxHeight: UIScreen.main.bounds.height / 3)
                        .cornerRadius(20)
                        .shadow(radius: 10)
                        .padding()
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NearbyView(viewModel: NearbyViewModel())
    }
}
#endif
