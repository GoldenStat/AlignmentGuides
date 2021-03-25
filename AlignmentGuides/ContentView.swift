//
//  ContentView.swift
//  AlignmentGuides
//
//  Created by Alexander Völz on 25.03.21.
//

import SwiftUI

struct ContentView: View {
    @State private var activeIndex = 1
    
    @Namespace var token
    @Namespace var noToken
    
    let objectCount = 5 // must be smaller than PlayerGrid.maxObjects

    let markerSize : CGFloat = 40
        
    func ns(index: Int) -> Namespace.ID {
        index == activeIndex ?
        token : noToken
    }
    
    var body: some View {
        ZStack(alignment: .markerAlignment) {
            VStack {
                ForEach(0 ..< PlayerGrid.rows) { row in
                    HStack
                    {
                        ForEach(0 ..< PlayerGrid.cols) { col in
                            let gridItem = PlayerGrid(row: row, col: col)
                            if objectCount >= gridItem.index,
                               let edge = gridItem.tokenEdge {
                                PlayerBox(name: gridItem.index.description, isActive: gridItem.index == activeIndex)
                                    .onTapGesture {
                                        activeIndex = gridItem.index
                                    }
                                    .tokenize(edge: edge,
                                              nameSpace: ns(index: gridItem.index))
                            }
                        }
                    }
                }
            }
            .padding(markerSize)
            TokenView(size: markerSize)
                .matchedGeometryEffect(id: String.tokenNameSpace, in: token)
        }
        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
