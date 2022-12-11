//
//  API.swift
//  FreeNowChallenge
//
//  Created by Katharina Vujinovic on 04.12.22.
//

import CoreLocation
import Foundation
import Fetch

struct API {
    
    static func getVehicles(center: CLLocationCoordinate2D, latitudeSpan: Double, longitudeSpan: Double) -> Resource<[Vehicle]?> {
        let startLatitude = center.latitude.binade - (latitudeSpan/2)
        let startLongitude = center.longitude.binade - (longitudeSpan/2)
        let endLatitude = center.latitude + (latitudeSpan/2)
        let endLongitude = center.longitude + (longitudeSpan/2)
        return Resource(path: "/",
                        urlParameters: ["p2Lat": endLatitude,
                                        "p1Lon": startLongitude,
                                        "p1Lat": startLatitude,
                                        "p2Lon": endLongitude],
                        urlEncoding: .queryString,
                        rootKeys: ["poiList"])
    }
    
}
