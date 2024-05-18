//
//  DayRow.swift
//  WeatherApp
//
//  Created by Mina on 17/05/2024.
//

import SwiftUI

struct DayRow: View {
    var body: some View {
        HStack {
            Text("Today")
            
            Text("⛅️")
            Spacer()
            Text("7.8°")
            
            Text("Cloudy")
        }
        .font(.largeTitle)
        
    }
}

#Preview {
    DayRow()
}
