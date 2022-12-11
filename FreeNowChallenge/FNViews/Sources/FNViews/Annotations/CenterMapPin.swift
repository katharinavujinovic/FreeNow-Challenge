//
//  CenterMapPin.swift
//  FNViews
//
//  Created by Katharina Vujinovic on 09.12.22.
//

import SwiftUI

public struct CenterMapPin: View {
    
    public init() {}
    
    public var body: some View {
        Image(systemName: "location.north.fill")
            .foregroundColor(.pink)
            .frame(width: 35, height: 35)
            .rotationEffect(Angle(degrees: 180))
    }
}

struct CenterMapPin_Previews: PreviewProvider {
    static var previews: some View {
        CenterMapPin()
    }
}
