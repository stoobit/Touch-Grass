//
//  ListLabelStyle.swift
//  Touch Grass
//
//  Created by Till Brügmann on 03.01.25.
//

import SwiftUI

struct ListLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.icon
                .foregroundStyle(Color.accentColor)
                .imageScale(.large)
                .frame(width: 20)
                .padding(.trailing, 7)
            
            configuration.title
                .foregroundStyle(Color.primary)
            
        }
    }
}
