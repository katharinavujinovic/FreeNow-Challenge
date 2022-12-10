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
    
    @State private var showingVehicleList = false
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region,
                annotationItems: viewModel.vehicles ?? [],
                annotationContent: { vehicle in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: vehicle.vehicle.coordinate.latitude,
                                                                 longitude: vehicle.vehicle.coordinate.longitude)) {
                    VehicleMapAnnotationView(vehicle: vehicle)
                        .scaleEffect(viewModel.selectedPOI?.id == vehicle.id ? 1 : 0.7)
                        .shadow(radius: 5)
                        .onTapGesture {
                            viewModel.selectedPOI = vehicle
                        }
                }
            }).onChange(of: region, perform: { newRegion in
                self.viewModel.getNearbyVehicles(center: newRegion.center,
                                                 span: newRegion.span)
            }).ignoresSafeArea()
            CenterMapPin()
            VStack {
                Spacer()
                
                if let vehicles = viewModel.vehicles {
                    ZStack {
                        ForEach(vehicles) { location in
                            if viewModel.selectedPOI?.id == location.id {
                                NearestVehicleView(vehiclePOI: location,
                                                   isClosestVehicle: location.id == viewModel.vehicles?.first?.id)
                            }
                        }
                    }
                    .shadow(radius: 10)
                    .padding(20)
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .move(edge: .leading)))
                }
                
                Button {
                    showingVehicleList.toggle()
                } label: {
                    Label {
                        Text("All Vehicles Nearby")
                            .font(.body)
                    } icon: {
                        Image(systemName: "heart")
                    }
                    .foregroundColor(Color.white)
                    .frame(width: .infinity, height: .infinity)
                    .padding(6)
                    .background(Color.gray)
                    .cornerRadius(10)
                }
                .sheet(isPresented: $showingVehicleList) {
                    VehicleListView(vehicles: viewModel.vehicles, error: viewModel.error)
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
