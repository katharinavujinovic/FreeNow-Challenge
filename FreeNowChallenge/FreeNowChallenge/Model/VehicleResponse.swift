//
//  Vehicles.swift
//  FreeNowChallenge
//
//  Created by Katharina Vujinovic on 04.12.22.
//

import Foundation

class Vehicle: Codable, Identifiable {
    let id: Int
    let coordinate: Coordinate
    let state: VehicleState
    let fleetType: FleetType
    let heading: Double
    
    enum FleetType: String, Codable {
        case taxi = "TAXI"
    }
    
    enum VehicleState: String, Codable {
        case vehicleIsActive = "ACTIVE"
        case vehicleIsInactive = "INACTIVE"
    }
    
    init(id: Int, coordinate: Coordinate, state: VehicleState, fleetType: FleetType, heading: Double) {
        self.id = id
        self.coordinate = coordinate
        self.state = state
        self.fleetType = fleetType
        self.heading = heading
    }
}

struct Coordinate: Codable {
    let latitude: Double
    let longitude: Double
}
