//
//  VehicleListView.swift
//  FreeNowChallenge
//
//  Created by Katharina Vujinovic on 04.12.22.
//

import SwiftUI

struct VehicleListView: View {
    
    @ObservedObject
    var viewModel: NearbyViewModel
    
    var body: some View {
        ZStack {
            if let error = viewModel.error {
                VStack() {
                    error.errorImages
                        .resizable()
                        .scaledToFit()
                    Text(error.errorMessage)
                        .font(.headline)
                }
            }
            if let vehicles = viewModel.vehicles {
                List {
                    ForEach(vehicles) { vehicle in
                        // can be put in a new one!
                        HStack() {
                            vehicle.fleetImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35, height: 40)
                                .cornerRadius(10)
                            VStack(alignment: .leading) {
                                HStack() {
                                    Text(vehicle.vehicle.fleetType.rawValue)
                                        .font(.headline)
                                    Text(vehicle.vehicle.state.rawValue)
                                        .font(.body)
                                }
                                if let distanceInMeter = vehicle.distanceInMeter {
                                    Text(distanceInMeter)
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }
        }

    }
}

