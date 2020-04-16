//
//  BackButton.swift
//  CovidUI
//
//  Created by Daniel Plata on 16/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUI

struct BackButton: View {
    var image: String
    var color: Color

    init(color: Color, image: String = "back-btn") {
        self.color = color
        self.image = image
    }

    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 30, height: 30, alignment: .center)
                .foregroundColor(color)
        }
    }
}

struct BackButton_Previews: PreviewProvider {
    static var previews: some View {
        BackButton(color: .black)
    }
}
