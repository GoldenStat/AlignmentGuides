//
//  TokenizerViewModifier.swift
//  AlignmentGuides
//
//  Created by Alexander Völz on 25.03.21.
//

import SwiftUI

extension String {
    static let tokenNameSpace = "Token"
}

//
struct TokenizerViewModifier: ViewModifier{
//    var content: Content
//    var alignmentFinder: (PlayerGrid)->Alignment
    var tokenSize: CGFloat = 40
    var tokenEdge: Edge.Set
    var spacing: CGFloat { tokenSize / 4 }
    var nameSpace: Namespace.ID
    
    func body(content: Content) -> some View {
        if let alignment = tokenEdge.alignment {
            ZStack(alignment: alignment) {

                // a placeholder for the token
                TokenView(size: tokenSize, color: .clear)
                    .matchedGeometryEffect(id: String.tokenNameSpace, in: nameSpace)
                
                content
                    .padding(tokenEdge, tokenSize + spacing)
            }
        } else {
            ZStack {
                content
                Text("ERROR: aligment undefined for this Edge.Set")
            }
        }
    }
}

/// define alignments that correspond to edge sets
/// only very limited sets are defined
extension Edge.Set {
    var alignment: Alignment? {
        switch self {
        case .top:
            return .top
        case .bottom:
            return .bottom
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        default:
            return nil
        }
    }
}


extension View {
    func tokenize(edge: Edge.Set, nameSpace ns: Namespace.ID) -> some View { self.modifier(TokenizerViewModifier(tokenEdge: edge, nameSpace: ns))
        
    }
}

//struct TokenizerViewModifier_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerBox(name: "1")
//            .tokenize(edge: .trailing)
//    }
//}
