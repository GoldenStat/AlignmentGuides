//
//  Alignments.swift
//  AlignmentGuides
//
//  Created by Alexander Völz on 25.03.21.
//

import SwiftUI

extension VerticalAlignment {
    private enum MarkerAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[VerticalAlignment.center]
        }
    }
    
    static let markerAlignment = VerticalAlignment(MarkerAlignment.self)
}

extension HorizontalAlignment {
    private enum MarkerAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            return d[HorizontalAlignment.center]
        }
    }
    
    static let markerAlignment = HorizontalAlignment(MarkerAlignment.self)
}

extension Alignment {
    static let markerAlignment = Alignment(horizontal: .markerAlignment, vertical: .markerAlignment)
}

/// hard-coded alignments for indices, wrapped into an object
struct AlignmentObject {
    var markerAlignment: Alignment
    var playerAlignment: Alignment
    
    static func alignment(for index: Int) -> AlignmentObject {
        switch index {
        case 1:
            return AlignmentObject(markerAlignment: .center,
                                   playerAlignment: .topLeading)
        case 2:
            return AlignmentObject(markerAlignment: .bottom,
                                   playerAlignment: .top)
        case 3:
            return AlignmentObject(markerAlignment: .center,
                                   playerAlignment: .topTrailing)
        case 4:
            return AlignmentObject(markerAlignment: .topTrailing,
                                   playerAlignment: .bottomLeading)
        case 5:
            return AlignmentObject(markerAlignment: .topLeading,
                                   playerAlignment: .bottomTrailing)
        default:
            return AlignmentObject(markerAlignment: .center,
                                   playerAlignment: .center)
        }
    }
}

