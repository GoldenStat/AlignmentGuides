//
//  TokenView.swift
//  AlignmentGuides
//
//  Created by Alexander Völz on 25.03.21.
//

import SwiftUI

/// the marker shows who is "active", e.g. the dealer
struct TokenView: View {
    var size : CGFloat
    var color: Color = .primary
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: size, height: size)
    }
}

struct TokenView_Previews: PreviewProvider {
    static var previews: some View {
        TokenView(size: 80)
    }
}
