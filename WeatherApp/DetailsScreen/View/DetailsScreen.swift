//
//  DetailsScreen.swift
//  WeatherApp
//
//  Created by Mina on 17/05/2024.
//

import SwiftUI

struct DetailsScreen: View {
    var body: some View {
        let hour = Calendar.current.component(.hour, from: Date())
        VStack {
            
        }.background {
            Image(hour >= 18 ? .night : .day)
            }
    }
}

#Preview {
    DetailsScreen()
}
