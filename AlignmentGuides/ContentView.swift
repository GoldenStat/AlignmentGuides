//
//  ContentView.swift
//  AlignmentGuides
//
//  Created by Alexander Völz on 25.03.21.
//

import SwiftUI

struct ContentView: View {
    @State private var activeIndex = 1
    
    let objectCount = 5 // must be smaller than PlayerGrid.maxObjects

    let markerSize : CGFloat = 80
        
    var body: some View {
        ZStack(alignment: .markerAlignment) {
            VStack {
                ForEach(0 ..< PlayerGrid.rows) { row in
                    HStack
                    {
                        ForEach(0 ..< PlayerGrid.cols) { col in
                            let count = PlayerGrid(row: row, col: col)
                            if objectCount >= count.index {
                                if count.index == activeIndex {
                                    PlayerBox(name: count.index.description, isActive: true)
                                        .transition(AnyTransition.identity)
                                        .alignmentGuide(HorizontalAlignment.markerAlignment, computeValue: { dimension in
                                            dimension[AlignmentObject.alignment(for: activeIndex).playerAlignment.horizontal]
                                        })
                                        .alignmentGuide(VerticalAlignment.markerAlignment, computeValue: { dimension in
                                            dimension[AlignmentObject.alignment(for: activeIndex).playerAlignment.vertical]
                                        })
                                        .onTapGesture {
                                                activeIndex = count.index
                                        }
                                } else {
                                    PlayerBox(name: count.index.description, isActive: false)
                                        .onTapGesture {
                                            activeIndex = count.index
                                        }
                                }
                            }
                        }
                    }
                }
            }
            .padding(markerSize)
            
            ActivePlayerMarkerView(size: markerSize)
                .transition(AnyTransition.identity)
                .alignmentGuide(HorizontalAlignment.markerAlignment, computeValue: { dimension in
                    dimension[AlignmentObject.alignment(for: activeIndex).markerAlignment.horizontal]
                })
                .alignmentGuide(VerticalAlignment.markerAlignment, computeValue: { dimension in
                    dimension[AlignmentObject.alignment(for: activeIndex).markerAlignment.vertical]
                })
        }
        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)

    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
