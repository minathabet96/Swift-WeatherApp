//
//  FailureView.swift
//  WeatherApp
//
//  Created by Mina on 19/05/2024.
//

import SwiftUI

struct FailureView: View {
    let hour = Calendar.current.component(.hour, from: Date())
    var body: some View {
        VStack {
            
            Text("Failed to fetch data..")
                .font(.custom("Menlo", size: 20))
            Text("Check your internet connection..")
                .font(.custom("Menlo", size: 18))
        }.background {
            Image(hour > 6 && hour < 18 ? .day : .night)
        }.foregroundColor(hour > 6 && hour < 18 ? .black : .white)
            
    }
}

#Preview {
    FailureView()
}
