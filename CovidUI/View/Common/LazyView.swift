//
//  LazyView.swift
//  CovidUI
//
//  Created by Daniel Plata on 16/04/2020.
//  Copyright © 2020 silverapps. All rights reserved.
//

import SwiftUI

struct LazyView<Content: View>: View {
    var content: () -> Content
    var body: some View {
       self.content()
    }
}
