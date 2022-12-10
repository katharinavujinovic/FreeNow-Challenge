//
//  CenterMapPin.swift
//  FreeNowChallenge
//
//  Created by Katharina Müllek on 09.12.22.
//

import SwiftUI

struct CenterMapPin: View {
    var body: some View {
        Image(systemName: "location.north.fill")
            .foregroundColor(.pink)
            .frame(width: 25, height: 25)
            .rotationEffect(Angle(degrees: 180))
    }
}

struct CenterMapPin_Previews: PreviewProvider {
    static var previews: some View {
        CenterMapPin()
    }
}
