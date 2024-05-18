//
//  DetailsScreen.swift
//  WeatherApp
//
//  Created by Mina on 17/05/2024.
//

import SwiftUI

struct DetailsScreen: View {
    var detailsViewModel: DetailsViewModel?
    var body: some View {
        
        let hour = Calendar.current.component(.hour, from: Date())
        VStack {
            List(detailsViewModel?.getHours().hour ?? []) { item in
                HourlyRow(hour: item)
                    .listRowBackground(Color.white.opacity(0.2))
                
            }
            .contentMargins(.vertical, 0)
            .scrollContentBackground(.hidden)
        }.background {
            Image(hour > 6 && hour < 18 ? .day : .night)
        }.foregroundColor(hour > 6 && hour < 18 ? .black : .white)
        .onAppear {
            print("jaja")
            print(detailsViewModel?.getHours().hour.count ?? 0)
        }
    }
}

#Preview {
    DetailsScreen(detailsViewModel: nil)
}
