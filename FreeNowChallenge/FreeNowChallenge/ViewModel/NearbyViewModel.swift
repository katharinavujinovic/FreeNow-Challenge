//
//  NearbyViewModel.swift
//  FreeNowChallenge
//
//  Created by Katharina Vujinovic on 04.12.22.
//

import SwiftUI
import Combine
import Fetch
import CoreLocation
import MapKit

final class NearbyViewModel: ObservableObject {
    
    @Published var vehicles: [VehiclePOI]? = nil
    @Published var mapRegion = Configuration.DefaultLocation.region
    @Published var error: NearbyError? = nil
    @Published var selectedPOI: VehiclePOI? = nil
    
    var cancellable: Cancellable?
    
    func getNearbyVehicles(center: CLLocationCoordinate2D, span: MKCoordinateSpan)  {
        cancellable?.cancel()
        cancellable = API.getVehicles(center: center, latitudeSpan: span.latitudeDelta, longitudeSpan: span.longitudeDelta)
            .requestModel()
            .sink(receiveCompletion: { [weak self] result in
                switch result {
                case .finished:
                    // maybe a loading screen?
                    return
                case .failure:
                    self?.error = NearbyError.networkingError
                }
            }, receiveValue: { [weak self] vehicles in
                if let vehicles = vehicles, !vehicles.isEmpty {
                    var allVehicles: [VehiclePOI] = []
                    for vehicle in vehicles {
                        let distanceToUser = self?.calculateDistanceToCenter(centerLocation: center, vehicle: vehicle)
                        allVehicles.append(VehiclePOI(vehicle: vehicle, distanceToUser: distanceToUser))
                    }
                    let sortedByDistance = allVehicles.sorted { $0.distanceToUser ?? 0 < $1.distanceToUser ?? 0 }
                    self?.vehicles = sortedByDistance
                    self?.selectedPOI = sortedByDistance.first
                } else {
                    self?.error = NearbyError.noVehiclesNearby
                }
            })
    }
    
    private func calculateDistanceToCenter(centerLocation: CLLocationCoordinate2D, vehicle: Vehicle) -> CLLocationDistance {
        let centerLocation = CLLocation(latitude: centerLocation.latitude, longitude: centerLocation.longitude)
        let vehicleLocation = CLLocation(latitude: vehicle.coordinate.latitude, longitude: vehicle.coordinate.longitude)
        let distanceInMeter = centerLocation.distance(from: vehicleLocation)
        return distanceInMeter
    }
}
