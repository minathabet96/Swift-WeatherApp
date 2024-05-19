//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Mina on 19/05/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.5).edgesIgnoringSafeArea(.all)
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .scaleEffect(2)
                .foregroundColor(.white)
        }.background(.blue)
    }
}

#Preview {
    LoadingView()
}
