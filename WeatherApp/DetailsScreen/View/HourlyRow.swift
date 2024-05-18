//
//  HourlyRow.swift
//  WeatherApp
//
//  Created by Mina on 18/05/2024.
//

import SwiftUI

struct HourlyRow: View {
    var hour: Hour?
    var body: some View {
        HStack {
            
            Text(formatDateString(hour?.time ?? "Now") ?? "Now")
            Spacer()
            Text("⛅️")
            Spacer()
            Text("\(String(format: "%.1f", hour?.tempC ?? 15.0))°")
        }
        
        .font(.custom("Menlo", size: 18))
        
    }
    func formatDateString(_ dateString: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-M-d HH:mm"
        
        
        if let date = inputFormatter.date(from: dateString),
           Calendar.current.isDateInToday(date),
           Calendar.current.component(.hour, from: date) == Calendar.current.component(.hour, from: Date()) {
            return " Now "
        }
        
        
        guard let date = inputFormatter.date(from: dateString) else {
            print("Failed to parse date string: \(dateString)")
            return nil
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "hh a"
        outputFormatter.amSymbol = "AM"
        outputFormatter.pmSymbol = "PM"
        
        let formattedString = outputFormatter.string(from: date)
        return formattedString
    }
}

#Preview {
    HourlyRow()
}
