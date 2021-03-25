//
//  ActivePlayerMarkerView.swift
//  AlignmentGuides
//
//  Created by Alexander Völz on 25.03.21.
//

import SwiftUI

/// the marker shows who is "active", e.g. the dealer
struct ActivePlayerMarkerView: View {
    var size : CGFloat
    var body: some View {
        Circle()
            .frame(width: size, height: size)
    }
}

struct ActivePlayerMarkerView_Previews: PreviewProvider {
    static var previews: some View {
        ActivePlayerMarkerView(size: 80)
    }
}
