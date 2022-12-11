//
//  MapView.swift
//  
//
//  Created by Katharina Vujinovic on 04.12.22.
//

import SwiftUI
import MapKit
import Combine
import FNViews

struct NearbyView: View {
    
    @ObservedObject var viewModel: NearbyViewModel
    
    @State private var region = Configuration.DefaultLocation.region
    
    @State private var showingVehicleList = false
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $region,
                annotationItems: viewModel.vehicles ?? [],
                annotationContent: { vehicle in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: vehicle.vehicle.coordinate.latitude,
                                                                 longitude: vehicle.vehicle.coordinate.longitude)) {
                    VehicleMapAnnotation(vehicleImage: vehicle.fleetImage)
                        .scaleEffect(viewModel.selectedPOI?.id == vehicle.id ? 1 : 0.5)
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
                
                if let error = viewModel.error {
                    ErrorView(errorImage: error.errorImage, errorMessage: error.errorMessage)
                }
                
                if let vehicles = viewModel.vehicles {
                    ZStack {
                        ForEach(vehicles) { location in
                            if viewModel.selectedPOI?.id == location.id {
                                NearestVehicleView(distance: location.distanceInMeter ?? "",
                                                   vehicleId: location.vehicle.id,
                                                   fleetType: location.vehicle.fleetType.rawValue,
                                                   vehicleState: location.vehicle.state.rawValue,
                                                   vehicleImage: location.fleetImage,
                                                   vehicleColor: location.fleetColor,
                                                   isClosestVehicle: location.id == viewModel.vehicles?.first?.id)
                            }
                        }
                    }
                    .shadow(radius: 10)
                    .padding(20)
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .move(edge: .leading)))
                    
                    AllVehiclesButton
                    .sheet(isPresented: $showingVehicleList) {
                        VehicleListView(viewModel: viewModel, vehicles: vehicles)
                    }
                }
            }
        }
    }
    
}

extension NearbyView {
    
    private var AllVehiclesButton: some View {
        Button {
            showingVehicleList.toggle()
        } label: {
            Label {
                Text("All Vehicles Nearby")
                    .font(.body)
            } icon: {
                Image(systemName: "heart")
            }
            .labelStyle(.titleOnly)
            .foregroundColor(Color.white)
            .padding(6)
            .background(Color.gray)
            .cornerRadius(10)
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


