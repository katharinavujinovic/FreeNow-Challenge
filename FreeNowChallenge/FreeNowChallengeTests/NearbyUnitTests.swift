//
//  NearbyUnitTests.swift
//  FreeNowChallengeTests
//
//  Created by Katharina Müllek on 11.12.22.
//

import Foundation
import Fetch
import CoreLocation
import Combine
import XCTest
@testable import FreeNowChallenge

final class NearbyUnitTests: XCTestCase {

    let resource = Resource<[Vehicle]?>(path: "/")
    var expectation: XCTestExpectation!
    var nearbyViewModel: NearbyViewModel!
    
    private var cancellables: Set<AnyCancellable> = []
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        expectation = XCTestExpectation()
        nearbyViewModel = NearbyViewModel()
        
        let config = Config(baseURL: Configuration.Client.baseURL,
                            shouldStub: true)
        APIClient.shared.setup(with: config)
    }

    override func tearDownWithError() throws {
        APIClient.shared.stubProvider.removeAll()
        nearbyViewModel = nil
        try super.tearDownWithError()
    }

    func testGetNearbyVehiclesSuccess() throws {
        let responseData = NSDataAsset(name: "VehicleResponse_valid")!
        let stub = StubResponse(statusCode: 200, data: responseData.data, delay: 0)
        APIClient.shared.stubProvider.register(stub: stub, for: resource)
        
        nearbyViewModel.$vehicles.dropFirst().sink { vehicles in
            XCTAssertEqual(vehicles?.count, 6)
            XCTAssertEqual(vehicles?.first?.distanceInMeter, "1.29 km")
            self.expectation.fulfill()
        }.store(in: &cancellables)
        
        performGetNearbyVehicles()
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testGetNearbyVehiclesEmpty() throws {
        let responseData = NSDataAsset(name: "VehicleResponse_empty")!
        let stub = StubResponse(statusCode: 200, data: responseData.data, delay: 0)
        APIClient.shared.stubProvider.register(stub: stub, for: resource)
        
        nearbyViewModel.$error.dropFirst().sink { error in
            XCTAssertEqual(error, NearbyError.noVehiclesNearby)
            self.expectation.fulfill()
        }.store(in: &cancellables)
        
        performGetNearbyVehicles()
        
        wait(for: [expectation], timeout: 1)
    }
    
    func testGetNearbyVehiclesError() throws {
        let stub = StubResponse(statusCode: 400, data: Data(), delay: 0)
        APIClient.shared.stubProvider.register(stub: stub, for: resource)
        
        nearbyViewModel.$error.dropFirst().sink { error in
            XCTAssertEqual(error, NearbyError.networkingError)
            self.expectation.fulfill()
        }.store(in: &cancellables)
        
        performGetNearbyVehicles()
        
        wait(for: [expectation], timeout: 1)
    }

}

extension NearbyUnitTests {
    
    private func performGetNearbyVehicles() {
        nearbyViewModel.getNearbyVehicles(center: Configuration.DefaultLocation.region.center, span: Configuration.DefaultLocation.region.span)
    }
    
}
