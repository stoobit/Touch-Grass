//
//  BackgroundView.swift
//  Touch Grass
//
//  Created by Till Brügmann on 03.01.25.
//

import SwiftUI

struct BackgroundView: View {
    var style: BackgroundStyle? = nil
    
    init(_ style: BackgroundStyle? = nil) {
        self.style = style
    }
    
    var body: some View {
        ZStack {
            Image(.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 3)
                .scaleEffect(1.05)
                .clipped()
            
            if style == .decent {
                Rectangle()
                    .foregroundStyle(.regularMaterial)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
            }
        }
    }
}

enum BackgroundStyle {
    case decent
}

#Preview {
    BackgroundView()
}
