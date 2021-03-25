//
//  PlayerBox.swift
//  AlignmentGuides
//
//  Created by Alexander Völz on 25.03.21.
//

import SwiftUI

struct PlayerBox: View {
    var name: String
    var isActive: Bool = false
    var borderColor: Color { isActive ? .primary : .secondary }
    var body: some View {
        Color.green
            .cornerRadius(12)
            .opacity(isActive ? 0.8 : 0.4)
            .frame(width: 100, height: 200)
            .overlay(Text(name)
                        .font(.largeTitle)
                        .scaleEffect(isActive ? 1.3 : 1.0)
                        .foregroundColor(isActive ? .red : .white)
        )
    }
}


struct PlayerBox_Previews: PreviewProvider {
    static var previews: some View {
        PlayerBox(name: "1")
    }
}
