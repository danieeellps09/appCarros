//
//  ImageBackgroundView.swift
//  irede-projeto1
//
//  Created by levi soares on 01/07/24.
//

import SwiftUI

struct ImageBackgroundView: View {
    var body: some View {
        Image("carrobkg4")
            .resizable()
            .ignoresSafeArea()
            .scaledToFill()
    }
}
#Preview {
    ImageBackgroundView()
}
