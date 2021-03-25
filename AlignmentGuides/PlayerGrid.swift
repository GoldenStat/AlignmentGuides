//
//  PlayerGrid.swift
//  AlignmentGuides
//
//  Created by Alexander Völz on 25.03.21.
//

import Foundation

/// to make the code a little clearer
///
/// PlayerGrid(0,0).index == 1
///
/// PlayerGrid.rows == 2, PlayerGrid.cols == 2 means a 2x2-Grid

struct PlayerGrid {
    static let rows = 2
    static let cols = 3
    
    /// how many objects the Grid can hold
    static var maxObject: Int { rows * cols }
    
    var row: Int
    var col: Int
    
    /// calculated index for this row and column
    var index: Int {
        get {
            row * Self.cols + col + 1
        }
        
        // not really needed in this example, but since we are already at it...
        set {
            let adjustedIndex = newValue - 1
            self.row = adjustedIndex / Self.cols
            self.col = adjustedIndex % Self.cols
        }
    }
}
